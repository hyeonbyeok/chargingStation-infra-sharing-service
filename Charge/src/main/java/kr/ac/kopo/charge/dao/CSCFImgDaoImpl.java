package kr.ac.kopo.charge.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.charge.model.CSCFImg;

@Repository
public class CSCFImgDaoImpl implements CSCFImgDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<CSCFImg> item(Long code) {
		
		return sql.selectList("cscfImg.item", code);
	}

	@Override
	public void add(CSCFImg image) {
		sql.insert("cscfImg.add", image);
	}

	@Override
	public void delete(Long code) {
		sql.delete("cscfImg.delete", code);
	}

}
