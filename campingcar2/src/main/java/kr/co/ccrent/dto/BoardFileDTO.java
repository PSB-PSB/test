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
public class BoardFileDTO {
	private String bo_table;
	private int wr_id;
	private int bf_no;
	private String bf_file;
	private String bf_source;
	private Timestamp bf_datetime;
}
