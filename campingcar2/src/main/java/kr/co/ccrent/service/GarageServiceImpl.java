package kr.co.ccrent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.dto.GarageDTO;
import kr.co.ccrent.mapper.GarageDAO;
import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class GarageServiceImpl implements GarageService{

	@Autowired
	GarageDAO garageDao;
	
	//정비소검색 리스트
	@Override
	public List<GarageDTO> garage_get(Criteria cri) throws Exception {		
		return garageDao.garage_select(cri);
	}	
	//정비소검색 리스트count
	@Override
	public int garage_get_count(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return garageDao.garage_select_count(cri);
	}


	//정비소 전체리스트	
	@Override
	public List<GarageDTO> garage_get_all(Criteria cri) throws Exception {
		
		return garageDao.garage_select_all(cri);
	}
	//정비소 전체리스트카운트
	@Override
	public int garage_get_allcount(Criteria cri) throws Exception {
		return garageDao.garage_select_allcount(cri);
	}
	
	
	//정비소 등록
	@Override
	public void garage_register(GarageDTO dto) throws Exception {
		garageDao.garage_insert(dto);
	}	
	
	//정비소 등록 리스트보기 관리자
	@Override
	public List<GarageDTO> garage_get_reg(Criteria cri) {

		return garageDao.garage_select_reg(cri);
	}
	//정비소 등록리스트 count
	@Override
	public int garage_get_regcount(Criteria cri) throws Exception {
	
		return garageDao.garage_select_regcount(cri);
	}
	
	

	//정비소 등록 승인
	@Override
	public int garage_register_admin(GarageDTO dto) throws Exception {
		return garageDao.garage_insert_admin(dto);
		
	}
	
	
	
	//정비소 수정(관리자)
	@Override
	public int garage_modify(GarageDTO dto) {

		return garageDao.garage_update(dto);
	}
	//정비소 수정하기(no에 맞는 정보갖고오기)
	@Override
	public GarageDTO garage_modify_get(int garage_no) {
		
		return garageDao.garage_update_select(garage_no);
	}
	
	
	//정비소 삭제(관리자)
	@Override
	public int garage_remove(int garage_no) {

		return garageDao.garage_delete(garage_no);
	}

	
	
	


	
	

	
	

}
