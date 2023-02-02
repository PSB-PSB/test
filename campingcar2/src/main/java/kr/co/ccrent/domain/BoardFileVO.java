package kr.co.ccrent.domain;

import java.sql.Timestamp;

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
public class BoardFileVO {
	private String bo_table;
	private int wr_id;
	private int bf_no;
	private String bf_file;
	private String bf_source;
	private Timestamp bf_datetime;
}
