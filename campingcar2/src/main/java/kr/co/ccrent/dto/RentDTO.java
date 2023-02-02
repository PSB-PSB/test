package kr.co.ccrent.dto;

import java.sql.Timestamp;
import java.time.LocalDate;

import kr.co.ccrent.domain.CarVO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RentDTO {
	private int rent_id;
	private int car_regid;
	private String user_id;
	private String rent_name;
	private String rent_phone1;
	private String rent_phone2;
	private LocalDate rent_startdate;
	private LocalDate rent_enddate;
	private int rent_diffdate;
	private int rent_option1;
	private int rent_option2;
	private int rent_price;
	private int rent_paytype;
	private int rent_paystate;
	private int rent_state;
	private String rent_memo;
	private Timestamp rent_datetime;
	private boolean rent_dummy;
	private CarVO car;	
}
