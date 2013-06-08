package peas;

import java.sql.*;


public interface LogicControl {
	/********************ѧ���ӽ�***********************/
	ResultSet login(String username, String password);//��½
	ResultSet getBasicInfo(String username);//��ȡѧ��������Ϣ
	ResultSet getNaturalInfo(String username);//��ȡѧ����Ȼ��Ϣ
	boolean alterNaturalInfo(String stuno, String pinyin, String familyaddr, String stationname, String homephone, String phonenum, String email, String zip);//�޸���Ȼ��Ϣ
	ResultSet getGraduateInfo(String username);//��ȡѧ����ҵ��Ϣ
	ResultSet displayCourseInfo(String username, String classkind);//��ʾѡ����Ϣ
	ResultSet getChosenCourseInfo(String courseno);//��ȡ��ǰѡ����Ϣ
	boolean chooseCourse (String courseno, String classno);//ѡ��
	boolean withdrawCourse (String courseno, String classno);//��ѡ
	ResultSet getGradeInfo(String username, String term);//�ɼ��鿴
	int creditStatistics(String username);//ͳ��ѧ��

	/*******************����Ա�ӽ�***********************/
	ResultSet searchStudentno(String stuno, String username);//ͨ��ѧ�Ų�ѯѧ����Ϣ��username��Ϊ��ȷ��Ժϵ��Ϣ
	ResultSet searchStudentname(String stuname, String username);//ͨ��������ѯѧ����Ϣ�����ܻ������������Է������飩
	ResultSet filterStudent(StudentInfo stuInfo, String username);//ͨ������ѧ����Ϣ��ɸѡѧ����Ϣ
	ResultSet [] teacherManage();//���뵼ʦ������棬�����ʦ��Ϣ
	ResultSet teacherAdd(TeacherInfo TeaInfo);//��ӵ�ʦ�����ز������
	ResultSet teacherAlter(TeacherInfo TeaInfo);//�޸ĵ�ʦ�����ز������
	boolean teacherDelete(String teacherno);//ɾ����ʦ�����ز������
	ResultSet teacherAndstudent(int year, String degree);//ʦ������
	ResultSet optionalteacher(String stuno);//���ؿ�ѡ��ʦ�����б�
	ResultSet beyondtimeManage(int year, String degree, String nationality);//���ڹ�������ѯ����
	ResultSet stu_detail(String detail);//�������ϸ��Ϣ������ѧ����Ϣҳ��
	//Fileset exporttoExcel(String export);//���������ΪExcel��������������Excel�ļ���
	ResultSet graduateMange(int year, String degree, String stustate);//��ҵ��Ϣ���������Ȳ���
	ResultSet graduateStu(String stuno);//��ѧ������ѧ����ҵ��Ϣ
	ResultSet altergraduateInfo(StudentInfo stuInfo);//�޸ı�ҵѧ����Ϣ
	ResultSet gradeInfo_stu(String stuno, String stuname);//ͨ��ѧ��ѧ�ź�������ѯ��ɼ�
	ResultSet gradeInfo_course(String courseno, int year, int term, String teacherno);//ͨ���γ���Ϣ��ѯ���γ̱�ѧ�걾ѧ��ĳλ��ʦ�Ŀγ̵�����ѧ���ɼ�
	ResultSet gradeForStu(int gradelow);//��ѯ����ѧ��������ѧ���ĸ���ѧ��ͳ��
	ResultSet importGrade(int year, int term, int courseno, int classno);//����ĳ�γ���ĳѧ��ĳ�༶��ȫ��ѧ���ɼ��б�
	ResultSet addGrade(int year, int term, int courseno, int classno, String stuno, String stuname, int grade);//���ݵ�ǰ�γ���Ϣ�Լ�ѧ���ɼ���Ϣ�����ݿ����һ���ɼ���Ϣ
	ResultSet alterGrade(int year, int term, int courseno, int classno, String stuno, String stuname, int grade);//ѡ��һ��ѧ���������޸���ѧ�š�����������
	ResultSet deleteGrade(int year, int term, int courseno, int classno, String stuno, String stuname, int grade);//ɾ��һ��ѧ���ķ�����¼
	//Fileset importfromExcel();//��excel�������ݿ�
	ResultSet coursesForDpt(int year, int term, String depart);//��ѯ����Ժϵ�Ŀγ��Լ�����
	ResultSet courseSearch(int year, int term, int week, int coursetype);//�ſβ�ѯ
	ResultSet courseAlter(int courseno, String coursetime, String courseAddr);//�޸�����γ�
	ResultSet courseDelete(int courseno, String coursetime, String courseAddr);//ɾ������γ�
	ResultSet courseResult(int year, int term);//��ѯѡ�ν��
	ResultSet specialityDisplay(String username);//���Ժϵרҵ��Ϣ
	ResultSet esnameAlter(String specialityno, String chiname, String ename);//�޸�רҵӢ������
	ResultSet passwordAlter(String name, String newpassword);//�޸�����

}
