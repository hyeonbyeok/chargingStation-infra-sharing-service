package kr.ac.kopo.charge.dao;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.charge.model.Member;
import kr.ac.kopo.charge.util.Pager;

public interface MemberDao {

	Member item(Member member);

	void add(Member member);

	void update(Member member);



	int checkId(String id);

	Member mypage(String id);

	void delete(String id);

	List<Member> list(Pager pager);

	void remove(String id);

	Member findId(Member member);

	void newPasswd(Member member);

	int checkPw(HashMap<String, Object> map);

	void pwChange(Member member);


}
