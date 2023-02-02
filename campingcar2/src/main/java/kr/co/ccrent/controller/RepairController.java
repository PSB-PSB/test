package kr.co.ccrent.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import kr.co.ccrent.dto.GarageDTO;
import kr.co.ccrent.dto.RepairDTO;
import kr.co.ccrent.service.RepairService;

@Controller
public class RepairController {

	
	@Autowired
	RepairService service;
		
		//캠핑카이동
		@GetMapping(value = "/repair/carrent")
		public String moverent() {
			
			return "/repair/carrent";
		}
	
		
		// 캠핑카 정보 불러오기
		@GetMapping(value ="/repair/detail")
		public String repair_modify(Model model, HttpServletRequest req, int repair_no) {
		System.out.println("detail/update 접근");
		RepairDTO dto = service.repair_getOne(repair_no);
					
		model.addAttribute("repair",dto);
				
		return "/repair/detail";
		}

		
		
	
		
		
		
		
	
			
			

		
		
		
		
		
	
}
