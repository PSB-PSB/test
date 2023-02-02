package kr.co.ccrent.service;

import kr.co.ccrent.dto.RepairDTO;

public interface RepairService {
	//정비내역 등록
	public void repair_register(RepairDTO dto) throws Exception;
	//정비내역 수정
	public int repair_modify(RepairDTO dto);
	//정비내역 삭제
	public int repair_remove(int car_regid); 
	
	//정비내역 no 갖고오기(detail)
	public RepairDTO repair_getOne(int car_regid); 	//정비내역 no 정보갖고오기
}
