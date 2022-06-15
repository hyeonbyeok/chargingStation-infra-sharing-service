package kr.ac.kopo.charge.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.charge.model.CSCF;
import kr.ac.kopo.charge.model.ChargingStation;
import kr.ac.kopo.charge.model.Member;
import kr.ac.kopo.charge.service.ChargingStationService;
import kr.ac.kopo.charge.service.CscfService;
import kr.ac.kopo.charge.service.MemberService;
import kr.ac.kopo.charge.util.Pager;

@Controller
@RequestMapping("/mypage")
public class MyController {

	final String path = "mypage/";

	@Autowired
	MemberService memberService;
	
	@Autowired
	CscfService cscfService;

	@Autowired
	ChargingStationService CSService;
	
	@PostMapping("pwChange")
	public String pwChange(Member member) {
		memberService.pwChange(member);
		
		return "index";
	}
	@ResponseBody
	@GetMapping("/checkPw")
	public String checkPw(String passwd, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("passwd", passwd);
		if(memberService.checkPw(map))
			return "OK";
		else
			return "FAIL";
	}
	
	@GetMapping("/pwChange")
	public String pwChange(HttpSession session) {		
		Member member = (Member) session.getAttribute("memeber");
		
		
		return path + "pwChange";
	}
	
	@RequestMapping("/list")
	public String list(Pager pager, Model model) {
		
		List<Member> list = memberService.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@RequestMapping("")
	public String myPage(Pager pager, Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("member");
	
		List<CSCF> list = cscfService.mypage(pager, member.getId());

		model.addAttribute("list", list);
		
		List<ChargingStation> CSlist= CSService.mypage(pager, member.getId());

		model.addAttribute("CSlist", CSlist);
		
		return path + "mypage";
	}
	
	
	@GetMapping("/update")
	public String update() {
		return path + "update";
	}
	
	@PostMapping("/update")
	public String update(Member member, HttpSession session) {
		memberService.update(member);
		
		session.setAttribute("member", member);
		
		return "redirect:./";
		
	}
	
	@GetMapping("/delete")
	public String delete(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		
		memberService.delete(member.getId());
		
		session.invalidate();
		
		return "redirect:../";
	}
	
	@GetMapping("/remove/{id}")
	public String delete(@PathVariable String id) {
		
		memberService.remove(id);
		
		
		return "redirect:../list";
	}
}
