package day1016;

public class TestVO {

	private String name;
	private int myAge;

	public TestVO() {

	}

	public TestVO(String name, int myAge) {
		super();
		this.name = name;
		this.myAge = myAge;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMyAge() {
		return myAge;
	}

	public void setMyAge(int myAge) {
		this.myAge = myAge;
	}

	@Override
	public String toString() {
		return "TestVO [name=" + name + ", myAge=" + myAge + "]";
	}

}
