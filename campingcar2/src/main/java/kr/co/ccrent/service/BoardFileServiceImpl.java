package kr.co.ccrent.service;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ccrent.domain.BoardFileVO;
import kr.co.ccrent.dto.BoardFileDTO;
import kr.co.ccrent.mapper.BoardFileMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardFileServiceImpl implements BoardFileService {
	
	private final BoardFileMapper boardFileMapper;
	private final ModelMapper modelMapper;

	@Override
	public List<BoardFileDTO> getFileList(HashMap<String, Object> fieldmap) {
		List<BoardFileDTO> dtolist = boardFileMapper.selectByKey(fieldmap).stream()
				.map(vo -> modelMapper.map(vo, BoardFileDTO.class))
				.collect(Collectors.toList());
		return dtolist;
	}

	@Override
	public void register(BoardFileDTO boardFileDTO, MultipartFile[] file, HttpServletRequest request) {
		
		
	}
	

}
