package kr.co.ccrent.mapper;

import java.util.HashMap;
import java.util.List;

import kr.co.ccrent.domain.BoardVO;
import kr.co.ccrent.domain.RentVO;
import kr.co.ccrent.dto.PageRequestDTO;

public interface RentMapper {
	String selectTime();
	void insert(RentVO rentVO);
	List<RentVO> selectAll();
	List<RentVO> selectList(PageRequestDTO pageRequestDTO);
	List<RentVO> selectByCarId(HashMap<String, Object> varmap);
	int selectCount(PageRequestDTO pageRequestDTO);
	RentVO selectOne(int rent_id); // 글 1개 조회
	// 예약 상태 업데이트
	void updateState(RentVO rentVO);
	// 예약글 삭제
	void delete(int rent_id);
	
	// 오늘 출고, 반납 차량
	List<RentVO> selectTodayStart(String today);
	List<RentVO> selectTodayEnd(String today);
}
