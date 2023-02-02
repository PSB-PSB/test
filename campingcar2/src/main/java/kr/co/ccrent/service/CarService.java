package kr.co.ccrent.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.co.ccrent.dto.CarDTO;
import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.dto.PageResponseDTO;

public interface CarService {
	String getTime();
	// void register(CarDTO carDTO,  MultipartFile[] file, HttpServletRequest request, String order);
	void register(CarDTO carDTO, HttpServletRequest request);
	List<CarDTO> getAll();
	PageResponseDTO<CarDTO> getList(PageRequestDTO pageRequestDTO);
	CarDTO getOne(int car_regid);
	void modify(CarDTO carDTO, HttpServletRequest request);
	void remove(int car_regid);
}
