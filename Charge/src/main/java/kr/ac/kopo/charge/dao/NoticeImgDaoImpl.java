package kr.ac.kopo.charge.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.charge.model.NoticeImg;
@Repository
public class NoticeImgDaoImpl implements NoticeImgDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void add(NoticeImg image) {
		sql.insert("noticeImg.add", image);
		
	}


	@Override
	public List<NoticeImg> item(Long code) {
		return sql.selectList("noticeImg.item", code);
	}


	@Override
	public boolean delete(Long code) {
		if(sql.delete("noticeImg.delete", code) > 0)
			return true;
		else
			return false;
	}

}
