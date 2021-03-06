package kr.ac.kopo.charge.controller;


import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


import kr.ac.kopo.charge.model.ChargingStation;
import kr.ac.kopo.charge.model.KakaoProfile;
import kr.ac.kopo.charge.model.Member;
import kr.ac.kopo.charge.model.OAuthToken;
import kr.ac.kopo.charge.service.CImgService;
import kr.ac.kopo.charge.service.ChargingStationService;
import kr.ac.kopo.charge.service.CscfService;
import kr.ac.kopo.charge.service.MemberService;



@Controller
@RequestMapping("/")
public class RootController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	CscfService cscfService;
	
	@Autowired
	ChargingStationService chargingStationService;
	
	@Autowired
	CImgService cImgService;
	
	@Autowired
	protected JavaMailSender mailSender;
	
	@GetMapping("/findPw")
	public String findPw(){
		return "findPw";
	}

	
	@RequestMapping("/newPassword")
	public String newPassword(Member member) throws Exception {
		// ????????? ??????????????? ????????????.
		Random r = new Random();

		int num = r.nextInt(89999) + 10000;

		String npassword = "EV_MAP" + Integer.toString(num);// ????????? ???????????? ??????

		member.setPasswd(npassword);

		memberService.newPasswd(member);
		
		member = memberService.item(member);
		
		//????????? ?????????.
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail ,"UTF-8");
			System.out.println(member.getEmail());
			mailHelper.setFrom("????????? ????????? ?????????");
			mailHelper.setTo(member.getEmail());
			mailHelper.setSubject("???????????????"+member.getEmail() +"???  ???????????? ??????????????? ??????????????????");
			mailHelper.setText("????????? ???????????? " + member.getPasswd() + " ?????????. \n http://localhost:9090/login");
			mailSender.send(mail);
		}catch (MessagingException e) {
			System.out.println("MessagingException");
			e.printStackTrace();
		}
		

		return "findPwView";

	}
	
	@GetMapping("/findId")
	public String findId() {
		
		return "findId";
	}
	
	@PostMapping("/findId")
	public String findId(Model model, Member member) {
		Member user = memberService.findId(member);
		
		if(user == null) {
			model.addAttribute("check", 1);

		}else {
			model.addAttribute("check", 0);
			model.addAttribute("id", user.getId());
		}
		
		return "findIdView";
	}
	
	
	@ResponseBody
	@GetMapping("/charInfo")
	public List<ChargingStation> CharInfo() {
		
		List<ChargingStation> item = chargingStationService.charList();
		
		for(ChargingStation station : item)
			System.out.println(station.getAvailableTime());		
		
		return item;
	}
	
	
	@GetMapping("/TT-E")
	public String TT_E(Model model){
		List<ChargingStation> list = chargingStationService.charList();
		
		model.addAttribute("list", list);
		
		return "TT-E";
	}
	
	
	@RequestMapping("/")
	public String index() {
		
		
		return "index";
	}
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@PostMapping("/signup")
	public String signup(Member member, RedirectAttributes ra) {
		memberService.add(member);
		
		ra.addFlashAttribute("msg","??????????????? ?????? ???????????????."); //????????? ???????????? ?????? ???????????? addFlashAttribute
		
		return "redirect:.";
	}
	
	@GetMapping("/login")
	public String login(Model model, HttpSession session) {
		
		String msg =  (String) session.getAttribute("msg");
		if(msg != null) {
			session.removeAttribute("msg");
			
			model.addAttribute("msg",msg);
		}
		return "login";
	}
	
	@PostMapping("/login")
	public String login(Member member, HttpSession session) {
		if(memberService.login(member)) {
			session.setAttribute("member", member);
			
			String target = (String) session.getAttribute("target");
			session.removeAttribute("target");
			
			return "redirect:" + (target == null ? "/" : target);
		}
		session.setAttribute("msg", "???????????? ?????????????????????.");
		
		return "redirect:/login";
	}
	
	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(String code,HttpSession httpSession) { //Data??? ??????????????? ???????????? ??????, @ResponseBody??? ???????????? ????????????
		
		//POST???????????? key=value???????????? ??????(??????????????????)
		RestTemplate restTemplate = new RestTemplate();
		
		//HttpHeader ???????????? ??????
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//HttpBody ???????????? ??????
		MultiValueMap<String, String>params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "e7b4358dfc6b1b8ac07e85a738cd27e1");
		params.add("redirect_uri", "http://localhost:9050/auth/kakao/callback");
		params.add("code",code);
		
		//HttpHeader??? HttpBody??? ????????? ??????????????? ??????
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
				new HttpEntity<>(params,headers);
		
		//Http???????????? - Post???????????? - ????????? response ????????? ????????????.
		ResponseEntity<String> response = restTemplate.exchange(
			"https://kauth.kakao.com/oauth/token",
			HttpMethod.POST,
			kakaoTokenRequest,
			String.class
		);
		
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		System.out.println("????????? ????????? ??????:"+oauthToken.getAccess_token());
		
		RestTemplate restTemplate2 = new RestTemplate();
		
		//HttpHeader ???????????? ??????
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//HttpHeader??? HttpBody??? ????????? ??????????????? ??????
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 =
				new HttpEntity<>(headers2);
		
		//Http???????????? - Post???????????? - ????????? response ????????? ????????????.
		ResponseEntity<String> response2 = restTemplate2.exchange(
			"https://kapi.kakao.com/v2/user/me",
			
			HttpMethod.POST,
			kakaoProfileRequest2,
			String.class
		);
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	
		Member member = new Member();
		member.setId(kakaoProfile.getId());
		member.setName(kakaoProfile.getKakao_account().getName());
		member.setTel(kakaoProfile.getKakao_account().getPhone_number());
		
		
		//?????????????????? ???????????? ????????? ???????????? ??? ????????? ????????? ?????? ??????????????????
		httpSession.setAttribute("member", member);
		

		return "index";
	
	}
	
	@ResponseBody
	@GetMapping("/checkId")
	public String checkId(String id) {
		if (memberService.checkId(id))
			return "OK";
		else
			return "FAIL";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:.";
	}
	
	@GetMapping("/electronicList")
	public String electronicList() {

		
		return "electronicList";
	}

	@RequestMapping("/adminMode")
	public String adminMode() {
		return "adminMode";
	}
}



















