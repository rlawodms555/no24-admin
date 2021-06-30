package com.example.demo.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dto.ActorDto;
import com.example.demo.dto.ShowDto;
import com.example.demo.service.ActorService;
import com.example.demo.service.PlaceService;
import com.example.demo.service.PutShowService;
import com.example.demo.service.ShowService;
import com.example.demo.vo.Category;
import com.example.demo.vo.Place;
import com.example.demo.vo.PutShow;
import com.example.demo.vo.Show;
import com.example.demo.web.form.ShowForm;

@Controller
@RequestMapping("/show")
public class ShowController {

	@Value("${directory.aboutShow.photo}") 
	String aboutShowDirectory;
  
	@Value("${directory.attention.photo}") 
	String attentionDirectory;
  
	@Value("${directory.sale.photo}") 
	String saleDirectory;
	
	@Autowired
	ShowService showService;
	
	@Autowired
	PutShowService putShowService;
	
	@Autowired
	PlaceService placeService;
	
	@Autowired
	ActorService actorService;
	
	/*
	 * 공연(show)부터 시작합니다.
	 */
	@RequestMapping("/list.do")
	public String list(@RequestParam(name = "catno", required = false, defaultValue = "-1") int categoryNo,
					@RequestParam(name = "opt", required = false, defaultValue = "title") String opt,
					@RequestParam(name = "keyword", required = false) String keyword,
					@RequestParam(name = "sort", required = false, defaultValue = "date") String sort,
					@RequestParam(name = "pageNo", required = false, defaultValue = "1") int pageNo,
					@RequestParam(name = "rows", required = false, defaultValue = "10") int rows,
					Model model) {
		
		// 공연 검색조건을 저장하는 Map객체 생성
		Map<String, Object> condition = new HashMap<String, Object>();

		if (categoryNo != -1) {
			condition.put("categoryNo", categoryNo);
		}
		
		if (opt != null && !opt.isEmpty() && keyword != null && !keyword.isEmpty()) {
			condition.put("opt", opt);
			condition.put("keyword", keyword);
		}
		
		condition.put("pageNo", pageNo);
		condition.put("rows", rows);
		condition.put("begin", (pageNo - 1) * rows + 1);
		condition.put("end", pageNo * rows);
		condition.put("sort", sort);
		
		// 뷰에 표시할 공연 정보와 페이징 정보를 조회한다.
		Map<String, Object> resultMap = showService.getShows(condition);
		
		// 상위 카테고리 정보를 조회해서 담는다.
		List<Category> topCategories = showService.getAllTopCategories();
		
		model.addAttribute("page", resultMap.get("pagination"));
		model.addAttribute("shows", resultMap.get("shows"));
		model.addAttribute("topCategories", topCategories);
		
		return "show/list";
	}
	
	@RequestMapping("detail.do")
	public String detail(@RequestParam("showNo") int showNo, Model model) {
		ShowDto show = showService.getShowByNo(showNo);
		// 카테고리 번호를 통해 테이블 조회
		Category category = showService.getCategoryByNo(show.getCategoryNo());
		// 상위 카테고리를 조회해서 상위 카테고리 정보 조회
		Category topCategory = showService.getCategoryByNo(category.getTopCategoryNo());
		// 장소
		Place place = placeService.getPlaceByNo(show.getPlaceNo());
		// 상연
		List<PutShow> putShows = putShowService.getPutShowByshowNo(showNo);
		for (PutShow p : putShows) {
			System.out.println("상연 맞는지 보자" + p); // 잘 나옴
			
		}
		
		List<ActorDto> actorDtos = new ArrayList<ActorDto>();
		for(PutShow putShow : putShows) {
			actorDtos = actorService.getActorByPutShowNo(putShow.getNo());
			System.out.println("누구나오는지 보자" + actorDtos);
		}
		
		model.addAttribute("show", show);
		model.addAttribute("category", category);
		model.addAttribute("topCategory", topCategory);
		model.addAttribute("place", place);
		
		model.addAttribute("actors", actorDtos);
		
		// 상연정보도 모델에 담아서 뿌려야 해
		return "show/detail";
	}
	
	@RequestMapping("/form.do")
	public String form(Model model) {
		List<Place> placeList = placeService.getAllPlaces();
		model.addAttribute("placeList", placeList);
		return "show/form";
	}
	
	@RequestMapping("/register.do")
	public String register(@RequestParam("place") int placeNo, ShowForm showForm) throws IOException {
		// Show객체를 생성해서 ShowForm객체의 값을 복사한다.
		// MultipartFile타입의 객체가 복사되지 않도록 한다.(Show와 ShowForm에서 각각 다른 이름을 사용한다.)
		Show show = new Show();
		
		BeanUtils.copyProperties(showForm, show);
		
		show.setPlaceNo(placeNo);
		System.out.println("장소번호 테스트입니다: " + show.getPlaceNo());
		
		// 공연 포스터 이미지
		// 클라이언트에서 업로드한 첨부파일을 지정된 위치의 디렉토리에 복사하기
		MultipartFile photofile = showForm.getPosterfile();
		System.out.println("테스트입니다"+ photofile);
		System.out.println("showform제대로 나오낭" + showForm);
		if (!photofile.isEmpty()) {	// 업로드된 첨부파일이 존재하는 경우
			// 업로드 된 파일의 이름 획득
			String filename = photofile.getOriginalFilename();
			// 원래 파일명에 유닉스타임값을 붙여서 파일이름이 중복되지 않도록 한다.
			filename = System.currentTimeMillis() + filename;
			// 지정된 디렉토리에 해당 파일명으로 파일객체 생성
			File file = new File(aboutShowDirectory, filename);
			// MultipartFile객체의 getInputStream() 메소드로 업로드된 첨부파일을 읽어서 
			// FileOutputStream으로 지정된 File객체가 가르키는 곳에 업로드된 첨부파일을 복사한다.
			FileCopyUtils.copy(photofile.getInputStream(), new FileOutputStream(file));
			// 파일의 이름을 db에 저장하기 위해서 User객체에 저장한다.
			show.setPosterImg(filename);
		} else {
			show.setPosterImg("noImage.png");
		}
		
		System.out.println("공연포스터 이미지입니다" + show.getPosterImg());
		
		// 유의사항 이미지
		MultipartFile photofile2 = showForm.getAttentionfile();
		if (!photofile2.isEmpty()) {
			String filename2 = photofile2.getOriginalFilename();
			filename2 = System.currentTimeMillis() + filename2;
			File file = new File(attentionDirectory, filename2);
			FileCopyUtils.copy(photofile2.getInputStream(), new FileOutputStream(file));
			show.setAttentionImg(filename2);
		} else {
			show.setAttentionImg("noImage.png");
		}
		
		System.out.println("유의사항 이미지입니다" + show.getAttentionImg());
		
		// 할인정보 이미지
		MultipartFile photofile3 = showForm.getSalefile();
		if (!photofile3.isEmpty()) {
			String filename3 = photofile3.getOriginalFilename();
			filename3 = System.currentTimeMillis() + filename3;
			File file = new File(saleDirectory, filename3);
			FileCopyUtils.copy(photofile3.getInputStream(), new FileOutputStream(file));
			show.setSaleImg(filename3);
		} else {
			show.setSaleImg("noImage.png");
		}
		System.out.println("할인정보 이미지입니다" + show.getSaleImg());
		
		// 공연정보 이미지
		MultipartFile photofile4 = showForm.getShowDetailfile();
		if (!photofile4.isEmpty()) {
			String filename4 = photofile4.getOriginalFilename();
			filename4 = System.currentTimeMillis() + filename4;
			File file = new File(aboutShowDirectory, filename4);
			FileCopyUtils.copy(photofile3.getInputStream(), new FileOutputStream(file));
			show.setShowDetailImg(filename4);;
		} else {
			show.setShowDetailImg("noImage.png");
		}
		System.out.println("공연정보 이미지입니다" + show.getShowDetailImg());
		
		// 신규 공연을 등록한다.
		showService.insertShow(show);
		
		return "redirect:list.do";
	}
	
	// 등록완료
	@RequestMapping("completed.do")
	public String completed() {
		return "show/completed";
	}
	
	// 공연정보 수정 폼
	@RequestMapping("/modifyForm.do")
	public String modifyForm(@RequestParam("showNo") int showNo, Model model) {
		model.addAttribute("show", showService.getShowByNo(showNo));
		return "show/modifyForm";
	}
	
	// 공연삭제
	@RequestMapping("/deleteShow.do")
	public String delete(@RequestParam("showNo") List<Integer> showNoList) {
		
		for (int showNo : showNoList) {
			showService.deleteShow(showNo);
		}
		
		return "redirect:list.do";
	}
	
	/*
	 * 여기서부터 상연(putShow)입니다.
	 */
	
	// 상연등록 폼
	@RequestMapping("/putShowForm.do")
	public String pubShowForm(Model model) {
		
		model.addAttribute("shows", showService.getAllShows());
		return "show/putShowForm";
	}
	
	// 상연등록
	@RequestMapping("/putShowRegister.do")
	public String putShowRegister(@RequestParam("showNo") int showNo, @RequestParam("day") String showDay, @RequestParam("startTime") String showStartTime) {
		
		PutShow putShow = new PutShow();
		putShow.setShowNo(showNo);
		putShow.setShowDay(showDay);
		putShow.setShowStartTime(showStartTime);
		putShowService.insertPutShow(putShow);
		
		return "redirect:list.do";
	}
	
	
	
	
	/*
	 * 여기서부터 공연장소(place)입니다.
	 */
	@RequestMapping("/place/list.do")
	public String placeList(@RequestParam(name = "opt", required = false, defaultValue = "name") String opt,
			@RequestParam(name = "keyword", required = false) String keyword,
			@RequestParam(name = "local", required = false) String local,
			@RequestParam(name = "sort", required = false, defaultValue = "date") String sort,
			@RequestParam(name = "pageNo", required = false, defaultValue = "1") int pageNo,
			@RequestParam(name = "rows", required = false, defaultValue = "10") int rows,
			Model model) {
		
		// 공연 장소 검색조건을 저장하는 Map객체 생성
		Map<String, Object> condition = new HashMap<String, Object>();
		
		if (opt != null && !opt.isEmpty() && keyword != null && !keyword.isEmpty()) {
			condition.put("opt", opt);
			condition.put("keyword", keyword);
		}
		
		if (local != null && !local.isEmpty()) {
			condition.put("local", local);
		}
		
		condition.put("pageNo", pageNo);
		condition.put("rows", rows);
		condition.put("begin", (pageNo - 1) * rows + 1);
		condition.put("end", pageNo * rows);
		condition.put("sort", sort);
		
		// 뷰에 표시할 공지 정보와 페이징 정보를 조회한다.
		Map<String, Object> resultMap = placeService.getPlaces(condition);
		
		System.out.println(resultMap);
		
		model.addAttribute("page", resultMap.get("pagination"));
		model.addAttribute("places", resultMap.get("places"));
		
		return "show/place/list";
	}
	
	// 공연장소 상세정보
	@RequestMapping("/place/detail.do")
	public String placeDetail(Model model) {
		
		return "show/place/detail";
	}
	
	// 공연장소 등록
	@RequestMapping("/place/register.do")
	public String placeRegister(@RequestParam("localName") String localName,
								@RequestParam("placeName") String placeName,
								@RequestParam(name = "address", required = false) String address,
								@RequestParam("seatCapacity") int seatCapacity,
								@RequestParam(name = "roadAddress", required = false) String roadAddress,
								@RequestParam(name = "detailAddress", required = false) String detailAddress,
								@RequestParam(name = "extraAddress", required = false) String extraAddress
								) {
		
		Place place = new Place();
		place.setLocalName(localName);
		place.setPlaceName(placeName);
		if (!address.isEmpty()) {
			place.setAddress(address);
		}
		
		if (!roadAddress.isEmpty()) {
			place.setAddress(roadAddress + " " + detailAddress + " " + extraAddress);
		}
		place.setSeatCapacity(seatCapacity);
		
		placeService.insertPlace(place);
		
		return "redirect:list.do";
	}
	
	// 공연장소 삭제
	@RequestMapping("/place/deletePlace.do")
	public String deletePlace(@RequestParam("placeNo") List<Integer> placeNoList) {
		
		for (int placeNo :placeNoList) {
			placeService.deletePlace(placeNo);
		}
		
		return "redirect:list.do";
	}
	
}
