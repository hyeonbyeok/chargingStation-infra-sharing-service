package kr.ac.kopo.charge.dao;

import java.util.List;

import kr.ac.kopo.charge.model.CSCF;
import kr.ac.kopo.charge.model.Member;
import kr.ac.kopo.charge.util.Pager;

public interface CscfDao {

	void add(CSCF item);

	List<CSCF> list(Pager pager);

	long total(Pager pager);

	CSCF item(Long code);

	void stats(CSCF item);

	void delete(Long code);

	List<CSCF> mypage(Pager pager,  String id);

	long mypageTotal(String id);

}
