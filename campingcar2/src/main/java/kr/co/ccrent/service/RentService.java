package kr.co.ccrent.service;

import java.util.HashMap;
import java.util.List;

import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.dto.PageResponseDTO;
import kr.co.ccrent.dto.RentDTO;

public interface RentService {
	String getTime();
	void register(RentDTO rentDTO);
	List<RentDTO> getAll();
	PageResponseDTO<RentDTO> getList(PageRequestDTO pageRequestDTO);
	HashMap<String, RentDTO> getByCarId(HashMap<String,Object> varmap);
	RentDTO getOne(int rent_id);
	// 상태 변경
	void modifyState(RentDTO rentDTO);
	void remove(int rent_id);
	
	// 오늘의 출고, 반납 차량
	List<RentDTO> getTodayStart(String today);
	List<RentDTO> getTodayEnd(String today);
}
