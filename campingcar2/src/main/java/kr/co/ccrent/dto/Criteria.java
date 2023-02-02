package kr.co.ccrent.dto;

import java.util.Arrays;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {
	
		private int page;
		private int perPageNum;
		private String keyword;
	
		
		
		


		public String makeQuery(int page) { //url주소 고정시키기
			UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("perPageNum", this.perPageNum);
			if(keyword!=null) {
				uriComponentsBuilder.queryParam("keyword", this.keyword);
			}
			return UriComponentsBuilder.newInstance().build().encode().toString();
		}
				
			
		
		
		public Criteria() {
			this.page=1;
			this.perPageNum=10;
		}
		public void setPage(int page) {
			if(page <= 0) {
				this.page = 1; // 페이지 값
				return;
			}
			this.page = page;	
		}
		public void setPerPageNum(int perPageNum) {
			if(perPageNum <=0||perPageNum >100) {
				this.perPageNum = 10; //보여지는 글 수
				return;
			}
			this.perPageNum = perPageNum;
		}
		
		public int getPage() {
			return page;
		}
		
		//method for mybatis sqlmapper
		public int getPageStart() {
			return (this.page -1)*perPageNum;
		}
		
		//method for mybatis sql mapper
		public int getPerPageNum() {
			return this.perPageNum;
		}
		
		public String getKeyword() {
			return keyword;
		}


		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}
		@Override
		public String toString() {
			return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", keyword=" + keyword + "]";
		}
		
		
}