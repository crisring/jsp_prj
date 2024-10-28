package day1018;

public class DataVO {

	private String img, name, info;
	private int itemNum;

	public DataVO() {

	}

	public DataVO(String img, String name, String info, int itemNum) {
		super();
		this.img = img;
		this.name = name;
		this.info = info;
		this.itemNum = itemNum;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	@Override
	public String toString() {
		return "DataVO [img=" + img + ", name=" + name + ", info=" + info + ", itemNum=" + itemNum + "]";
	}

}
