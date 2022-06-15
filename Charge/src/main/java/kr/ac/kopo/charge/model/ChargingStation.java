package kr.ac.kopo.charge.model;

import java.util.List;

public class ChargingStation {
	private Long code;
	private String id;
	private String name;
	private String address;
	private String organization;
	private String tel;
	private String fare;
	private String availableTime;
	private String type;
	private String chargeAmount;
	private char display;
	
	private List<CImg> images;
	
	private String availableTime1;
	private String availableTime2;
	private String tel1;
	private String tel2;
	private String tel3;
	
	private double lat;
	private double lng;
	
	
	
	
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public List<CImg> getImages() {
		return images;
	}
	public void setImages(List<CImg> images) {
		this.images = images;
	}
	
	
	public String getAvailableTime1() {
		return availableTime1;
	}
	public void setAvailableTime1(String availableTime1) {
		this.availableTime1 = availableTime1;
	}
	public String getAvailableTime2() {
		return availableTime2;
	}
	public void setAvailableTime2(String availableTime2) {
		this.availableTime2 = availableTime2;
	}
	
	
	public Long getCode() {
		return code;
	}
	public void setCode(Long code) {
		this.code = code;
	}
	public String getTel1() {
		if(tel1 == null) {
			tel1 = tel.substring(0,3);
			System.out.println(tel1);
			return tel1;
		}
		else
			return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		if(tel2 == null) {
			tel2 = tel.substring(4,8);
			System.out.println(tel2);
			return tel2;
		}
		else
			return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		if(tel3 == null) {
			tel3 = tel.substring(9,13);
			System.out.println(tel3);
			return tel3;
		}
		else
			return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOrganization() {
		return organization;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}
	public String getTel() {
		
		return tel;
	}
	public void setTel(String tel) {		
		this.tel = tel;
	}
	public String getFare() {
		return fare;
	}
	public void setFare(String fare) {
		this.fare = fare;
	}
	public String getAvailableTime() {
		return availableTime;
	}
	public void setAvailableTime(String availableTime) {
		this.availableTime = availableTime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getChargeAmount() {
		return chargeAmount;
	}
	public void setChargeAmount(String chargeAmount) {
		this.chargeAmount = chargeAmount;
	}
	public char getDisplay() {
		return display;
	}
	public void setDisplay(char display) {
		this.display = display;
	}
	
	
	
}
