package kr.co.ccrent.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ccrent.config.DateProcess;
import kr.co.ccrent.dto.CarDTO;
import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.dto.GarageDTO;
import kr.co.ccrent.dto.PageMaker;
import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.dto.RentDTO;
import kr.co.ccrent.dto.RepairDTO;
import kr.co.ccrent.service.BoardFileService;
import kr.co.ccrent.service.CarService;
import kr.co.ccrent.service.GarageService;
import kr.co.ccrent.service.RentService;
import kr.co.ccrent.service.RepairService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	private final CarService carService;
	private final RentService rentService;
	private final BoardFileService boardFileService;
	private final DateProcess dateProcess;
	private final RepairService repairService;
	private final GarageService garageService;
	
	
	
	@GetMapping(value={"/",""})
	public String indexGET() {
		System.out.println("<Admin Controller> index GET");
		return "/admin/index";
	}
	@GetMapping("/car/register")
	public void registerGET(Model model, String car_regid) {
		if(car_regid!=null) {
			System.out.println("<Controller> modify GET ==============================");
			model.addAttribute("dto", carService.getOne(Integer.parseInt(car_regid)));
			HashMap<String, Object> fieldmap = new HashMap<>();
			fieldmap.put("bo_table", "car");
			fieldmap.put("wr_id", car_regid);		
			model.addAttribute("filelist", boardFileService.getFileList(fieldmap));			
			
		}else {
			System.out.println("<Controller> register GET ==============================");
		}
	}
	@PostMapping("/car/register")
	public String registerPOST(CarDTO carDTO, @RequestParam("file") MultipartFile[] file, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		System.out.println("<Admin Controller> register POST");
		System.out.println(carDTO);
		// carService.register(carDTO, file, request, request.getParameter("order"));
		carService.register(carDTO, request);
		return "redirect:/admin/car/list";

	}
	@PostMapping("/car/modify")
	public String modifyPOST(CarDTO carDTO, HttpServletRequest request) {
		System.out.println("<Controller> modify POST ==============================");
		System.out.println(carDTO);
		carService.modify(carDTO, request);
		return "redirect:/admin/car/list";
	}	
	@GetMapping("/car/list")
	public void carListGET(Model model, PageRequestDTO pageRequestDTO) {
		System.out.println("<Admin Controller> car list GET");
		System.out.println(pageRequestDTO);
		// model.addAttribute("dtolist", carService.getAll());
		model.addAttribute("responseDTO", carService.getList(pageRequestDTO));
	}
	@GetMapping("/car/read")
	public void carReadGET(Model model, int car_regid) {
		System.out.println("<Controller> read GET ==============================");
		model.addAttribute("dto", carService.getOne(car_regid));
		HashMap<String, Object> fieldmap = new HashMap<>();
		fieldmap.put("bo_table", "car");
		fieldmap.put("wr_id", car_regid);		
		model.addAttribute("filelist", boardFileService.getFileList(fieldmap));
		//repair접근(등록/조회/수정가능하게 DTO접근)
		//정비내역 확인하기
		System.out.println("==<admin Controller> repairData = read");
		RepairDTO dto = repairService.repair_getOne(car_regid); 
		model.addAttribute("repair",dto);
	}
	// 정비내역 등록 form
	@PostMapping(value = "/car/repair/register")
	public String repair_register(RepairDTO dto, HttpServletRequest req, int car_regid) throws Exception {
		req.setCharacterEncoding("utf-8");
		System.out.println("==<admin Controller> repairData = register");
		repairService.repair_register(dto);
		return "redirect:/admin/car/read?car_regid=" + car_regid;
	}
	//정비소 정보수정 실행
	@PostMapping(value = "/car/read")
	public String repair_update(RepairDTO dto, int car_regid) throws Exception{
			
		repairService.repair_modify(dto);
		System.out.println("==<admin Controller> repairData = update");
			
		return "redirect:/admin/car/read?car_regid=" + car_regid;
	}
	//캠핑카 정비내역 삭제
	@GetMapping(value="/car/repair/remove")
	public String repair_remove(int car_regid) {			
		repairService.repair_remove(car_regid);
		System.out.println("==<admin Controller> repairData = remove");
		return "redirect:/admin/car/read?car_regid=" + car_regid;
	}	
	@PostMapping("/car/remove")
	public String removePOST(int car_regid) {
		System.out.println("<Controller> remove POST ==============================");
		carService.remove(car_regid);
		return "redirect:/admin/car/list";
	}
	
	/*========================================================================================== 예약 */
	@GetMapping("/rent/today")
	public void rentTodayGET(Model model) {
		System.out.println("<Admin Controller> rent today GET");
		model.addAttribute("startlist", rentService.getTodayStart(dateProcess.today()));
		model.addAttribute("endlist", rentService.getTodayEnd(dateProcess.today()));
	}
	@GetMapping("/rent/calendar")
	public void rentCalendarGET(Model model, String curYear, String curMon) {
		System.out.println("<Admin Controller> rent list GET");
		model.addAttribute("carlist", carService.getAll());
		HashMap<String, Object> datemap = dateProcess.dateCalculate(curYear, curMon, 0);	
		HashMap<Integer, Object> maplist = new HashMap<>();
		HashMap<String, Object> varmap = new HashMap<>();
		List<CarDTO> carlist = carService.getAll();
		System.out.println(datemap.get("firstday"));
		System.out.println(datemap.get("lastday"));
		for(int i=0; i<carlist.size(); i++) {
			varmap.clear();
			varmap.put("car_regid", carlist.get(i).getCar_regid());
			varmap.put("firstday", datemap.get("firstday"));
			varmap.put("lastday", datemap.get("lastday"));			
			varmap.put("dummy", "1");			
			maplist.put(carlist.get(i).getCar_regid(), rentService.getByCarId(varmap));
		}
		model.addAttribute("maplist", maplist);		
	}
	@GetMapping("/rent/list")
	public void rentListGET(Model model, PageRequestDTO pageRequestDTO) {
		System.out.println("<Admin Controller> list GET");
		System.out.println(pageRequestDTO);
		model.addAttribute("responseDTO", rentService.getList(pageRequestDTO));
	}	
	@GetMapping("/rent/read")
	public void rentReadGET(Model model, int rent_id) {
		model.addAttribute("dto", rentService.getOne(rent_id));
	}
	@PostMapping("/rent/read")
	public String rentReadPost(RentDTO rentDTO, String listtype) {
		System.out.println("<Admin Controller> rent read POST");
		System.out.println(rentDTO);
		rentService.modifyState(rentDTO);
		return "redirect:/admin/rent/read?rent_id="+rentDTO.getRent_id()+"&listtype="+listtype;	
	}
	@PostMapping("/rent/remove")
	public String rentRemovePOST(String listtype, int rent_id) {
		System.out.println("<Admin Controller> rent remove POST");
		rentService.remove(rent_id);
		return "redirect:/admin/rent/"+listtype;
	}
	
	
	
	//=======================================garage / 정비소	
	
//	정비소 등록 신청 리스트 전체목록 
	@GetMapping(value = "/garage/register")
	public ModelAndView garage_reglistAll(Criteria cri, Model model) throws Exception {

		System.out.println("==<admin Controller> garage = registerlist");
		ModelAndView mav = new ModelAndView();

		//페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(garageService.garage_get_regcount(cri));
		model.addAttribute("pageMaker",pageMaker);		
		
		// 기능 수행		
		List<GarageDTO> list = garageService.garage_get_reg(cri);
		mav.addObject("garage_reglist", list);		
		mav.setViewName("admin/garage/register");	
				
		return mav;
	}
	// 등록신청승인 (no갖고와서 insert하기)
	@GetMapping(value = "garage/insert")
	public String garage_register(Model model, HttpServletRequest req, int garage_no) throws Exception {

		GarageDTO dto = garageService.garage_modify_get(garage_no); // garage_no 갖고오기
		garageService.garage_register_admin(dto);
		
		System.out.println("==<admin Controller> garage = register success");
		

		return "redirect:/admin/garage/register";
	}
	
	//정비소검색
	@GetMapping(value="garage/list")
	public void garage_updatelist(Criteria cri, Model model) throws Exception{
		System.out.println("==<admin Controller> garage = list");
		model.addAttribute("list", garageService.garage_get(cri));
		
		//페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(garageService.garage_get_count(cri));
		
		model.addAttribute("pageMaker",pageMaker);
		
		
	}
	
	
	//정비소 정보수정 이동
	@GetMapping(value="/garage/update")
	public String garage_updatepage(int garage_no, Model model) throws Exception {
		System.out.println("==<admin Controller> garage = update");
		
		GarageDTO dto = garageService.garage_modify_get(garage_no); //수정할 garage_no 갖고오기		
		
		model.addAttribute("dto",dto);
	
		return "/admin/garage/update";
	}
	
	//정비소 정보수정 입력폼
	@PostMapping(value = "/garage/update")
	public String garage_update(GarageDTO dto, int garage_no) throws Exception{
		
		
		garageService.garage_modify(dto);
		System.out.println("==<admin Controller> garage = update success");
		
		return "redirect:/admin/garage/list?keyword=";
		
	}
	
		//정비소 등록신청탭 등록거부(삭제)
		@GetMapping(value="/garage/delete")
		public String garage_remove(int garage_no) {

		
		garageService.garage_remove(garage_no);
		System.out.println("==<admin Controller> garage = registerRemove");
		
		return "redirect:/admin/garage/register";
	}	
		
		
		//정비소 수정 (정비소 삭제)
		@GetMapping(value="/garage/update_delete")
		public String garage_update_remove(int garage_no) {

		
		garageService.garage_remove(garage_no);
		System.out.println("==<admin Controller> garage = registerRemove");
		
		return "redirect:/admin/garage/list?keyword=";
	}	
	
	
	
}
