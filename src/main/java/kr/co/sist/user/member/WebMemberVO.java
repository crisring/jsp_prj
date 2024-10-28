package kr.co.sist.user.member;

import java.util.Arrays;

public class WebMemberVO {
	private String id,pass,name,birth,tel,cellphone,save,
	email1,email2,email,gender,location,zipcode,addr1,addr2,ip;
	
	private String[] lang;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

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

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getSave() {
		return save;
	}

	public void setSave(String save) {
		this.save = save;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
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

	public String[] getLang() {
		return lang;
	}

	public void setLang(String[] lang) {
		this.lang = lang;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Override
	public String toString() {
		return "WebMemberVO [id=" + id + ", pass=" + pass + ", name=" + name + ", birth=" + birth + ", tel=" + tel
				+ ", cellphone=" + cellphone + ", save=" + save + ", email1=" + email1 + ", email2=" + email2
				+ ", email=" + email + ", gender=" + gender + ", location=" + location + ", zipcode=" + zipcode
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", ip=" + ip + ", lang=" + Arrays.toString(lang) + "]";
	}

	
}
