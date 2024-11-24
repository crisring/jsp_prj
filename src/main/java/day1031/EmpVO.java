package day1031;

import java.sql.Date;

public class EmpVO {

	private int empno, mgr, sal;
	private String ename, job;
	private Date hiredate;

	public EmpVO() {
	}

	public EmpVO(int empno, int mgr, int sal, String ename, String job, Date hiredate) {
		super();
		this.empno = empno;
		this.mgr = mgr;
		this.sal = sal;
		this.ename = ename;
		this.job = job;
		this.hiredate = hiredate;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public int getMgr() {
		return mgr;
	}

	public void setMgr(int mgr) {
		this.mgr = mgr;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	@Override
	public String toString() {
		return "EmpVO [empno=" + empno + ", mgr=" + mgr + ", sal=" + sal + ", ename=" + ename + ", job=" + job
				+ ", hiredate=" + hiredate + ", getEmpno()=" + getEmpno() + ", getMgr()=" + getMgr() + ", getSal()="
				+ getSal() + ", getEname()=" + getEname() + ", getJob()=" + getJob() + ", getHiredate()="
				+ getHiredate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

}// class
