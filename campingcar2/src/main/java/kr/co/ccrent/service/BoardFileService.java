package kr.co.ccrent.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.co.ccrent.dto.BoardFileDTO;

public interface BoardFileService {
	List<BoardFileDTO> getFileList(HashMap<String, Object> fieldmap);
	void register(BoardFileDTO boardFileDTO, MultipartFile[] file, HttpServletRequest request);
}
