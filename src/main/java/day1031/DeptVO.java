package day1031;

public class DeptVO {

	private int deptno;
	private String dname, loc, status;

	public DeptVO() {

	}

	public DeptVO(int deptno, String dname, String loc, String status) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
		this.status = status;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "DeptVO [deptno=" + deptno + ", dname=" + dname + ", loc=" + loc + ", status=" + status + "]";
	}

}
