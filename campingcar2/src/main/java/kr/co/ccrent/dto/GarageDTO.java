package kr.co.ccrent.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GarageDTO {
	
	private int garage_no; 		//정비소 번호
	private String garage_name; //정비소 이름
	private String garage_addr;	//정비소 주소
	private String garage_phone;//정비소 전화번호
	private String garage_state;//정비소 상태
	private int garage_code;	//정비소 지역코드
	private int state_modify;   //정비소 상태수정(등록신청/삭제)

	
	
	@Override
	public String toString() {
		return "GarageDTO [garage_no=" + garage_no + ", garage_name=" + garage_name + ", garage_addr=" + garage_addr
				+ ", garage_phone=" + garage_phone + ", garage_state=" + garage_state + ", garage_code=" + garage_code
				+ "]";
	}
	
	
}
