package pack.admin.controller;

public class moviePartBean {
	private String pageNum = "1";
	private String search;
	private int startRow;
	
	//영화 검색시 필요한 값들을 인젝션 받음
	
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
	

}
