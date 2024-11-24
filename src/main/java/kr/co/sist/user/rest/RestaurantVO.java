package kr.co.sist.user.rest;

import java.sql.Date;

public class RestaurantVO {

	private int num;
	private String restaurant, menu, info, id;
	private double lng, lat;
	private Date input_date;

	public RestaurantVO() {

	}

	public RestaurantVO(int num, String restaurant, String menu, String info, String id, double lng, double lat,
			Date input_date) {
		super();
		this.num = num;
		this.restaurant = restaurant;
		this.menu = menu;
		this.info = info;
		this.id = id;
		this.lng = lng;
		this.lat = lat;
		this.input_date = input_date;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public Date getInput_date() {
		return input_date;
	}

	public void setInput_date(Date input_date) {
		this.input_date = input_date;
	}

	@Override
	public String toString() {
		return "RestaurantVO [num=" + num + ", restaurant=" + restaurant + ", menu=" + menu + ", info=" + info + ", id="
				+ id + ", lng=" + lng + ", lat=" + lat + ", input_date=" + input_date + "]";
	}

}
