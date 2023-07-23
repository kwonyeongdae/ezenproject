package com.ezen.spring.board.teampro.admin;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.ezen.spring.board.teampro.BookVO;

@Component("adminmapper")
@Mapper
public interface AdminMapper {

	public List<AdminVO> getlist();
	public List<AdminVO> getByDay(String key);
	public List<AdminVO> getByMonth(String year,String month);
	public List<AdminVO> getByYear(String key);
	public List<AdminVO> getByid(String key);
	public List<Map<String,String>> getallbook();
	public List<Map> search(BookVO vo);
	public List<BookVO> getbook(int bnum);
	public int updateBook(BookVO VO);
}
