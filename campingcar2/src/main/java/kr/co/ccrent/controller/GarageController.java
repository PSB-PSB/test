package kr.co.ccrent.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.dto.GarageDTO;
import kr.co.ccrent.dto.PageMaker;
import kr.co.ccrent.service.GarageService;

@Controller
public class GarageController {
	
	
	@Autowired	
	GarageService service;

   //정비소 등록신청
	@GetMapping(value="garage/register")
	public String g_register() {
		System.out.println("정비소 등록신청 페이지입니다.");
		return "garage/register";		
	}
	//정비소 등록신청form
	@PostMapping(value = "garage/register")
	public String register(GarageDTO dto, HttpServletRequest req) throws Exception{
		req.setCharacterEncoding("utf-8");
		System.out.println("정비소 등록신청 접근성공");
	
		service.garage_register(dto);
		return "redirect:/";
		
	}
	
	
	
	//정비소검색
	@GetMapping(value="garage/list")
	public void garage_list(Criteria cri, Model model) throws Exception{
		System.out.println(cri.toString());
		model.addAttribute("list", service.garage_get(cri));
		
		//페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.garage_get_count(cri));
		
		model.addAttribute("pageMaker",pageMaker);
	}
	

		
		
		
		
				
		
	
	
}

	
	
	

