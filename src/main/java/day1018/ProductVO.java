package day1018;

import java.util.Date;

public class ProductVO {

	private int itemNO;
	private String img;
	private int price;
	private Date date;

	public ProductVO() {

	}

	public ProductVO(int itemNO, String img, int price, Date date) {
		super();
		this.itemNO = itemNO;
		this.img = img;
		this.price = price;
		this.date = date;
	}

	public int getItemNO() {
		return itemNO;
	}

	public void setItemNO(int itemNO) {
		this.itemNO = itemNO;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "ProductVO [itemNO=" + itemNO + ", img=" + img + ", price=" + price + "]";
	}

}
