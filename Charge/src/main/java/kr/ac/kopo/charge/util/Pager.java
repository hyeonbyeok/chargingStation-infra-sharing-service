package kr.ac.kopo.charge.util;

import java.util.ArrayList;
import java.util.List;

public class Pager {
	private int page = 1; // 페이지
	private int perPage = 10; //페이지당 게시글? 표시 갯수
	private int perGroup = 5; //페이지 표시 그룹
	private double total; //총 갯수
	
	private int search = 0; //검색 종류
	private String keyword; // 키워드
	
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getSearch() {
		return search;
	}

	public void setSearch(int search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}
	
	public List<Integer> getList(){
		ArrayList<Integer> list = new ArrayList<Integer>();
		int startPage = ((page-1)/perGroup )*perGroup + 1;
										
		for(int index=startPage; index < (startPage + perGroup) && index <= getLast(); index++) {
			list.add(index);
		}
		
		
		if(list.isEmpty())
			list.add(1);
		return list;
	}
	
	public int getLast() {
		
		return (int)Math.ceil(total/perPage);
	}

	public int getNext() {
		int next = ((page - 1) / perGroup +1) * perGroup + 1;
		int last = getLast();
		return next < last ?  next : last;
	}
	
	public int getPrev() {
		return page <= perGroup ? 1 : (page - 1) / perGroup * perGroup ;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getPerGroup() {
		return perGroup;
	}
	public void setPerGroup(int perGroup) {
		this.perGroup = perGroup;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	
	
}	
