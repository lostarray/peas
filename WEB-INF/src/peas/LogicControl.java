package peas;

import java.sql.*;


public interface LogicControl {
	/********************ѧ���ӽ�***********************/
	ResultSet login(String username, String password);//��½
	ResultSet getadmissiontime(String username);//��ȡ��ѧʱ��
	ResultSet getBasicInfo(String username);//��ȡѧ��������Ϣ
	ResultSet getNaturalInfo(String username);//��ȡѧ����Ȼ��Ϣ
	boolean alterNaturalInfo(String stuno, String pinyin, String familyaddr, String stationname, String homephone, String phonenum, String email, String zip);//�޸���Ȼ��Ϣ
	ResultSet getGraduateInfo(String username);//��ȡѧ����ҵ��Ϣ
	boolean chooseCourse (String courseno, String stuno, String schoolyear, String schoolterm, int grade, String remark, int classno);//ѡ��
	int isSelected(String stuno, String cournseno, String schoolyear, String schoolterm); //�ж�ѡ�ε�״̬
	ResultSet displayCourseInfo(String username, String classkind, String schoolyear, String schoolterm);//��ʾѡ����Ϣ
	ResultSet getChosenCourseInfo(String courseno, String schoolyear, String schoolterm);//��ȡ��ǰѡ�������Ϣ
	public ResultSet getMyCourseInfo(String stuno, String schoolyear, String schoolterm);//��ȡ
	boolean withdrawCourse (String stuno, String courseno, String schoolyear, String schoolterm, int classno);//��ѡ
	ResultSet getGradeInfo(String username, String schoolyear, String schoolterm);//�ɼ��鿴
	int creditStatistics(String username, String coursetype);//ͳ��ѧ��

	/*******************����Ա�ӽ�***********************/
	ResultSet searchStudentno(String stuno, String username);//ͨ��ѧ�Ų�ѯѧ����Ϣ��username��Ϊ��ȷ��Ժϵ��Ϣ
	ResultSet searchStudentname(String stuname, String username);//ͨ��������ѯѧ����Ϣ�����ܻ������������Է������飩
	ResultSet filterStudent(String nationality, String culturednature, String admissiontime, String gender, int schoolrollstate, String master_doctor, String teacherno, String username);//ͨ������ѧ����Ϣ��ɸѡѧ����Ϣ
	ResultSet findAllTeachers(String username);
	ResultSet teacherManage(String username);//���뵼ʦ������棬�����ʦ��Ϣ
	boolean teacherAdd(String username,String teacherno,String name,String ename,String gender,String title,String remark);//��ӵ�ʦ�����ز������
	boolean teacherAlter(String teacherno,String ename,String title,String remark);//�޸ĵ�ʦ�����ز������
	boolean teacherDelete(String teacherno);//ɾ����ʦ�����ز������
	ResultSet teacherAndstudent(String username, String year, String degree);//ʦ������
	boolean optionalteacher(String stuno, String teacherno);//���ؿ�ѡ��ʦ�����б�
	ResultSet beyondtimeManage(String year, String degree, String nationality, String username);//���ڹ�������ѯ����
	//ResultSet stu_detail(String detail);//�������ϸ��Ϣ������ѧ����Ϣҳ��
	//Fileset exporttoExcel(String export);//���������ΪExcel��������������Excel�ļ���
	ResultSet graduateMange(String username, String year, String degree, int stustate);//��ҵ��Ϣ���������Ȳ���
	ResultSet graduateStu(String username, String stuno);//��ѧ������ѧ����ҵ��Ϣ
	boolean altergraduateInfo(String stuno, String certificate_no, String graduatedate, String teacherno, String name);//�޸ı�ҵѧ����Ϣ
	ResultSet gradeInfo_stu(String stuno);//ͨ��ѧ��ѧ�ź�������ѯ��ɼ�
	ResultSet gradeInfo_course(String courseno, String year, String term, String teacherno);//ͨ���γ���Ϣ��ѯ���γ̱�ѧ�걾ѧ��ĳλ��ʦ�Ŀγ̵�����ѧ���ɼ�
	//ResultSet gradeForStu(int gradelow);//��ѯ����ѧ��������ѧ���ĸ���ѧ��ͳ��
	ResultSet speciality_CourseInfo(String username, String year, String term, String coursetype); //רҵ���еĿγ�
	ResultSet importGrade(String username, String year, String term, String courseno, int classno);//����ĳ�γ���ĳѧ��ĳ�༶��ȫ��ѧ���ɼ��б�
	boolean addGrade(String year, String term, String courseno, int classno, String stuno, String stuname, int grade, String remark);//���ݵ�ǰ�γ���Ϣ�Լ�ѧ���ɼ���Ϣ�����ݿ����һ���ɼ���Ϣ
	boolean alterGrade(String year, String term, String courseno, int classno, String stuno, int grade);//ѡ��һ��ѧ���������޸���ѧ�š�����������
	boolean deleteGrade(String year, String term, String courseno, int classno, String stuno, int grade);//ɾ��һ��ѧ���ķ�����¼
	//Fileset importfromExcel();//��excel�������ݿ�
	//ResultSet coursesForDpt(int year, int term, String depart);//��ѯ����Ժϵ�Ŀγ��Լ�����
	ResultSet courseSearch(String username, String year, String term, String coursetype);//�ſβ�ѯ
	boolean courseAlter(String schoolyear, String schoolterm, String courseno, String classno, String coursename, String grade, String classhour, String coursetime, String classroom);//�޸�����γ�
	boolean courseDelete(String schoolyear, String schoolterm, String courseno, String classno);//ɾ������γ�
	ResultSet courseResult(String username, String year, String term);//��ѯѡ�ν��
	int profess(String username); //ͳ��רҵ����
	//ResultSet specialityDisplay(String username);//���Ժϵרҵ��Ϣ
	//ResultSet esnameAlter(String specialityno, String chiname, String ename);//�޸�רҵӢ������
	boolean passwordAlter(String username, String oldpassword, String newpassword);//�޸�����

}
