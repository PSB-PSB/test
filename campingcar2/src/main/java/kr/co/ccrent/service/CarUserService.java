package kr.co.ccrent.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.ccrent.dto.CarUserDTO;
import kr.co.ccrent.dto.Criteria;

public interface CarUserService {
	String getTime();
	public int register(CarUserDTO carUserDTO) throws Exception;
	
	//로그인 
	public CarUserDTO login(CarUserDTO carUserDTO) throws Exception;
 

	//회원 상세정보 보기
	public CarUserDTO detail(int car_uno) throws Exception;
	
	//회원정보 수정 or 강제수정
	public int update (CarUserDTO carUserDTO);
	
	//회원정보 삭제
	public int delete(int car_uno) throws Exception;
	
	//페이징처리
	public int getlistPage_count(Criteria cri)throws Exception;
	public List<CarUserDTO> getlistPage(Criteria cri) throws Exception;
	
	//검색
	public int getuser_se_count(Criteria cri)throws Exception;
	public List<CarUserDTO> getuser_se(Criteria cri) throws Exception;

	//아이디 중복검사
	public int idCheck(String memberId) throws Exception;
 
	  
}
