package peas;

import java.sql.*;


public interface LogicControl {
	/********************学生视角***********************/
	ResultSet login(String username, String password);//登陆
	ResultSet getadmissiontime(String username);//获取入学时间
	ResultSet getBasicInfo(String username);//获取学生基本信息
	ResultSet getNaturalInfo(String username);//获取学生自然信息
	boolean alterNaturalInfo(String stuno, String pinyin, String familyaddr, String stationname, String homephone, String phonenum, String email, String zip);//修改自然信息
	ResultSet getGraduateInfo(String username);//获取学生毕业信息
	boolean chooseCourse (String courseno, String stuno, String schoolyear, String schoolterm, int grade, String remark, int classno);//选课
	int isSelected(String stuno, String cournseno, String schoolyear, String schoolterm); //判断选课的状态
	ResultSet displayCourseInfo(String username, String classkind, String schoolyear, String schoolterm);//显示选课信息
	ResultSet getChosenCourseInfo(String courseno, String schoolyear, String schoolterm);//获取当前选课深度信息
	public ResultSet getMyCourseInfo(String stuno, String schoolyear, String schoolterm);//获取
	boolean withdrawCourse (String stuno, String courseno, String schoolyear, String schoolterm, int classno);//退选
	ResultSet getGradeInfo(String username, String schoolyear, String schoolterm);//成绩查看
	int creditStatistics(String username, String coursetype);//统计学分

	/*******************教务员视角***********************/
	ResultSet searchStudentno(String stuno, String username);//通过学号查询学生信息，username是为了确认院系信息
	ResultSet searchStudentname(String stuname, String username);//通过姓名查询学生信息（可能会有重名，所以返回数组）
	ResultSet filterStudent(String nationality, String culturednature, String admissiontime, String gender, int schoolrollstate, String master_doctor, String teacherno, String username);//通过输入学生信息来筛选学生信息
	ResultSet findAllTeachers(String username);
	ResultSet teacherManage(String username);//进入导师管理界面，输出导师信息
	boolean teacherAdd(String username,String teacherno,String name,String ename,String gender,String title,String remark);//添加导师，返回操作结果
	boolean teacherAlter(String teacherno,String ename,String title,String remark);//修改导师，返回操作结果
	boolean teacherDelete(String teacherno);//删除导师，返回操作结果
	ResultSet teacherAndstudent(String username, String year, String degree);//师生互联
	boolean optionalteacher(String stuno, String teacherno);//返回可选导师姓名列表
	ResultSet beyondtimeManage(String year, String degree, String nationality, String currentYear, String username);//超期管理进入查询界面
	//ResultSet stu_detail(String detail);//点击“详细信息”进入学生信息页面
	//Fileset exporttoExcel(String export);//点击“导出为Excel”，将结果输出到Excel文件中
	ResultSet graduateMange(String username, String year, String degree, int stustate);//毕业信息管理，导出先不管
	ResultSet graduateStu(String username, String stuno);//按学号搜索学生毕业信息
	boolean altergraduateInfo(String stuno, String certificate_no, String graduatedate, String teacherno, String name);//修改毕业学生信息
	ResultSet gradeInfo_stu(String stuno);//通过学生学号和姓名查询其成绩
	ResultSet gradeInfo_course(String courseno, String year, String term, String teacherno);//通过课程信息查询本课程本学年本学期某位老师的课程的所有学生成绩
	//ResultSet gradeForStu(int gradelow);//查询满足学分条件的学生的各类学分统计
	ResultSet speciality_CourseInfo(String username, String year, String term, String coursetype); //专业所有的课程
	ResultSet importGrade(String username, String year, String term, String courseno, int classno);//弹出某课程在某学期某班级的全体学生成绩列表
	boolean addGrade(String year, String term, String courseno, int classno, String stuno, String stuname, int grade, String remark);//根据当前课程信息以及学生成绩信息向数据库添加一条成绩信息
	boolean alterGrade(String year, String term, String courseno, int classno, String stuno, int grade);//选择一名学生，可以修改其学号、姓名、分数
	boolean deleteGrade(String year, String term, String courseno, int classno, String stuno, int grade);//删除一名学生的分数记录
	//Fileset importfromExcel();//将excel导入数据库
	//ResultSet coursesForDpt(int year, int term, String depart);//查询所在院系的课程以及人数
	ResultSet courseSearch(String username, String year, String term, String coursetype);//排课查询
	ResultSet courseSelect(String schoolyear, String schoolterm, String courseno, String classno);//获取所要修改课程
	boolean courseAlter(String schoolyear, String schoolterm, String courseno, String classno, String coursename, String grade, String classhour, String coursetime, String classroom);//修改所查课程
	boolean courseDelete(String schoolyear, String schoolterm, String courseno, String classno);//删除所查课程
	ResultSet courseResult(String username, String year, String term);//查询选课结果
	int profess(String username); //统计专业人数
	//ResultSet specialityDisplay(String username);//输出院系专业信息
	//ResultSet esnameAlter(String specialityno, String chiname, String ename);//修改专业英文名称
	boolean passwordAlter(String username, String oldpassword, String newpassword);//修改密码

}
