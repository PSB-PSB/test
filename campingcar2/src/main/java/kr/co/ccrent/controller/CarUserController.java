package kr.co.ccrent.controller;


 
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.protobuf.TextFormat.ParseException;

import kr.co.ccrent.dto.CarUserDTO;
import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.dto.PageMaker;
import kr.co.ccrent.service.CarUserService;
@Controller
public class CarUserController {
	
	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(CarUserController.class);
	
	@Autowired
	CarUserService car;
	
	  
	 
	//회원가입 페이지 이동
	@GetMapping(value="rent/join")
	public String nowtime(Model model) {
		System.out.println("===== JOIN =====");
		return "rent/join";
		
	}
	
//	회원가입 기능구현
	@PostMapping(value="rent/join")
	public ModelAndView register(CarUserDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		car.register(dto);
		mav.setViewName("rent/list");
		System.out.println("===== JOINING =====");
		return mav;
	}
	    
	
//	아이디 중복체크
	@RequestMapping(value = "rent/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
		logger.info("memberIdChk() 진입");
		
		int result = car.idCheck(memberId);
		
		logger.info("결과값 = " + result);
		if(result != 0) {
			
			return "fail"; //중복아이디 OK
			
		}else {
			return "success"; //중복아이디 x
		}
	}
	
	
//	로그인 페이지 이동
	@RequestMapping(value="rent/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("===== 로그인 폼 =====");
		return "rent/login";
	}
	
	
//	로그인 기능 구현
	@RequestMapping(value="rent/login", method = RequestMethod.POST)
	public String login(CarUserDTO carUserDTO, HttpServletRequest req) throws Exception{
		HttpSession session = req.getSession();
		CarUserDTO carUserDTO2 = car.login(carUserDTO);
		System.out.println(carUserDTO2.getCar_uid());
		
		if(carUserDTO2 == null) {
			session.setAttribute("user", null);
			return "login";
		}else {
			//로그인성공
			session.setAttribute("user", carUserDTO2);
			System.out.println("===== 로그인 완료 =====");
			return "redirect:/";
		}
	}
	
//	로그아웃
	@RequestMapping(value = "car/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, RedirectAttributes rttr) {
		System.out.println("===== 로그아웃 완료 =====");
		session.invalidate();
		rttr.addFlashAttribute("msg", "로그아웃되었습니다");
		return "redirect:/";
	}
 
	
//	회원정보 수정이동 
	@RequestMapping(value = "admin/user/update", method = RequestMethod.GET)
	public String update(@RequestParam("car_uno")int car_uno, Model model) throws Exception{
		CarUserDTO carUserDTO = car.detail(car_uno);
		model.addAttribute("list", carUserDTO);
		System.out.println(car_uno);
		return "admin/user/update";
	}
	
//	회원정보 수정
	@RequestMapping(value = "admin/user/update", method = RequestMethod.POST)
	public String update(@RequestParam("car_uno") int car_uno, RedirectAttributes rttr, CarUserDTO carUserDTO) throws Exception {
		int r = car.update(carUserDTO);
		
		if(r > 0) {
			rttr.addFlashAttribute("수정 완료하였습니다.");
			return "redirect:detail?car_uno="+car_uno;
		}
		return "redirect:detail?car_uno=" + car_uno;
	}
	
	
	
	
	
//	회원정보 리스트 이동
	@RequestMapping(value="List", method = RequestMethod.GET)
	public String List() throws Exception{
		System.out.println("===== 회원정보 리스트 =====");
		return "list";
	}
	

	// 회원정보 상세보기
		@RequestMapping(value="admin/user/detail", method = RequestMethod.GET)
		public String getdetail(Model model, int car_uno) throws Exception{
		
			//비지니스 모델, 서비스
			CarUserDTO carUserDTO = car.detail(car_uno);
			model.addAttribute("list",carUserDTO);
			
			return "admin/user/detail";
		}
	//회원정보 리스트 기능구현
//	@RequestMapping(value="list", method = RequestMethod.GET)
//	public ModelAndView getList() throws Exception{
//		System.out.println("===== 회원정보 리스트 =====");
//		ModelAndView mav = new ModelAndView();
//		
//		List<CarUserDTO> list = car.getlistPage(cri);
//		mav.addObject("list", list);
//		mav.setViewName("list");
//		
//		return mav;
//	}
	
//  리스트 전체목록 
//  @GetMapping(value = "list")
//  public ModelAndView getlistPage(Criteria cri, Model model) throws Exception {
//
//     System.out.println("===== list =====");
//     ModelAndView mav = new ModelAndView();
//
//     //페이징처리
//     PageMaker pageMaker = new PageMaker();
//     pageMaker.setCri(cri);
//     pageMaker.setTotalCount(car.getlistPage_count(cri));
//     model.addAttribute("pageMaker",pageMaker);   
//     
//     // 기능 수행
//     List<CarUserDTO> list = car.getlistPage(cri);
//     mav.addObject("list", list);
//     mav.setViewName("list");
//     
//           
//           
//     return mav;
//  }
  
//  검색기능
  @GetMapping(value="admin/user/list")
  public void garage_list(Criteria cri, Model model) throws Exception{
     System.out.println(cri.toString());
     model.addAttribute("list", car.getuser_se(cri));
     System.out.println(car.getuser_se_count(cri));
     
     //페이징처리
     PageMaker pageMaker = new PageMaker();
     pageMaker.setCri(cri);
     pageMaker.setTotalCount(car.getuser_se_count(cri));
    
     
     model.addAttribute("pageMaker",pageMaker);
     
     
  }
	

	

	
//	회원탈퇴 기능구현
	@RequestMapping(value="admin/user/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("car_uno") int car_uno, RedirectAttributes rttr) throws Exception{
		int r = car.delete(car_uno);
		
		if(r > 0) {
			rttr.addFlashAttribute("회원 탈퇴 하였습니다.");
			return "redirect:list?keyword=";
		}
		return "redirect:detail?car_uno=" + car_uno;
	}
	
	//검색 기능구현
}
