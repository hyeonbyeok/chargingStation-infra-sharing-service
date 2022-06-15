package kr.ac.kopo.charge.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.charge.model.CImg;
@Repository
public class CImgDaoImpl implements CImgDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void add(CImg image) {
		sql.insert("cImg.add", image);
		
	}

	@Override
	public boolean delete(Long code) {
		if(sql.delete("cImg.delete", code) > 0)
			return true;
		else
			return false;
	}

	@Override
	public List<CImg> item(Long code) {
		
		return sql.selectList("cImg.item", code);
	}



	

}
