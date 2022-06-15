package kr.ac.kopo.charge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.charge.dao.NoticeImgDao;
import kr.ac.kopo.charge.model.NoticeImg;
@Service
public class NoticeImgServiceImpl implements NoticeImgService {

	@Autowired
	NoticeImgDao dao;
	
	@Override
	public List<NoticeImg> item(Long code) {
		
		return dao.item(code);
	}

}
