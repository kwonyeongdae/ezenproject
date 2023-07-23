package com.ezen.spring.board.teampro.admin;

import java.io.File;
import java.io.IOException;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

import com.ezen.spring.board.teampro.BookVO;
import com.ezen.spring.mb2.FileVO;
@Controller
@RequestMapping("/admin")
@SessionAttributes("userid")
public class AdmainController {
	
	@Autowired
	@Qualifier("admindao")
	AdminDAO admindao;
	
	@Autowired
	@Qualifier("adminvo")
	AdminVO vo;

	@GetMapping("/list")
	public String getlist(Model model) {
		List<AdminVO> alist = new ArrayList<>();
		alist = admindao.getBylist();
		model.addAttribute("alist",alist);
		return "admin/Adminlist";
	}
	
	@GetMapping("/list/data")
	public String getday(@RequestParam("category") String category,
            @RequestParam("key") String key,Model model) {
		
		List<AdminVO> daylist = new ArrayList<>();
		if (category.equals("day")) {
	        // 일별 데이터 조회를 위한 SQL 쿼리 실행
			daylist = admindao.getByDay(key);
	    } else if (category.equals("month")) {
	        // 월별 데이터 조회를 위한 SQL 쿼리 실행
	    	 String year = key.substring(0, 4);
	    	 String month = key.substring(5, 7);
	    	daylist = admindao.getByMonth(year,month);
	    } else if (category.equals("year")) {
	        // 연도별 데이터 조회를 위한 SQL 쿼리 실행
	    	daylist = admindao.getByYear(key);
	    }else if (category.equals("uid")) {
	        // 연도별 데이터 조회를 위한 SQL 쿼리 실행
	    	daylist = admindao.getById(key);
	    }
		model.addAttribute("daylist",daylist);
		return "admin/Adminlist";
	}
	@GetMapping("/adbooklist/{pn}")
	public String adbooklist(@PathVariable int pn 
			,@RequestParam(value="category", required=false) String category,
			@RequestParam(value="keyword", required=false) String keyword, Model model)
	{
		PageInfo<Map> pageInfo = null;
		
		if(category != null)
		{
			pageInfo = admindao.search(category, keyword,1);
			model.addAttribute("category",category);
			model.addAttribute("keyword",keyword);
		}else {
			pageInfo = admindao.getallbook(pn);
		}
		model.addAttribute("pageInfo",pageInfo);		
		return "admin/adbooklist";
	}
	
	@PostMapping("/search")
	public String search(@RequestParam("category") String category,
			 @RequestParam("keyword") String keyword,
			 Model model)
	{
		PageInfo<Map> pageInfo = admindao.search(category, keyword,1);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("category",category);
		model.addAttribute("keyword",keyword);
		
		return "admin/adbooklist";
		
	}
	@GetMapping("/detail/{bnum}")
	public String detail(Model model , @PathVariable int bnum)
	{
		List<BookVO> list = new ArrayList<>();
		list = admindao.getbook(bnum);
		model.addAttribute("book" , list);
		
		return "admin/editform";
	}
	@PostMapping("/update")
	@ResponseBody
	public Map<String,Boolean> update(@ModelAttribute BookVO book ,
			HttpServletRequest request)
	{
		Map<String,Boolean> map = new HashMap<>();
		/*ServletContext context = request.getServletContext();
	    String savePath = context.getRealPath("/webapp/img");
	    List<FileVO> fileList = new ArrayList<>();
	    FileVO vo = new FileVO();
		
		fileList.add(vo);*/
		
		boolean success = admindao.updateBook(book);
		map.put("update", success);
	    
	    
	    
		
		
		
		
		return map;
		
	}
	
	
}
