package day1016;

import java.util.Arrays;

public class JoinVO {

	private String name;
	private String birth;
	private String tel;
	private String email;
	private String gender;
	private String[] lang;
	private String[] location;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String addr = (addr1 != null ? addr1 : "") + " " + (addr2 != null ? addr2 : "");

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String[] getLang() {
		return lang;
	}

	public void setLang(String[] lang) {
		this.lang = lang;
	}

	public String[] getLocation() {
		return location;
	}

	public void setLocation(String[] location) {
		this.location = location;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	@Override
	public String toString() {
		return "JoinVO [name=" + name + ", birth=" + birth + ", tel=" + tel + ", email=" + email + ", gender=" + gender
				+ ", lang=" + Arrays.toString(lang) + ", location=" + Arrays.toString(location) + ", zipcode=" + zipcode
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", addr=" + addr + "]";
	}

}
