package kr.ac.kopo.charge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/produce")
public class ProduceController {
	final String path = "produce/";
	
	@RequestMapping("/infoview")
	public String infoview() {
		return path + "infoview";
	}
	
	@RequestMapping("/agreed")
	public String agreed() {
		return path + "agreed";
	}
	
	@RequestMapping("/privacy")
	public String privacy() {
		return path + "privacy";
	}
	
	@RequestMapping("/locations")
	public String locations() {
		return path + "locations";
	}
}
