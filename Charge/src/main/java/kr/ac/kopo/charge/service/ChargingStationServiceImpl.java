package kr.ac.kopo.charge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.charge.dao.CImgDao;
import kr.ac.kopo.charge.dao.ChargingStationDao;
import kr.ac.kopo.charge.model.CImg;
import kr.ac.kopo.charge.model.ChargingStation;
import kr.ac.kopo.charge.util.Pager;

@Service
public class ChargingStationServiceImpl implements ChargingStationService {

	
	@Autowired
	ChargingStationDao dao;
	
	@Autowired
	CImgDao cImgDao;
	
	@Override
	@Transactional
	public void add(ChargingStation item) {
		dao.add(item);
		
		if(item.getImages() != null) {
			for(CImg image : item.getImages()) {
				image.setChargingCode(item.getCode());
				
				cImgDao.add(image);
			}
		}	
	}

	@Override
	public List<ChargingStation> list(Pager pager) {
		long total = dao.total(pager);
		
		pager.setTotal(total);
		return dao.list(pager);
	}

	@Override
	public ChargingStation item(Long code) {
		
		return dao.item(code);
	}

	@Override
	@Transactional
	public void update(ChargingStation item) {
		dao.update(item);
		if(item.getImages() != null) {
			for(CImg image : item.getImages()) {
				image.setChargingCode(item.getCode());
				
				cImgDao.add(image);
			}
		}	
	}

	@Override
	@Transactional
	public void delete(Long code) {
		ChargingStation item = dao.item(code);
		
		List<CImg> list = cImgDao.item(code);
		
		
		for(CImg image : list)
			cImgDao.delete(image.getCode());
			
		dao.delete(code);
	}

	@Override
	public void locView(ChargingStation item) {
		dao.locView(item);
		
	}

	@Override
	public boolean deleteImage(Long code) {
		return cImgDao.delete(code);
	}

	@Override
	public List<ChargingStation> mypage(Pager pager, String id) {
		long total = dao.mypageTotal(id);
		
		pager.setTotal(total);
		
		return dao.mypage(pager, id);
	}

	@Override
	public List<ChargingStation> charList() {
		
		return dao.charList();
	}







}
