package kr.co.ccrent.domain;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CarVO {
	private int car_regid;
	private int car_rentcompid;
	private String car_modelname;
	private String car_name;
	private String car_number;
	private String car_capa;
	private String car_option;
	private String car_detail;
	private int car_rentprice;
	private LocalDate car_regdate;
	private int car_state;
	private MultipartFile file;
	private String car_file;
}
