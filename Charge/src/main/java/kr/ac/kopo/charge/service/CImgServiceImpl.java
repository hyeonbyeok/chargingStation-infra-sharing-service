package kr.ac.kopo.charge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.charge.dao.CImgDao;
import kr.ac.kopo.charge.model.CImg;
@Service
public class CImgServiceImpl implements CImgService {

	@Autowired
	CImgDao dao;

	@Override
	public List<CImg> item(Long code) {
		
		return dao.item(code);
	}

	


}
