package kr.co.ccrent.mapper;
 

import java.util.List;
import java.util.Map;

import kr.co.ccrent.dto.CarUserDTO;
import kr.co.ccrent.dto.Criteria;

public interface CarUserDAO {
	String selectTime();
	
	//회원가입
	public int insert(CarUserDTO carUserDTO);
	
	//로그인 
	public CarUserDTO login(CarUserDTO carUserDTO)  throws Exception;
	
	//회원정보 리스트
	public List<CarUserDTO> select() throws Exception;
	  
	//회원 상세정보 보기
	public CarUserDTO detail(int car_uno);
	
	//회원정보 삭제
	public int delete(int car_uno);
	    
	//회원정보 수정 or 강제수정
	public int update (CarUserDTO carUserDTO);
	
	//페이징처리
	public int listPage_count(Criteria cri)throws Exception;
	public List<CarUserDTO> listPage(Criteria cri) throws Exception;
	
	//검색처리
	public int user_se_count(Criteria cri)throws Exception;
	public List<CarUserDTO> user_se(Criteria cri) throws Exception;

	//아이디 중복검사
	public int idCheck(String memberId);
	  
}
