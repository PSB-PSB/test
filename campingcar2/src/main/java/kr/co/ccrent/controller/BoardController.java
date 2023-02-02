package kr.co.ccrent.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ccrent.dto.BoardDTO;
import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.service.BoardFileService;
import kr.co.ccrent.service.BoardService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService boardService;
	private final BoardFileService boardFileService;
	
	@GetMapping("/register")
	public void register() {
		System.out.println("<Board Controller> register GET");
	}
	@PostMapping("/register")
	public String registerPOST(String bo_table, @RequestParam("file") MultipartFile[] file, RedirectAttributes redirectAttributes, BoardDTO boardDTO, HttpServletRequest request) {
		System.out.println("<Board Controller> register POST");
		System.out.println(boardDTO);
		boardService.register(boardDTO, file, request);
		return "redirect:/board/list?bo_table="+bo_table;
	}
	@GetMapping("/list")
	public void listGET(Model model, PageRequestDTO pageRequestDTO) {
		System.out.println("<Board Controller> list GET");
		model.addAttribute("responseDTO", boardService.getList(pageRequestDTO));
	}
	@GetMapping("/read")
	public void readGET(Model model, String bo_table, int wr_id, PageRequestDTO pageRequestDTO) {
		System.out.println("<Board Controller> read GET");
		HashMap<String, Object> fieldmap = new HashMap<>();
		fieldmap.put("bo_table", bo_table);
		fieldmap.put("wr_id", wr_id);
		model.addAttribute("filelist", boardFileService.getFileList(fieldmap));
	}

}
