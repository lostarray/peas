package peas;


public class CourseInfo {
	private String teacherno;//任课老师名
	private String classroom;//教室名
	private String selcourseremark;//选课备注
	private String coursetime;//上课时间
	private int classno;//班级号
	private int startweek;//上课开始星期
	private int endweek;//上课结束星期
	private int numofelec;//选课人数
	private int weekno;//上课周数
	private String grade;//上课年级
	private boolean isodd;//单双周
	private String speciality;//所属专业
	private String schoolarea;//所属校区
	
	//add new 
	private String courseno; 		//课程号
	private String coursetype;		//课程大类
	private int credit;				//学分
	private int classhour;			//学时
	private	String type;			//课程子类型
	private String property;		//性质
	
	public CourseInfo() { //默认构造函数

	}
	public CourseInfo(GradeInfo GradeInfo) {//根据对象构造
	
	}
	
	public void Copy(CourseInfo courseInfo) {//对象拷贝
	
	}
	
	public String getCoursetype() {
		return coursetype;
	}
	
	public String getTeacherno() {
		return teacherno;
	}
	
	public String getClassroom() {
		return classroom;
	}
	
	public String getSelcourseremark() {
		return selcourseremark;
	}
	
	public String getCoursetime() {
		return coursetime;
	}
	
	public int getClassno() {
		return classno;
	}
	
	public int getStartweek() {
		return startweek;
	}
	
	public int getEndweek() {
		return endweek;
	}
	
	public int getNumofelec() {
		return numofelec;
	}
	
	public int getWeekno() {
		return weekno;
	}
	
	public String getGrade() {
		return grade;
	}
	
	public boolean isIsodd() {
		return isodd;
	}
	
	public String getSpeciality() {
		return speciality;
	}
	
	public String getSchoolarea() {
		return schoolarea;
	}
	
	public int getCredit() {
		return credit;
	}
	
	public int getClasshour() {
		return classhour;
	}
	
	public String getType() {
		return type;
	}
	
	public String getProperty() {
		return property;
	}
	
	public String getCourseno() {
		return courseno;
	}
	
	public void setCoursetype(String coursetype) {
		this.coursetype = coursetype;
	}
	
	public void setTeacher(String teacherno) {
		this.teacherno = teacherno;
	}
	
	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}
	
	public void setSelcourseremark(String selcourseremark) {
		this.selcourseremark = selcourseremark;
	}
	
	public void setCoursetime(String coursetime) {
		this.coursetime = coursetime;
	}
	
	public void setClassno(int classno) {
		this.classno = classno;
	}
	
	public void setStartweek(int startweek) {
		this.startweek = startweek;
	}
	
	public void setEndweek(int endweek) {
		this.endweek = endweek;
	}
	
	public void setNumofelec(int numofelec) {
		this.numofelec = numofelec;
	}
	
	public void setWeekno(int weekno) {
		this.weekno = weekno;
	}
	
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public void setIsodd(boolean isodd) {
		this.isodd = isodd;
	}
	
	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}
	
	public void setSchoolarea(String schoolarea) {
		this.schoolarea = schoolarea;
	}
	
	public void setCredit(int credit) {
		this.credit = credit;
	}
	
	public void setClasshour(int classhour) {
		this.classhour = classhour;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public void setProperty(String property) {
		this.property = property;
	}
	
	public void setCourseno(String courseno) {
		this.courseno = courseno;
	}

}
