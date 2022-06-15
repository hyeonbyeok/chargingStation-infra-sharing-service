package kr.ac.kopo.charge.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.charge.dao.MemberDao;
import kr.ac.kopo.charge.model.Member;
import kr.ac.kopo.charge.util.Pager;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao;
	
	@Override
	public boolean login(Member member) {
		Member item = dao.item(member);

		if (item != null) {
			member.setPasswd(null);
			member.setTel(item.getTel());
			member.setName(item.getName());
			member.setEmail(item.getEmail());
			return true;
		}
		return false;
	}

	@Override
	public void add(Member member) {
		dao.add(member);

	}

	@Override
	public void update(Member member) {
		dao.update(member);

	}

	@Override
	public void delete(String id) {
		
		dao.delete(id);
	}

	@Override
	public boolean checkId(String id) {
		if (dao.checkId(id) == 0)
			return true;
		else
			return false;
	}
	@Override
	public boolean checkPw(HashMap<String, Object> map) {
		if (dao.checkPw(map) == 1)
			return true;
		else
			return false;
	}


	@Override
	public Member mypage(String id) {
		
		return dao.mypage(id);
	}

	@Override
	public List<Member> list(Pager pager) {
		
		return dao.list(pager);
	}

	@Override
	public void remove(String id) {
		dao.remove(id);
		
	}

	@Override
	public Member findId(Member member) {
		
		return dao.findId(member);
	}

	@Override
	public void newPasswd(Member member) {
		dao.newPasswd(member);
		
	}

	@Override
	public Member item(Member member) {
		
		return dao.item(member);
	}

	@Override
	public void pwChange(Member member) {
		dao.pwChange(member);
		
	}

	

	
}
