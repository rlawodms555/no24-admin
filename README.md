# no24-admin
공연 예매 사이트인 NO24의 관리자 페이지

https://github.com/ts560518/spring-no 와 연동

------------

## [DB] ERD
![image](https://user-images.githubusercontent.com/79544660/123899157-9c4a2900-d9a1-11eb-8b61-d248f87b1f69.png)

------------

## 프로젝트 이미지
![image](https://user-images.githubusercontent.com/79544660/123899227-bc79e800-d9a1-11eb-8f43-3a7389153ee9.png)

- 사용자 페이지와 프로젝트 경로가 분리된 관리자 페이지의 로그인 화면 
- 아이디 입력
- 비밀번호 입력
- 비밀번호가 일치하지 않으면 에러 메시지 호출 
- 로그인을 시도한 계정의 권한이 ADMIN이 아닐 경우 에러 메시지 호출

![image](https://user-images.githubusercontent.com/79544660/123899234-c00d6f00-d9a1-11eb-993a-b9527b3bcb27.png)

- 공지사항 및 공연정보를 메인 페이지에서 미리보기로 볼 수 있음

![image](https://user-images.githubusercontent.com/79544660/123899244-c3a0f600-d9a1-11eb-9778-c17ccc65d9ee.png)

- 아이디, 이름으로 회원 검색을 할 수 있음 
- 가입일순, 이름순으로 오름차순 정렬을 할 수 있음
- 한 페이지에 10명의 회원 목록을 보여줌

![image](https://user-images.githubusercontent.com/79544660/123899355-ffd45680-d9a1-11eb-981f-d3256ee2c022.png)

- 회원정보 리스트에서 선택한 회원의 상세 정보를 확인할 수 있음
- 회원 강제 탈퇴 처리가 가능함

![image](https://user-images.githubusercontent.com/79544660/123899408-1b3f6180-d9a2-11eb-8549-08fe5b8d8668.png)

- 아이디, 이름으로 탈퇴 회원 검색을 할 수 있음 
- 가입일순, 이름순으로 오름차순 정렬을 할 수 있음
- 한 페이지에 10명의 탈퇴 회원 목록을 보여줌

![image](https://user-images.githubusercontent.com/79544660/123899417-20041580-d9a2-11eb-8fbd-da599de2696f.png)

- 탈퇴 회원 리스트에서 선택한 회원의 상세 정보를 조회할 수 있음
- 회원의 탈퇴일자가 기록되어 있음

![image](https://user-images.githubusercontent.com/79544660/123899426-22ff0600-d9a2-11eb-9d7d-592a8f9b2f4d.png)

- 공연명을 검색할 수 있음
- 최근등록순, 종료일 늦은순으로 정렬을 할 수 있음
- 공연명을 클릭하면 사용자 페이지의 공연 상세 정보로 연결됨
- 한 페이지에 10개의 공연목록을 보여줌

![image](https://user-images.githubusercontent.com/79544660/123899433-26928d00-d9a2-11eb-8631-98ce40453c8a.png)

- 장소, 주소로 공연장소를 검색할 수 있음
- 지역별로 정렬이 가능함
- 한 페이지에 10개의 공연장소 목록을 보여줌

![image](https://user-images.githubusercontent.com/79544660/123899505-4e81f080-d9a2-11eb-899c-ab88cae89ced.png)

- 신규 공연장소 등록이 가능함
- 주소찾기 API로 주소를 입력할 수도 있음

![image](https://user-images.githubusercontent.com/79544660/123899513-517ce100-d9a2-11eb-9250-e41eeb3babf0.png)

- 신규 공연 등록이 가능함
- 미입력할 경우 등록 불가

![image](https://user-images.githubusercontent.com/79544660/123899524-5477d180-d9a2-11eb-85ba-171e98a890ac.png)

- 등록된 공연에 대한 상연 등록이 가능함
- 미입력할 경우 등록 불가

![image](https://user-images.githubusercontent.com/79544660/123899532-5772c200-d9a2-11eb-8455-4c112b0a8362.png)

- 아이디로 예매 내역을 조회할 수 있음
- 한 페이지에 10건의 주문을 보여줌

![image](https://user-images.githubusercontent.com/79544660/123899589-75402700-d9a2-11eb-9f64-f3366cefc39c.png)

- 카테고리별 월 예매횟수를 그래프로 조회할 수 있음
- 카테고리별 월 매출액을 그래프로 조회할 수 있음

![image](https://user-images.githubusercontent.com/79544660/123899595-783b1780-d9a2-11eb-8a5d-e319d14f7baa.png)

- 아이디와 작성내용으로 리뷰를 검색할 수 있음 
- 최근등록순, 높은평점순으로 정렬이 가능함
- 한 페이지에 10개의 공연리뷰를 보여줌
- 운영규정에 위반되는 리뷰는 직권 삭제가 가능함

![image](https://user-images.githubusercontent.com/79544660/123899603-7b360800-d9a2-11eb-9a79-2173b1e69435.png)

- 아이디와 작성내용으로 삭제된 리뷰를 검색할 수 있음 
- 최근등록순, 높은평점순으로 정렬이 가능함
- 한 페이지에 10개의 공연리뷰를 보여줌

![image](https://user-images.githubusercontent.com/79544660/123899610-7ec98f00-d9a2-11eb-8625-515e219bce1d.png)

- 제목과 내용으로 공지를 검색할 수 있음 
- 최근등록순, 조회순으로 정렬이 가능함
- 한 페이지에 10개의 공지 보여줌
- 공지 등록, 수정, 삭제가 가능함

![image](https://user-images.githubusercontent.com/79544660/123899685-a15ba800-d9a2-11eb-88e0-ace22ae0a635.png)

- 공지사항 상세 조회가 가능함
- 공지 수정 및 삭제가 가능함

![image](https://user-images.githubusercontent.com/79544660/123899690-a4ef2f00-d9a2-11eb-8d84-9de9ef3932c6.png)

- 작성된 공지를 수정할 수 있음

![image](https://user-images.githubusercontent.com/79544660/123899704-a7ea1f80-d9a2-11eb-9709-de8ff69244c4.png)

- 신규 공지를 등록할 수 있음

