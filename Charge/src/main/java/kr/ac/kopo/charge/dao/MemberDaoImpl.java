package kr.ac.kopo.charge.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.charge.model.Member;
import kr.ac.kopo.charge.util.Pager;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public Member item(Member member) {
		return sql.selectOne("member.login", member);
	}

	@Override
	public void add(Member member) {
		sql.insert("member.add",member);
	}

	@Override
	public void update(Member member) {
		sql.update("member.update", member);
	}

	@Override
	public void delete(String id) {
		sql.delete("member.delete", id);
	}

	@Override
	public int checkId(String id) {
		return sql.selectOne("member.check_id", id);
	}
	@Override
	public int checkPw(HashMap<String, Object> map) {
		return sql.selectOne("member.check_pw", map);
	}

	@Override
	public Member mypage(String id) {
		return sql.selectOne("member.mypage", id);
	}

	@Override
	public List<Member> list(Pager pager) {
	
		return sql.selectList("member.list", pager);
	}

	@Override
	public void remove(String id) {
		sql.delete("member.remove", id);
		
	}

	@Override
	public Member findId(Member member) {
		
		return sql.selectOne("member.findId", member);
	}

	@Override
	public void newPasswd(Member member) {
		String password = member.getPasswd();

		member.setPasswd(password);

		sql.update("member.newPasswd", member);
		
	}

	@Override
	public void pwChange(Member member) {
		sql.update("member.pwChange", member);
		
	}



	

}
