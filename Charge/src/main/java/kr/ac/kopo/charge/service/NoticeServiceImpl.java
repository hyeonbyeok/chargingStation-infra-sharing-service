package kr.ac.kopo.charge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.charge.dao.NoticeDao;
import kr.ac.kopo.charge.dao.NoticeImgDao;
import kr.ac.kopo.charge.model.CImg;
import kr.ac.kopo.charge.model.CSCFImg;
import kr.ac.kopo.charge.model.ChargingStation;
import kr.ac.kopo.charge.model.Notice;
import kr.ac.kopo.charge.model.NoticeImg;
import kr.ac.kopo.charge.util.Pager;
@Service
public class NoticeServiceImpl implements NoticeService {

	
	@Autowired
	NoticeDao dao;
	
	@Autowired
	NoticeImgDao noticeImgDao;
	
	@Override
	public List<Notice> list(Pager pager) {
		long total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	@Transactional
	public void add(Notice item) {
		dao.add(item);
		if(item.getImages() != null) {
			for(NoticeImg image : item.getImages()) {
				image.setNoticeCode(item.getCode());
				
				noticeImgDao.add(image);
			}
		}	
	}


	@Override
	@Transactional
	public void update(Notice item) {
		dao.update(item);
		
		if(item.getImages() != null) {
			for(NoticeImg image : item.getImages()) {
				image.setNoticeCode(item.getCode());
				
				noticeImgDao.add(image);
			}
		}	
	}

	@Override
	public void delete(Long code) {
		Notice item = dao.item(code);
		
		List<NoticeImg> list = noticeImgDao.item(code);
		
		for(NoticeImg image : list)
			noticeImgDao.delete(image.getCode());
		
		dao.delete(code);
		
	}

	@Override
	public Notice item(Long code) {
		
		return dao.item(code);
	}

	@Override
	public void viewCount(Notice item) {
		
		 dao.viewCount(item);
	}

	@Override
	public boolean deleteImage(Long code) {
		return noticeImgDao.delete(code);
	}



}
