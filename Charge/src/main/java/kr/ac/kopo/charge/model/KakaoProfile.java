package kr.ac.kopo.charge.model;

public class KakaoProfile {
	private String id;
	private KakaoAccount kakao_account;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public KakaoAccount getKakao_account() {
		return kakao_account;
	}

	public void setKakao_account(KakaoAccount kakao_account) {
		this.kakao_account = kakao_account;
	}

	public class KakaoAccount {
		private String name;
		private String phone_number;
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getPhone_number() {
			return phone_number;
		}
		public void setPhone_number(String phone_number) {
			this.phone_number = phone_number;
		}	
		
	}
}
