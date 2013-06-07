package peas;

public class GradeInfo {
	private String schoolyear;//学年
	private String schoolterm;//学期
	private String coursename;//所选课程
	private String ename;//课程英文名
	private String teacher;//课程老师
	private String coursetype;//课程类型
	private String credit;//学分
	private String stuno;//学号
	private String stuname;//姓名
	private String grade;//成绩
	private String remark;//备注
	
	public GradeInfo() { //默认构造函数

	}
	
	public GradeInfo(GradeInfo GradeInfo) {//根据对象构造

	}
	
	public void Copy(GradeInfo gradeInfo) {//对象拷贝

	}
	
	public String getYear() {
		return schoolyear;
	} 
	
	public String getTerm() {
		return schoolterm;
	}
	
	public String getCourse() {
		return coursename;
	}
	
	public String getEname() {
		return ename;
	}
	
	public String getTeacher() {
		return teacher;
	}
	
	public String getCoursetype() {
		return coursetype;
	}
	
	public String getCredit() {
		return credit;
	}
	
	public String getStuno() {
		return stuno;
	}
	
	public String getStuname() {
		return stuname;
	}
	
	public String getGrade() {
		return grade;
	}
	
	public String getRemark() {
		return remark;
	}
	
	public void setYear(String schoolyear) {
		this.schoolyear = schoolyear;
	}
	
	public void setTerm(String schoolterm) {
		this.schoolterm = schoolterm;
	}
	
	public void setCourse(String coursename) {
		this.coursename = coursename;
	}
	
	public void setEname(String ename) {
		this.ename = ename;
	}
	
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	
	public void setCoursetype(String coursetype) {
		this.coursetype = coursetype;
	}
	
	public void setCredit(String credit) {
		this.credit = credit;
	}
	
	public void setStuno(String stuno) {
		this.stuno = stuno;
	}
	
	public void setStuname(String stuname) {
		this.stuname = stuname;
	}
	
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public void setRemark(String remark) {
		this.remark = remark;
	}

}
