package peas;

public class GradeInfo {
	private String year;//ѧ��
	private String term;//ѧ��
	private String course;//��ѡ�γ�
	private String ename;//�γ�Ӣ����
	private String teacher;//�γ���ʦ
	private String coursetype;//�γ�����
	private String credit;//ѧ��
	private String stuno;//ѧ��
	private String stuname;//����
	private String grade;//�ɼ�
	private String remark;//��ע
	public GradeInfo() { //Ĭ�Ϲ��캯��

	}
	public GradeInfo(GradeInfo GradeInfo) {//���ݶ�����

	}
	
	public void Copy(GradeInfo gradeInfo) {//���󿽱�

	}
	public String getYear() {
		return year;
	}
	public String getTerm() {
		return term;
	}
	public String getCourse() {
		return course;
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
	public void setYear(String year) {
		this.year = year;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public void setCourse(String course) {
		this.course = course;
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
