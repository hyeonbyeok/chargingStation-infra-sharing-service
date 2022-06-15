package kr.ac.kopo.charge.service;

import java.util.List;

import kr.ac.kopo.charge.model.CSCF;
import kr.ac.kopo.charge.model.Member;
import kr.ac.kopo.charge.util.Pager;

public interface CscfService {

	void add(CSCF item);

	List<CSCF> list(Pager pager);

	CSCF item(Long code);

	void stats(CSCF item);

	void delete(Long code);

	List<CSCF> mypage(Pager pager, String id);

	

}
