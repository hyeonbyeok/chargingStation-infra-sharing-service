package kr.ac.kopo.charge.service;

import java.util.List;

import kr.ac.kopo.charge.model.ChargingStation;
import kr.ac.kopo.charge.util.Pager;

public interface ChargingStationService {

	void add(ChargingStation item);

	List<ChargingStation> list(Pager pager);

	ChargingStation item(Long code);

	void update(ChargingStation item);

	void delete(Long code);

	void locView(ChargingStation item);

	boolean deleteImage(Long code);

	List<ChargingStation> mypage(Pager pager, String id);

	List<ChargingStation> charList();



}
