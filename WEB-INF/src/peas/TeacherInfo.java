package peas;

public class TeacherInfo {
	private String name;
	private String ename;
	private String title;//ְ��
	private String gender;//�Ա�
	private String remark;//��ע
	public TeacherInfo() { //Ĭ�Ϲ��캯��

	}
	public TeacherInfo(TeacherInfo teacherInfo) {//���ݶ�����
	
	}
	public void Copy(TeacherInfo teacherInfo) {//���󿽱�
	
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
