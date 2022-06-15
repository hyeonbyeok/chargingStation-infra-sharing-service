package kr.ac.kopo.charge.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.charge.model.CImg;
import kr.ac.kopo.charge.model.ChargingStation;
import kr.ac.kopo.charge.model.Member;
import kr.ac.kopo.charge.service.CImgService;
import kr.ac.kopo.charge.service.ChargingStationService;
import kr.ac.kopo.charge.util.Pager;
import kr.ac.kopo.charge.util.Uploader;


@Controller
@RequestMapping("/chargingStation")
public class ChargingStationController {
	final String path = "chargingStation/";
	
	@Autowired
	ChargingStationService service;
	
	@Autowired
	CImgService cImgService;
	
	@GetMapping("/view/{code}")
	public String view(@PathVariable Long code, Model model) {

		ChargingStation item = service.item(code);
		
		List<CImg> images = cImgService.item(code);
		
		model.addAttribute("item", item);
		
		model.addAttribute("images", images);
		
		return path + "view";
		
	}
	
	@ResponseBody
	@GetMapping("/image/delete/{code}") 
	public boolean deleteImage(@PathVariable Long code)
	{
		return service.deleteImage(code);
	}
	
	
	@GetMapping("/add")
	public String add() {
		return path + "add"; 
	}
	
	@PostMapping("/add")
	public String add(ChargingStation item,@SessionAttribute Member member, @RequestParam("cImg") List<MultipartFile> cImg) {
		try {
			Uploader<CImg> uploader = new Uploader<>();
			
			List<CImg> images = uploader.makeList(cImg, CImg.class);
			
			item.setImages(images);
			
			item.setId(member.getId());
			
			service.add(item);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:.."; //위치찾는 페이지로 변경해줄 것 04월05일
	}
	
	@RequestMapping("/list")
	public String list(Model model, @SessionAttribute Member member, Pager pager) {
	/*	if(!"admin".equals(member.getId())) { //아이디가 admin (관리자 계정) 이 아니면 주소를 입력해도 못들어가게
			return "redirect:.";
		}*/
		List<ChargingStation> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/update/{code}")
	public String update(@PathVariable Long code, Model model,@SessionAttribute Member member) {
	
		ChargingStation item = service.item(code);
		
		List<CImg> images = cImgService.item(code);
		
		model.addAttribute("item", item);
		
		model.addAttribute("images", images);
		
		return path + "update";
	}
	
	@PostMapping("/update/{code}")
	public String update(@PathVariable Long code, ChargingStation item,
			@SessionAttribute Member member,
			@RequestParam("cImg") List<MultipartFile> cImg) {
		
		try {
			Uploader<CImg> uploader = new Uploader<>();
			
			List<CImg> images = uploader.makeList(cImg, CImg.class);
			
			item.setImages(images);
			
			item.setId(member.getId());
			
			service.update(item);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "redirect:../list";
	}
	
	@GetMapping("/delete/{code}")
	public String delete(@PathVariable Long code, @SessionAttribute Member member) {

		service.delete(code);
		
		return "redirect:../list";
	}
	
	@ResponseBody
	@PostMapping("/locView")
	public ChargingStation locView(@RequestBody ChargingStation item) {
		
		service.locView(item);
		
		return item;
	}
}
