package pack.admin.controller;

public class GogekSearch {
	
	//gogek 자료 검색을 위한 bean 
	
	private String data, search,gogek_id;
	private int startRow;

	public String getGogek_id() {
		return gogek_id;
	}
	
	public void setGogek_id(String gogek_id) {
		this.gogek_id = gogek_id;
	}
	
	
	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

}
