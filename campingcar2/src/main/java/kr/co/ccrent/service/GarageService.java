package kr.co.ccrent.service;

import java.util.List;

import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.dto.GarageDTO;

public interface GarageService {
	//정비소 등록하기
	public void garage_register(GarageDTO dto) throws Exception;
	
	
	//등록신청한 정비소 리스트/상세보기(관리자)
	public List<GarageDTO> garage_get_reg(Criteria cri);
	public int garage_get_regcount(Criteria cri) throws Exception;

	//정비소 등록하기(관리자)
	public int garage_register_admin(GarageDTO dto) throws Exception;
		
	//정비소 수정하기(관리자)
	public int garage_modify(GarageDTO dto);
	public GarageDTO garage_modify_get(int garage_no); 	//등록신청한 정비소 no갖고오기
	
	//정비소 삭제하기(관리자)
	public int garage_remove(int garage_no); 
	
	//정비소 검색관련
	public List<GarageDTO> garage_get(Criteria cri)throws Exception;
	public int garage_get_count(Criteria cri)throws Exception;
	//정비소 리스트관련 dao	
	public List<GarageDTO> garage_get_all(Criteria cri) throws Exception;
	public int garage_get_allcount(Criteria cri) throws Exception;



}
