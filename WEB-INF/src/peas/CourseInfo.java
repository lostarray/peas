package peas;


public class CourseInfo {
	private String teacherno;//�ο���ʦ��
	private String classroom;//������
	private String selcourseremark;//ѡ�α�ע
	private String coursetime;//�Ͽ�ʱ��
	private int classno;//�༶��
	private int startweek;//�Ͽο�ʼ����
	private int endweek;//�Ͽν�������
	private int numofelec;//ѡ������
	private int weekno;//�Ͽ�����
	private String grade;//�Ͽ��꼶
	private boolean isodd;//��˫��
	private String speciality;//����רҵ
	private String schoolarea;//����У��
	
	//add new 
	private String courseno; 		//�γ̺�
	private String coursetype;		//�γ̴���
	private int credit;				//ѧ��
	private int classhour;			//ѧʱ
	private	String type;			//�γ�������
	private String property;		//����
	
	public CourseInfo() { //Ĭ�Ϲ��캯��

	}
	public CourseInfo(GradeInfo GradeInfo) {//���ݶ�����
	
	}
	
	public void Copy(CourseInfo courseInfo) {//���󿽱�
	
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
