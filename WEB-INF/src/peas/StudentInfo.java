package peas;

public class StudentInfo {
	/* 基本信息 */
	private String stuno;
	private String stuname;
	private String gender;
	private String department;
	private String speciality;
	private String birthdate;
	private String admissiontime;	//入学时间
	private String teacher;
	private String culturednature;	//培养性质
	private String master_doctor;	//硕士或博士
	private String schoolrollstate;	//学籍状态
	private String specialityno;	//专业码
	private String nationality;		//国籍
	private String ethnicity;		//民族
	private String personid;		//身份证号
	/* 自然信息 */
	private String pinyin;//拼音姓名
	private String familyaddr;//家庭住址
	private String stationname;//家庭所在地车站名
	private String homephone;//家庭电话
	private String phonenum;//手机号码
	private String email;
	private String zip;//邮编
	/* 毕业信息 */
	private String graduatedate;//毕业信息
	private String photo;//照片
	private String certificate_no;//毕业证书编号
	
	public StudentInfo() { //默认构造函数

	}
	public StudentInfo(StudentInfo stuInfo) {//根据对象构造

	}
	//public 各种get和set函数{

	//}
	public void stuInfoCopy(StudentInfo stuInfo) {//对象拷贝

	}
	
	public String getStuno() {
		return stuno;
	}
	
	public String getStuname() {
		return stuname;
	}
	
	public String getGender() {
		return gender;
	}
	
	public String getDepartment() {
		return department;
	}
	
	public String getSpeciality() {
		return speciality;
	}
	
	public String getBirthdate() {
		return birthdate;
	}
	
	public String getAdmissiontime() {
		return admissiontime;
	}
	
	public String getTeacher() {
		return teacher;
	}
	
	public String getCulturednature() {
		return culturednature;
	}
	
	public String getMaster_doctor() {
		return master_doctor;
	}
	
	public String getSchoolrollstate() {
		return schoolrollstate;
	}
	
	public String getSpecialityno() {
		return specialityno;
	}
	
	public String getNationality() {
		return nationality;
	}
	
	public String getPinyin() {
		return pinyin;
	}
	
	public String getFamilyaddr() {
		return familyaddr;
	}
	
	public String getStationname() {
		return stationname;
	}
	
	public String getHomephone() {
		return homephone;
	}
	
	public String getPhonenum() {
		return phonenum;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getZip() {
		return zip;
	}
	
	public String getGraduatedate() {
		return graduatedate;
	}
	
	public String getPhoto() {
		return photo;
	}
	
	public String getCertificate_no() {
		return certificate_no;
	}
	
	public String getEthnicity() {
		return ethnicity;
	}
	
	public String getPersonid() {
		return personid;
	}
	
	public void setStuno(String stuno) {
		this.stuno = stuno;
	}
	
	public void setStuname(String stuname) {
		this.stuname = stuname;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public void setDepartment(String department) {
		this.department = department;
	}
	
	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}
	
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	
	public void setAdmissiontime(String admissiontime) {
		this.admissiontime = admissiontime;
	}
	
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	
	public void setCulturednature(String culturednature) {
		this.culturednature = culturednature;
	}
	
	public void setMaster_doctor(String master_doctor) {
		this.master_doctor = master_doctor;
	}
	
	public void setSchoolrollstate(String schoolrollstate) {
		this.schoolrollstate = schoolrollstate;
	}
	
	public void setSpecialityno(String specialityno) {
		this.specialityno = specialityno;
	}
	
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	
	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}
	
	public void setFamilyaddr(String familyaddr) {
		this.familyaddr = familyaddr;
	}
	
	public void setStationname(String stationname) {
		this.stationname = stationname;
	}
	
	public void setHomephone(String homephone) {
		this.homephone = homephone;
	}
	
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setZip(String zip) {
		this.zip = zip;
	}
	
	public void setGraduatedate(String graduatedate) {
		this.graduatedate = graduatedate;
	}
	
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public void setCertificate_no(String certificate_no) {
		this.certificate_no = certificate_no;
	}
	
	public void setEthnicity(String ethnicity) {
		this.ethnicity = ethnicity;
	}
	
	public void setPersonid(String personid) {
		this.personid = personid;
	}


}
