package kr.ac.kopo.charge.model;

import java.util.List;

public class CSCF {
	private Long code;
	private String title;
	private String content;
	private String id;
	private char stats;
	private List<CSCFImg> images ;
	
	
	public List<CSCFImg> getImages() {
		return images;
	}
	public void setImages(List<CSCFImg> images) {
		this.images = images;
	}
	public Long getCode() {
		return code;
	}
	public void setCode(Long code) {
		this.code = code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public char getStats() {
		return stats;
	}
	public void setStats(char stats) {
		this.stats = stats;
	}
	
	
}
