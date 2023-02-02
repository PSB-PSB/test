package kr.co.ccrent.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
 
public class RepairDTO {
	
	private int repair_no;		  //정비넘버
	private String car_regid;     // 렌트카
	private String comp_name;	  //렌트회사
	private String garage_name;	  // 정비소명
	private	String repair_info;	  //정비내역
	private	String repair_date;	  //정비날짜
	private String repair_price;	  //정비가격
	private String repair_addinfo;//추가정비내역
	
	public int getRepair_no() {
		return repair_no;
	}
	public void setRepair_no(int repair_no) {
		this.repair_no = repair_no;
	}
	public String getCar_regid() {
		return car_regid;
	}
	public void setCar_regid(String car_regid) {
		this.car_regid = car_regid;
	}
	public String getComp_name() {
		return comp_name;
	}
	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}
	public String getGarage_name() {
		return garage_name;
	}
	public void setGarage_name(String garage_name) {
		this.garage_name = garage_name;
	}

	public String getRepair_info() {
		return repair_info;
	}
	public void setRepair_info(String repair_info) {
		this.repair_info = repair_info;
	}
	public String getRepair_date() {
		return repair_date;
	}
	public void setRepair_date(String repair_date) {
		this.repair_date = repair_date;
	}
	public String getRepair_price() {
		return repair_price;
	}
	public void setRepair_price(String repair_price) {
		this.repair_price = repair_price;
	}
	public String getRepair_addinfo() {
		return repair_addinfo;
	}
	public void setRepair_addinfo(String repair_addinfo) {
		this.repair_addinfo = repair_addinfo;
	}
	@Override
	public String toString() {
		return "RepairDTO [repair_no=" + repair_no + ", car_regid=" + car_regid + ", comp_name=" + comp_name
				+ ", garage_name=" + garage_name +  ", repair_info=" + repair_info
				+ ", repair_date=" + repair_date + ", repair_price=" + repair_price + ", repair_addinfo="
				+ repair_addinfo + "]";
	}
	

	

	
}
