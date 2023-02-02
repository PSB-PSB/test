package kr.co.ccrent;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.co.ccrent.dto.CarDTO;
import kr.co.ccrent.service.CarService;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CarServiceTest {

	@Autowired
	private CarService carService; 
	
	@Test
	public void selectTimeTest() {
		System.out.println(carService.getTime());
	}
	
	// @Test
	public void insertTest() {
		CarDTO carDTO = CarDTO.builder()
				.car_rentcompid(1)
				.car_name("ķ��ī 3ȣ")
				.car_number("��� �� 0003")
				.car_capa("3~4�� ��ħ")
				.car_detail("ķ��ī 3ȣ �Դϴ�.")
				.car_rentprice(200000)
				.build();
		// carService.register(carDTO);	
	}
	
	// @Test
	public void getAllTest() {
		List<CarDTO> dtolist = carService.getAll();
		dtolist.forEach(dto -> System.out.println(dto));
	}
	
	@Test
	public void getOneTest() {
		System.out.println(carService.getOne(1));
	}
}
