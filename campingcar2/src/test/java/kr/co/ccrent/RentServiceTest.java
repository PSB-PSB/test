package kr.co.ccrent;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.co.ccrent.dto.RentDTO;
import kr.co.ccrent.service.RentService;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class RentServiceTest {

	@Autowired
	private RentService rentService;
	
	@Test
	public void getTimeTest() {
		System.out.println(rentService.getTime());
	}
	
	// @Test
	public void registerTest() {
		RentDTO rentDTO = RentDTO.builder()
				.car_regid(3)
				.user_id("user01")
				.rent_phone1("010-2222-3333")
				.rent_phone2("010-2222-3334")
				.rent_startdate(LocalDate.now())
				.rent_enddate(LocalDate.now())
				.rent_option1(0)
				.rent_option2(0)
				.rent_price(200000)
				.rent_paytype(0)
				.rent_paystate(0)
				.rent_state(0)
				.rent_memo("예약 세부내용")			
				.build();
		rentService.register(rentDTO);
	}
	
	// @Test
	public void getAllTest() {
		List<RentDTO> dtolist = rentService.getAll();
		dtolist.forEach(dto -> System.out.println(dto));
	}
	
	// @Test
	public void getByRoomIdTest() {
		HashMap<String, Object> map = new HashMap<>();
		map.put("car_regid", 1);
		map.put("firstday", "2023-01-01");
		map.put("lastday", "2023-01-30");
		HashMap<String, RentDTO> maplist = rentService.getByCarId(map);
		for(String i : maplist.keySet()){ //저장된 key값 확인
		    System.out.println("[Key]:" + i + " [Value]:" + maplist.get(i));
		}
	}
	
	// @Test
	public void getOneTest() {
		RentDTO rentDTO = rentService.getOne(1);
		System.out.println(rentDTO);
	}
	
	@Test
	public void getTodayStartTest() {
		List<RentDTO> dtolist = rentService.getTodayStart("2023-01-31");
		dtolist.forEach(dto -> System.out.println(dto));
	}
	@Test
	public void getTodayEndTest() {
		List<RentDTO> dtolist = rentService.getTodayEnd("2023-01-31");
		dtolist.forEach(dto -> System.out.println(dto));
	}		
	
	
}
