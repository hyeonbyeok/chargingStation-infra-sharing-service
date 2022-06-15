package kr.ac.kopo.charge.model;

import kr.ac.kopo.charge.util.UploadFile;

public class CImg implements UploadFile {
	private Long code;
	private String filename;
	private String uuid;
	private Long chargingCode;
	
	
	public Long getCode() {
		return code;
	}
	public void setCode(Long code) {
		this.code = code;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public Long getChargingCode() {
		return chargingCode;
	}
	public void setChargingCode(Long chargingCode) {
		this.chargingCode = chargingCode;
	}
	
	

	
	
}
