package kr.ac.kopo.charge.model;

import java.util.Date;
import java.util.List;

public class Notice {
	private Long code;
	private String id;
	private String title;
	private String contents;
	private Date regDate;
	private Long viewCount;
	
	private List<NoticeImg> images;
	
	
	
	
	public List<NoticeImg> getImages() {
		return images;
	}
	public void setImages(List<NoticeImg> images) {
		this.images = images;
	}
	public Long getCode() {
		return code;
	}
	public void setCode(Long code) {
		this.code = code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Long getViewCount() {
		return viewCount;
	}
	public void setViewCount(Long viewCount) {
		this.viewCount = viewCount;
	}
	
	
}
