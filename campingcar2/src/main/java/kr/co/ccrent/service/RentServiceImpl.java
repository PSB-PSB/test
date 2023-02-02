package kr.co.ccrent.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import kr.co.ccrent.domain.BoardVO;
import kr.co.ccrent.domain.RentVO;
import kr.co.ccrent.dto.BoardDTO;
import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.dto.PageResponseDTO;
import kr.co.ccrent.dto.RentDTO;
import kr.co.ccrent.mapper.RentMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RentServiceImpl implements RentService {

	private final RentMapper rentMapper;
	private final ModelMapper modelMapper;
	
	@Override
	public String getTime() {
		return rentMapper.selectTime();
	}

	@Override
	public void register(RentDTO rentDTO) {
		RentVO rentVO = modelMapper.map(rentDTO, RentVO.class);
		rentMapper.insert(rentVO);
	}

	@Override
	public List<RentDTO> getAll() {
		List<RentDTO> dtolist = rentMapper.selectAll().stream()
				.map(vo -> modelMapper.map(vo, RentDTO.class))
				.collect(Collectors.toList());
		return dtolist;
	}
	@Override
	public PageResponseDTO<RentDTO> getList(PageRequestDTO pageRequestDTO) {
		pageRequestDTO.setBo_table(pageRequestDTO.getBo_table());
		List<RentVO> volist = rentMapper.selectList(pageRequestDTO);
		List<RentDTO> dtolist = volist.stream()
				.map(vo -> modelMapper.map(vo, RentDTO.class))
				.collect(Collectors.toList());
		int total = rentMapper.selectCount(pageRequestDTO);
		PageResponseDTO<RentDTO> pageResponseDTO = PageResponseDTO.<RentDTO>withAll()
				.dtoList(dtolist)
				.total(total)
				.pageRequestDTO(pageRequestDTO)
				.build();
		return pageResponseDTO;
	}	
	
	@Override
	public HashMap<String, RentDTO> getByCarId(HashMap<String,Object> varmap) {
		
		// car_regid, firstday, lastday로 예약목록 select, dto로 불러오기
		List<RentVO> volist = rentMapper.selectByCarId(varmap);
		List<RentDTO> dtolist = null;
		System.out.println(volist);
		HashMap<String, RentDTO> resultmap = new HashMap<>();	
		if(volist!=null) {
			dtolist = rentMapper.selectByCarId(varmap).stream()
					.map(vo -> modelMapper.map(vo, RentDTO.class))
					.collect(Collectors.toList());
			
			// DTO를 키를 날짜(re_startday)로 잡고 해시맵에 넣기

			// 연속 일정에 따른 더미 데이터 처리
			for(int i=0; i<dtolist.size(); i++) {
				// 출고일, 반납일 계산
				Date startday = java.sql.Date.valueOf(dtolist.get(i).getRent_startdate());
				Date endday = java.sql.Date.valueOf(dtolist.get(i).getRent_enddate());
				long Sec = (endday.getTime() - startday.getTime()) / 1000; // 초
				long Min = (endday.getTime() - startday.getTime()) / 60000; // 분
				long Hour = (endday.getTime() - startday.getTime()) / 3600000; // 시
				long Days = Sec / (24*60*60); // 날짜 차이 (일단위)
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				
				// 데이터 복사 (이런 무식한 방법밖에 없는건가;)
				dtolist.get(i).setRent_diffdate(Long.valueOf(Days).intValue());
				dtolist.get(i).setRent_dummy(false);
				RentDTO origindto = new RentDTO();
				origindto = RentDTO.builder()
						.rent_id(dtolist.get(i).getRent_id())
						.rent_name(dtolist.get(i).getRent_name())
						.car_regid(dtolist.get(i).getCar_regid())
						.user_id(dtolist.get(i).getUser_id())
						.rent_phone1(dtolist.get(i).getRent_phone1())
						.rent_phone2(dtolist.get(i).getRent_phone2())
						.rent_startdate(dtolist.get(i).getRent_startdate())
						.rent_enddate(dtolist.get(i).getRent_enddate())
						.rent_option1(dtolist.get(i).getRent_option1())
						.rent_option2(dtolist.get(i).getRent_option2())
						.rent_price(dtolist.get(i).getRent_price())
						.rent_paytype(dtolist.get(i).getRent_paytype())
						.rent_paystate(dtolist.get(i).getRent_paystate())
						.rent_state(0)
						.rent_memo(dtolist.get(i).getRent_memo())
						.rent_dummy(false)
						.rent_diffdate(Long.valueOf(Days).intValue())
						.build();						
				// 원본 데이터 맵에 추가
				resultmap.put(String.valueOf(dtolist.get(i).getRent_startdate()), origindto);
				System.out.println(Days+"일차");
				
				// 더미데이터를 추가할 경우
				if(varmap.get("dummy").equals("1")) {
					if(Days>=1) {
						LocalDate startdayLocal = dtolist.get(i).getRent_startdate();
						LocalDate enddayLocal = dtolist.get(i).getRent_enddate();
						for(int j=1; j<=Days; j++) {
							// String keydate = String.valueOf(startdayLocal.getYear()+"-"+String.format("%02d",startdayLocal.getMonthValue())+"-"+String.format("%02d", j));
							String keydate = String.valueOf(startdayLocal.plusDays(j));
							System.out.println(keydate);
							dtolist.get(i).setRent_dummy(true);
							resultmap.put(keydate, dtolist.get(i));
						}
						System.out.println("더미데이터");
					}
					System.out.println("==============================");
				} // end of IF
			} // end of FOR LOOP
		}
		return resultmap;
	}

	@Override
	public RentDTO getOne(int rent_id) {
		RentVO rentVO = rentMapper.selectOne(rent_id);
		RentDTO rentDTO = null; 
		if(rentVO!=null) {
				rentDTO = modelMapper.map(rentVO, RentDTO.class);
		}
		return rentDTO;
	}

	@Override
	public void modifyState(RentDTO rentDTO) {
		RentVO rentVO = modelMapper.map(rentDTO, RentVO.class);
		rentMapper.updateState(rentVO);
	}

	@Override
	public void remove(int rent_id) {
		rentMapper.delete(rent_id);
		
	}

	@Override
	public List<RentDTO> getTodayStart(String today) {
		List<RentDTO> dtolist = rentMapper.selectTodayStart(today).stream()
				.map(vo -> modelMapper.map(vo, RentDTO.class))
				.collect(Collectors.toList());
		return dtolist;
	}

	@Override
	public List<RentDTO> getTodayEnd(String today) {
		List<RentDTO> dtolist = rentMapper.selectTodayEnd(today).stream()
				.map(vo -> modelMapper.map(vo, RentDTO.class))
				.collect(Collectors.toList());
		return dtolist;
	}

}
