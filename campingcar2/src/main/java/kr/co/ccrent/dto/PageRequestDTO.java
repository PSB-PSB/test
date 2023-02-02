package kr.co.ccrent.dto;

import java.time.LocalDate;
import java.util.Arrays;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageRequestDTO { // 페이징 기본 값을 설정하는 DTO, skip값도 계산
	
	private String bo_table;
	
	@Builder.Default
	@Min(value=1)
	@Positive
	private int page = 1;
	
	@Builder.Default
	@Min(value = 10)
	@Max(value = 100)
	@Positive
	private int size = 15;
	private String link;
	private String[] types;
	private String keyword;
	private String category;
	private LocalDate from;
	private LocalDate to;
	
	public int getSkip() {
		return (page - 1) * this.size;
	}
	
	public String getLink() {
		if(link==null) {
			StringBuilder builder = new StringBuilder();
			builder.append("page="+this.page);
			builder.append("&size="+this.size);
			link = builder.toString();
		}
		return link;
	}
	
	public boolean checkType(String type) {
		if(types==null || types.length==0) {
			return false;
		}
		return Arrays.stream(types).anyMatch(type::equals);
	}
}
