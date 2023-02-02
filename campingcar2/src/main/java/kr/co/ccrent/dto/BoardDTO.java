package kr.co.ccrent.dto;

import java.sql.Timestamp;

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
public class BoardDTO {
	private String bo_table;
	private int wr_id;
	private	int wr_num;
	private	String wr_reply;
	private	int wr_parent;
	private	int wr_is_comment;
	private	String ca_name;
	private	String wr_subject;
	private	String wr_content;
	private	String wr_link1;
	private	String wr_link2;
	private	int wr_hit;
	private	String mb_id;
	private	String wr_name;
	private	String wr_password;
	private	Timestamp wr_datetime;
	private	Timestamp wr_last;
	private	String wr_ip;
}
