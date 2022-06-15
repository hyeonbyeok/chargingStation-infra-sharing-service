package kr.ac.kopo.charge.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.charge.model.Notice;
import kr.ac.kopo.charge.util.Pager;
@Repository
public class NoticeDaoImpl implements NoticeDao {

	
	@Autowired
	SqlSession sql;
	
	@Override
	public long total(Pager pager) {
		
		return sql.selectOne("notice.total",pager);
	}

	@Override
	public List<Notice> list(Pager pager) {
		
		return sql.selectList("notice.list", pager);
	}

	@Override
	public void add(Notice item) {
		sql.insert("notice.add", item);
		
	}

	@Override
	public void delete(Long code) {
		sql.delete("notice.delete",code);
	}

	@Override
	public Notice item(Long code) {
		return sql.selectOne("notice.item",code);
	}

	@Override
	public void update(Notice item) {
		sql.update("notice.update",item);
	}

	@Override
	public void viewCount(Notice item) {
		
		 
		 sql.update("notice.viewCount", item);
	}

}
