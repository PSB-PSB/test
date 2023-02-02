package kr.co.ccrent;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.co.ccrent.domain.BoardVO;
import kr.co.ccrent.domain.RentVO;
import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.mapper.RentMapper;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class RentMapperTest {

	@Autowired
	private RentMapper rentMapper;
	
	@Test
	public void selectTimeTest() {
		System.out.println(rentMapper.selectTime());	
	}
	
	// @Testz
	public void insertTest() {
		RentVO rentVO = RentVO.builder()
				.car_regid(3)
				.user_id("user00")
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
		rentMapper.insert(rentVO);
	}
	
	// @Test
	public void selectAllTest() {
		List<RentVO> rentVO = rentMapper.selectAll();
		rentVO.forEach(vo -> System.out.println(vo));
	}
	
	// @Test
	public void selectByCarId() {
		HashMap<String, Object> varmap = new HashMap<>();
		varmap.put("car_regid", 1);
		varmap.put("firstday", "2023-01-01");
		varmap.put("lastday", "2023-01-31");
		List<RentVO> rentVO = rentMapper.selectByCarId(varmap);
		rentVO.forEach(vo -> System.out.println(vo));
	}
	
	// @Test
	public void selectOne() {
		RentVO rentVO = rentMapper.selectOne(1);
		System.out.println(rentVO);
	}
	
	// @Test
	public void selectListTest() {
		PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
				.page(1)
				.size(10)
				.types(new String[] {"rent_name","rent_phone1"})
				.keyword("홍길동")
				.category("2")
				.build();
		List<RentVO> volist = rentMapper.selectList(pageRequestDTO);
		volist.forEach(vo -> System.out.println(vo));
	}
	
	// @Test
	public void selectCountTest() {
		PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
				.page(1)
				.size(10)
				.build();		
		System.out.println(rentMapper.selectCount(pageRequestDTO));
	}
	
	// @Test
	public void updateStateTest() {
		RentVO rentVO = RentVO.builder()
				.rent_id(17)
				.rent_paystate(1)
				.build();
		rentMapper.updateState(rentVO);
	}
	
	@Test
	public void selectTodayStartTest() {
		List<RentVO> volist = rentMapper.selectTodayStart("2023-01-31");
		volist.forEach(vo -> System.out.println(vo));
	}
	@Test
	public void selectTodayEndTest() {
		List<RentVO> volist = rentMapper.selectTodayEnd("2023-01-31");
		volist.forEach(vo -> System.out.println(vo));
	}	
	
}
