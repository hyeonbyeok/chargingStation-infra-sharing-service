package kr.ac.kopo.charge.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.charge.model.ChargingStation;
import kr.ac.kopo.charge.util.Pager;

@Repository
public class ChargingStationDaoImpl implements ChargingStationDao {

	@Autowired
	SqlSession sql;
	
	
	
	@Override
	public void add(ChargingStation item) {
		sql.insert("chargingStation.add", item);

	}



	@Override
	public List<ChargingStation> list(Pager pager) {
		return sql.selectList("chargingStation.list", pager);
	}



	@Override
	public ChargingStation item(Long code) {
		return sql.selectOne("chargingStation.item", code);
	}



	@Override
	public void update(ChargingStation item) {
		sql.update("chargingStation.update", item);
		
	}



	@Override
	public void delete(Long code) {
		sql.delete("chargingStation.delete", code);
		
	}



	@Override
	public long total(Pager pager) {
		
		return sql.selectOne("chargingStation.total", pager);
	}



	@Override
	public void locView(ChargingStation item) {
		sql.update("chargingStation.locView", item);
	}



	@Override
	public long mypageTotal(String id) {

		return sql.selectOne("chargingStation.mypageTotal", id);
	}



	@Override
	public List<ChargingStation> mypage(Pager pager, String id) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		
		map.put("id", id);
		map.put("page", pager.getPage());
		map.put("perPage", pager.getPerPage());
		return sql.selectList("chargingStation.mypage", map);
	}



	@Override
	public List<ChargingStation> charList() {
		
		return sql.selectList("chargingStation.charList");
	}







}
