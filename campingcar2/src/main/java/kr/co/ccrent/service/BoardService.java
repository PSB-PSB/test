package kr.co.ccrent.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.co.ccrent.dto.BoardDTO;
import kr.co.ccrent.dto.BoardFileDTO;
import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.dto.PageResponseDTO;

public interface BoardService {
	List<BoardDTO> getAll(String bo_table);
	PageResponseDTO<BoardDTO> getList(PageRequestDTO pageRequestDTO);
	void register(BoardDTO boardDTO, MultipartFile[] file, HttpServletRequest request);
}
