package kr.ac.kopo.charge.service;

import java.util.List;

import kr.ac.kopo.charge.model.Notice;
import kr.ac.kopo.charge.util.Pager;

public interface NoticeService {

	List<Notice> list(Pager pager);

	void add(Notice item);

	void delete(Long code);

	Notice item(Long code);

	void update(Notice item);

	void viewCount(Notice item);

	boolean deleteImage(Long code);

}
