package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Category;

@Mapper
public interface CategoryDao {

	List<Category> getAllCategories();
	List<Category> getAllTopCategories();
	List<Category> getCategoryByTopNo(int TopNo);
	Category getCategoryByNo(int categoryNo);
}
