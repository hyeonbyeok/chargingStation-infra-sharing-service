package kr.ac.kopo.charge.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.charge.model.CSCF;
import kr.ac.kopo.charge.model.Member;
import kr.ac.kopo.charge.util.Pager;
@Repository
public class CscfDaoImpl implements CscfDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void add(CSCF item) {
		sql.insert("cscf.add",item);
		
	}

	@Override
	public List<CSCF> list(Pager pager) {
		
		return sql.selectList("cscf.list", pager);
	}

	@Override
	public long total(Pager pager) {
		
		return sql.selectOne("cscf.total", pager);
	}

	@Override
	public CSCF item(Long code) {
		
		return sql.selectOne("cscf.item", code);
		
	}

	@Override
	public void stats(CSCF item) {
		sql.update("cscf.stats", item);
		
	}

	@Override
	public void delete(Long code) {
		sql.delete("cscf.delete", code);
		
	}

	@Override
	public List<CSCF> mypage(Pager pager, String id) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		
		map.put("id", id);
		map.put("page", pager.getPage());
		map.put("perPage", pager.getPerPage());
		return sql.selectList("cscf.mypage", map);
	}

	@Override
	public long mypageTotal(String id) {

		return sql.selectOne("cscf.mypageTotal", id);
	}

}
