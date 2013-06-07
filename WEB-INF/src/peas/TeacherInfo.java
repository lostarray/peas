package peas;

public class TeacherInfo {
	private String name;
	private String ename;
	private String title;//职称
	private String gender;//性别
	private String remark;//备注
	public TeacherInfo() { //默认构造函数

	}
	public TeacherInfo(TeacherInfo teacherInfo) {//根据对象构造
	
	}
	public void Copy(TeacherInfo teacherInfo) {//对象拷贝
	
	}
	public String getName() {
		return name;
	}
	public String getEname() {
		return ename;
	}
	public String getTitle() {
		return title;
	}
	public String getGender() {
		return gender;
	}
	public String getRemark() {
		return remark;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

}
