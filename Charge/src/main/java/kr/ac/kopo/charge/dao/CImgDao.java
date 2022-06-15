package kr.ac.kopo.charge.dao;

import java.util.List;

import kr.ac.kopo.charge.model.CImg;

public interface CImgDao {

	void add(CImg image);

	boolean delete(Long code);

	List<CImg> item(Long code);


}
