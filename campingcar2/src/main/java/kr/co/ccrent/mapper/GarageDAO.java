package kr.co.ccrent.mapper;

import java.util.List;


import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.dto.GarageDTO;


public interface GarageDAO {
	//정비소 등록하기
	public void garage_insert(GarageDTO dto) throws Exception;
	
	
	//등록신청한 정비소 리스트/상세보기(관리자)
	public List<GarageDTO> garage_select_reg(Criteria cri); //등록신청한 정비소리스트
	public int garage_select_regcount(Criteria cri) throws Exception; //등록신청한 정비소 count
	 
	//정비소 등록하기(관리자)
	public int garage_insert_admin(GarageDTO dto) throws Exception;		
	
	//정비소 수정하기(관리자)
	public int garage_update(GarageDTO dto);
	public GarageDTO garage_update_select(int garage_no); 	//garage_no 정보갖고오기
	
	//정비소 삭제하기(관리자)
	public int garage_delete(int garage_no); 
	
	//정비소 검색관련
	public List<GarageDTO> garage_select(Criteria cri)throws Exception;
	public int garage_select_count(Criteria cri)throws Exception;
	
	//정비소 리스트관련 dao	
	public List<GarageDTO> garage_select_all(Criteria cri) throws Exception;
	public int garage_select_allcount(Criteria cri) throws Exception;
	
	
}
