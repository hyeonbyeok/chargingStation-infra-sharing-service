package kr.ac.kopo.charge.dao;

import java.util.List;

import kr.ac.kopo.charge.model.NoticeImg;

public interface NoticeImgDao {

	void add(NoticeImg image);

	boolean delete(Long code);

	List<NoticeImg> item(Long code);

}
