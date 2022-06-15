package kr.ac.kopo.charge.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import kr.ac.kopo.charge.model.Notice;
import kr.ac.kopo.charge.model.NoticeImg;
import kr.ac.kopo.charge.service.NoticeImgService;
import kr.ac.kopo.charge.service.NoticeService;
import kr.ac.kopo.charge.util.Pager;
import kr.ac.kopo.charge.util.Uploader;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	final String path = "notice/";
	
	@Autowired
	NoticeService service;
	
	@Autowired
	NoticeImgService noticeImgService; 
	
	@ResponseBody
	@GetMapping("/image/delete/{code}") 
	public boolean deleteImage(@PathVariable Long code)
	{
		return service.deleteImage(code);
	}
	
	@RequestMapping("/list")
	public String list(Model model, Pager pager) {
		List<Notice> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}

	@GetMapping("/add")
	public String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(Notice item, @SessionAttribute Member member, @RequestParam("noticeImg") List<MultipartFile> noticeImg) {
		try {
			Uploader<NoticeImg> uploader = new Uploader<>();
			
			List<NoticeImg> images = uploader.makeList(noticeImg, NoticeImg.class);
			
			item.setImages(images);
			
			item.setId(member.getId());
			
			service.add(item);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:./list";
	}
	
	@GetMapping("/update/{code}")
	public String update(@PathVariable Long code, Model model, @SessionAttribute Member member) {
		Notice item = service.item(code);
		
		List<NoticeImg> images = noticeImgService.item(code);
		
		model.addAttribute("item", item);
		
		model.addAttribute("images", images);
		
		return path + "update";
	}
	
	@PostMapping("/update/{code}")
	public String update(@PathVariable String code, Notice item, @SessionAttribute Member member, @RequestParam("noticeImg") List<MultipartFile> noticeImg) {
		try {
			Uploader<NoticeImg> uploader = new Uploader<>();
			
			List<NoticeImg> images = uploader.makeList(noticeImg, NoticeImg.class);
			
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
	
	@GetMapping("/view/{code}")
	public String view(Model model,@PathVariable Long code) {
		Notice item = service.item(code);
		
		List<NoticeImg> images = noticeImgService.item(code);
		
		model.addAttribute("item", item);
		
		model.addAttribute("images", images);
		
		return path + "view";
	}
	
	@ResponseBody
	@PostMapping("/view/{code}")
	public Notice view(@PathVariable Long code,@RequestBody Notice item) {
		
		item.setCode(code);
		service.viewCount(item);
		
		return item;
	}
}