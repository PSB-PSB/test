package kr.co.ccrent.mapper;

import java.util.HashMap;
import java.util.List;

import kr.co.ccrent.domain.BoardFileVO;

public interface BoardFileMapper {
	String selectTime();
	void insert(BoardFileVO boardFileVO);
	List<BoardFileVO> selectByKey(HashMap<String, Object> fieldmap);
}
