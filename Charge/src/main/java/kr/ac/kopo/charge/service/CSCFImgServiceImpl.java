package kr.ac.kopo.charge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.charge.dao.CSCFImgDao;
import kr.ac.kopo.charge.model.CSCFImg;

@Service
public class CSCFImgServiceImpl implements CSCFImgService {

	@Autowired
	CSCFImgDao dao;
	
	@Override
	public List<CSCFImg> item(Long code) {
		return dao.item(code);
	}

}
