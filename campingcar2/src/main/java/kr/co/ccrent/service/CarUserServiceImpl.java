package kr.co.ccrent.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ccrent.dto.CarUserDTO;
import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.mapper.CarUserDAO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CarUserServiceImpl implements CarUserService{
	
	
	@Autowired
	CarUserDAO carUserDAO;

	 

	@Override
	public String getTime() {
		// TODO Auto-generated method stub
		return carUserDAO.selectTime();
	}

	@Override
	public int register(CarUserDTO carUserDTO) throws Exception {
		// TODO Auto-generated method stub
		return carUserDAO.insert(carUserDTO);
	}
	
	//로그인
	@Override
	public CarUserDTO login(CarUserDTO carUserDTO) throws Exception {
		// TODO Auto-generated method stub
		return carUserDAO.login(carUserDTO);
	}

////	회원정보 리스트
//	@Override
//	public List<CarUserDTO> get() throws Exception {
//		// TODO Auto-generated method stub
//		return carUserDAO.select();
//	}

//	회원상세보기
	@Override
	public CarUserDTO detail(int car_uno) throws Exception {
		// TODO Auto-generated method stub
		return carUserDAO.detail(car_uno);
	}

//	회원탈퇴
	@Override
	public int delete(int car_uno) throws Exception {
		// TODO Auto-generated method stub
		return carUserDAO.delete(car_uno);
	}

//	회원 정보 수정 or 강제 수정
	@Override
	public int update(CarUserDTO carUserDTO) {
		// TODO Auto-generated method stub
		return carUserDAO.update(carUserDTO);
	}
	
	@Override
	public int getlistPage_count(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return carUserDAO.listPage_count(cri);
	}

	@Override
	public List<CarUserDTO> getlistPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return carUserDAO.listPage(cri);
	}

	@Override
	public int getuser_se_count(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return carUserDAO.user_se_count(cri);
	}

	@Override
	public List<CarUserDTO> getuser_se(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return carUserDAO.user_se(cri);
	} 

//	아이디 중복검사
	@Override
	public int idCheck(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return carUserDAO.idCheck(memberId);
	}



	
 
	 
 
 
















}
