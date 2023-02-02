package kr.co.ccrent.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ccrent.dto.RepairDTO;
import kr.co.ccrent.mapper.RepairDAO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RepairServiceImpl implements RepairService {
	
	@Autowired
	RepairDAO repairDAO;
	
	//불러오기
	@Override
	public RepairDTO repair_getOne(int car_regid) {

		return repairDAO.repair_select(car_regid);
	}

	//등록
	@Override
	public void repair_register(RepairDTO dto) throws Exception {
	repairDAO.repair_insert(dto);	
	}

	//수정
	@Override
	public int repair_modify(RepairDTO dto) {
		
		return repairDAO.repair_update(dto);
	}

	//삭제
	@Override
	public int repair_remove(int car_regid) {

		return repairDAO.repair_delete(car_regid);
	}

}
