package day1016;

import java.util.Arrays;

public class FormControlVO {

	private String name, gender;
	private int age;
	private String[] hobby;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}

	@Override
	public String toString() {
		return "FormControlVO [name=" + name + ", gender=" + gender + ", age=" + age + ", hobby="
				+ Arrays.toString(hobby) + "]";
	}

}
