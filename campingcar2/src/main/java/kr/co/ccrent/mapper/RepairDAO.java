package kr.co.ccrent.mapper;

import kr.co.ccrent.dto.RepairDTO;

public interface RepairDAO {
	
	//정비내역 등록
	public void repair_insert(RepairDTO dto) throws Exception;
	//정비내역 수정
	public int repair_update(RepairDTO dto);
	//정비내역 삭제
	public int repair_delete(int car_regid); 
	
	
	
	//정비내역 no 갖고오기(detail)
	public RepairDTO repair_select(int car_regid); 	//정비내역 no 정보갖고오기
	
	
	
}
