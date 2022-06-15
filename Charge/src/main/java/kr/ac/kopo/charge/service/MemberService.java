package kr.ac.kopo.charge.service;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.charge.model.Member;
import kr.ac.kopo.charge.util.Pager;

public interface MemberService {

	void add(Member member);

	boolean login(Member member);

	void update(Member member);

	boolean checkId(String id);

	Member mypage(String id);

	void delete(String id);

	List<Member> list(Pager pager);

	void remove(String id);

	Member findId(Member member);

	void newPasswd(Member member);

	Member item(Member member);

	boolean checkPw(HashMap<String, Object> map);

	void pwChange(Member member);

}
