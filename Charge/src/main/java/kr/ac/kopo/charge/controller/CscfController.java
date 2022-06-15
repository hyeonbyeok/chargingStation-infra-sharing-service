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
import kr.ac.kopo.charge.model.CSCF;
import kr.ac.kopo.charge.model.CSCFImg;
import kr.ac.kopo.charge.model.Member;
import kr.ac.kopo.charge.service.CSCFImgService;
import kr.ac.kopo.charge.service.CscfService;
import kr.ac.kopo.charge.util.Pager;
import kr.ac.kopo.charge.util.Uploader;

@Controller
@RequestMapping("/cscf")
public class CscfController {
	final String path = "cscf/";
	
	@Autowired
	CSCFImgService CSCFImgService;
	
	@Autowired
	CscfService service;
	
	@GetMapping("/add")
	public String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(CSCF item, @SessionAttribute Member member, @RequestParam("cscfImg") List<MultipartFile> cscfImg) {
		try {
			Uploader<CSCFImg> uploader = new Uploader<>();
			
			List<CSCFImg> images = uploader.makeList(cscfImg, CSCFImg.class);
			
			item.setImages(images);
			
			item.setId(member.getId());
			
			service.add(item);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return "redirect:..";
	}
	
	@RequestMapping("/list")
	public String list(Model model, Pager pager) {
		
		List<CSCF> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		
		return path + "list";
	}
	
	@GetMapping("/view/{code}")
	public String view(@PathVariable Long code, Model model){
		
		CSCF item = service.item(code);
		
		model.addAttribute("item", item);
		
		List<CSCFImg> images = CSCFImgService.item(code);
		
		model.addAttribute("images", images);
		
		return path + "view";
	}
	
	@ResponseBody
	@PostMapping("/view/{code}")
	public CSCF view(@PathVariable Long code,@RequestBody CSCF item) {
		item.setCode(code);
		
		service.stats(item);
		
		return item;
	}
	
	@GetMapping("/delete/{code}")
	public String delete(@PathVariable Long code, CSCF item) {
		
		service.delete(code);
		
		return "redirect:../list";
	}
}
