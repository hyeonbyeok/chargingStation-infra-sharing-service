package kr.ac.kopo.charge.dao;

import java.util.List;

import kr.ac.kopo.charge.model.ChargingStation;
import kr.ac.kopo.charge.util.Pager;

public interface ChargingStationDao {

	void add(ChargingStation item);

	List<ChargingStation> list(Pager pager);

	ChargingStation item(Long code);

	void update(ChargingStation item);

	void delete(Long code);

	long total(Pager pager);

	void locView(ChargingStation item);

	long mypageTotal(String id);

	List<ChargingStation> mypage(Pager pager, String id);

	List<ChargingStation> charList();




}
