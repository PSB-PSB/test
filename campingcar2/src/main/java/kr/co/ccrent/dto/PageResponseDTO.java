package kr.co.ccrent.dto;

import java.util.List;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;


@Getter
@ToString
public class PageResponseDTO<E> {
	private int page;
	private int size;
	private int total;
	private int start;
	private int end;
	private boolean prev;
	private boolean next;
	
	private List<E> dtoList;
	
	@Builder(builderMethodName = "withAll")
	public PageResponseDTO(PageRequestDTO pageRequestDTO, List<E> dtoList, int total) {
		this.page = pageRequestDTO.getPage();
		this.size = pageRequestDTO.getSize();
		this.total = total;
		this.dtoList = dtoList;
		this.end = (int)(Math.ceil(this.page/10.0)) * 10; // 현재 페이지 기준, 페이지 목록에서 끝 페이지
		this.start = this.end - 9;
		int last = (int)(Math.ceil(total/(double)size)); // 전체 글 개수 ÷ 한페이지 목록 개수 => 마지막 페이지
		this.end = end > last  ? last:end; // 현재 페이지 기준, 페이지 목록에서 끝 페이지는 전체의 마지막 페이지와 같거나 작아야한다.
		this.prev = this.start > 1;
		this.next = total > this.end * this.size;
	}
}

