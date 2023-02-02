package kr.co.ccrent.mapper;

import java.util.List;

import kr.co.ccrent.domain.BoardVO;
import kr.co.ccrent.dto.BoardDTO;
import kr.co.ccrent.dto.PageRequestDTO;

public interface BoardMapper {
	void insert(BoardVO boardVO);
	List<BoardVO> selectAll(String bo_table);
	List<BoardVO> selectList(PageRequestDTO pageRequestDTO);
	int selectCount(PageRequestDTO pageRequestDTO);
	int selectMaxId(String bo_table);
	
}
