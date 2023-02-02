package kr.co.ccrent;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.co.ccrent.domain.CarVO;
import kr.co.ccrent.domain.RentVO;
import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.mapper.CarMapper;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CarMapperTest {

	@Autowired
	private CarMapper carMapper;
	
	@Test
	public void selectTimeTest() {
		System.out.println(carMapper.selectTime());
	}
	
	// @Test
	public void insertTest() {
		CarVO carVO = CarVO.builder()
				.car_rentcompid(1)
				.car_name("ķ��ī 2ȣ")
				.car_number("��� �� 0002")
				.car_capa("3~4�� ��ħ")
				.car_detail("ķ��ī 2ȣ �Դϴ�.")
				.car_rentprice(200000)
				.build();
		carMapper.insert(carVO);	
	}
	
	// @Test
	public void selectAllTest() {
		List<CarVO> volist = carMapper.selectAll();
		volist.forEach(vo -> System.out.println(vo));
	}
	
	// @Test
	public void selectOne() {
		CarVO carVO = carMapper.selectOne(1);
		System.out.println(carVO);
	}

	// @Test
	public void updateTest() {
		CarVO carVO = CarVO.builder()
				.car_regid(1)
				.car_rentcompid(1)
				.car_modelname("��� ī�Ϲ�")
				.car_name("ķ��ī 1ȣ ���� �׽�Ʈ")
				.car_number("��� �� 0002")
				.car_capa("5~6�� ��ħ")
				.car_option("�ɼ� ��¼��")
				.car_detail("ķ��ī 1ȣ �Դϴ�.")
				.car_rentprice(250000)
				.build();
		carMapper.update(carVO);	
	}
	
	// @Test
	public void selectListTest() {
		PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
				.page(1)
				.size(10)
				.build();
		List<CarVO> volist = carMapper.selectList(pageRequestDTO);
		volist.forEach(vo -> System.out.println(vo));
	}
	
	// @Test
	public void selectCountTest() {
		PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
				.page(1)
				.size(10)
				.build();		
		System.out.println(carMapper.selectCount(pageRequestDTO));
	}
	
	@Test
	public void testSelectSearch() {
		PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
				.page(1)
				.size(10)
				.types(new String[] {"car_name","car_modelname"})
				.keyword("ķ��ī")
				.build();		
		List<CarVO> volist = carMapper.selectList(pageRequestDTO);
		volist.forEach(vo -> System.out.println(vo));		
	}
	
	
}
