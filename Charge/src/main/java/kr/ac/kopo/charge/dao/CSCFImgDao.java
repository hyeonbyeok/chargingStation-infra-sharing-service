package kr.ac.kopo.charge.dao;

import java.util.List;

import kr.ac.kopo.charge.model.CSCFImg;

public interface CSCFImgDao {

	List<CSCFImg> item(Long code);

	void add(CSCFImg image);

	void delete(Long code);

}
