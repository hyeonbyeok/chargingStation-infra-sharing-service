package kr.ac.kopo.charge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.charge.dao.CscfDao;
import kr.ac.kopo.charge.model.CImg;
import kr.ac.kopo.charge.model.CSCF;
import kr.ac.kopo.charge.model.CSCFImg;
import kr.ac.kopo.charge.dao.CSCFImgDao;
import kr.ac.kopo.charge.model.ChargingStation;
import kr.ac.kopo.charge.model.Member;
import kr.ac.kopo.charge.util.Pager;
@Service
public class CscfServiceImpl implements CscfService {

	@Autowired
	CscfDao dao;
	
	@Autowired
	CSCFImgDao CSCFImgDao;
	
	@Override
	@Transactional
	public void add(CSCF item) {
		dao.add(item);
		
		if(item.getImages() != null) {
			for(CSCFImg image : item.getImages()) {
				image.setCscfCode(item.getCode());
				
				CSCFImgDao.add(image);
			}
		}	
	}

	@Override
	public List<CSCF> list(Pager pager) {
		long total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public CSCF item(Long code) {
		return dao.item(code);
		
	}

	@Override
	public void stats(CSCF item) {
		dao.stats(item);
		
	}

	@Override
	@Transactional
	public void delete(Long code) {
		CSCF item = dao.item(code);
		List<CSCFImg> list = CSCFImgDao.item(code);
		
		for(CSCFImg image : list) {
			CSCFImgDao.delete(image.getCode());
		}
		dao.delete(code);
	}

	@Override
	public List<CSCF> mypage(Pager pager, String id) {
		long total = dao.mypageTotal(id);
		
		pager.setTotal(total);
		
		return dao.mypage(pager, id);
	}

}
