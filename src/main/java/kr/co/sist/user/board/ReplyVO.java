package kr.co.sist.user.board;

import java.sql.Date;

public class ReplyVO {

	private int num, ref_num;
	private String content, ip, writer;
	private Date input_date;

	public ReplyVO() {

	}

	public ReplyVO(int num, int ref_num, String content, String ip, String writer, Date input_date) {
		super();
		this.num = num;
		this.ref_num = ref_num;
		this.content = content;
		this.ip = ip;
		this.writer = writer;
		this.input_date = input_date;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getRef_num() {
		return ref_num;
	}

	public void setRef_num(int ref_num) {
		this.ref_num = ref_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getInput_date() {
		return input_date;
	}

	public void setInput_date(Date input_date) {
		this.input_date = input_date;
	}

	@Override
	public String toString() {
		return "ReplyVO [num=" + num + ", ref_num=" + ref_num + ", content=" + content + ", ip=" + ip + ", writer="
				+ writer + ", input_date=" + input_date + "]";
	}

}// class
