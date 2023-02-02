package kr.co.ccrent.mapper;

import java.util.List;

import kr.co.ccrent.domain.CarVO;
import kr.co.ccrent.domain.RentVO;
import kr.co.ccrent.dto.PageRequestDTO;

public interface CarMapper {
	String selectTime();
	void insert(CarVO carVO);
	void update(CarVO carVO);
	void delete(int car_regid);
	List<CarVO> selectAll();
	List<CarVO> selectList(PageRequestDTO pageRequestDTO);
	int selectCount(PageRequestDTO pageRequestDTO);
	CarVO selectOne(int car_regid);
	int selectMaxId();
}
