package kr.co.ccrent.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private int totalCount; // 실제 게시물 수
	private int startPage; // 현재 페이지기준 시작번호
	private int endPage; // 현재 페이지기준 끝번호
	private boolean prev;
	private boolean next; 
	private int displayPageNum=10; //화면에 보여질 페이지번호수
	private Criteria cri; // 현재페이지 페이지당 보여질 게시물의 수
	
	public String makeQuery(int page) {
		UriComponentsBuilder uriComponentsBuilder =
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum",this.cri.getPerPageNum());
		if(this.cri.getKeyword() != null) {
			uriComponentsBuilder
			.queryParam("keyword", this.cri.getKeyword());
		}
		return uriComponentsBuilder.build().encode().toString();	
	}
	
	
	public String makeSearch(int page) {
		
		UriComponents uriComponents=
		UriComponentsBuilder.newInstance()
				.queryParam("page",page)
				.queryParam("perPageNum",cri.getPerPageNum())
				.queryParam("keyword",encoding(((Criteria) cri)
				.getKeyword()))
				.build();
		return uriComponents.toUriString();
	}
	private String encoding(String keyword) {
		if(keyword ==null || keyword.trim().length() ==0) {
			return "";
		}
		
		try {
			return URLEncoder.encode(keyword,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
	
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount=totalCount;
		
		calcData();
	}

	private void calcData() {
		endPage = (int)(Math.ceil(cri.getPage()/(double) displayPageNum)* displayPageNum);
		startPage = (endPage - displayPageNum)+1;
		int tempEndPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		if(endPage>tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage ==1? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}

	
	
	
	
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public Criteria getCri() {
		return cri;
	}
	
	
	
	
	
	
}
