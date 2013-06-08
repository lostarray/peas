package peas;

import java.sql.*;


public interface LogicControl {
	/********************学生视角***********************/
	ResultSet login(String username, String password);//登陆
	ResultSet getBasicInfo(String username);//获取学生基本信息
	ResultSet getNaturalInfo(String username);//获取学生自然信息
	boolean alterNaturalInfo(String stuno, String pinyin, String familyaddr, String stationname, String homephone, String phonenum, String email, String zip);//修改自然信息
	ResultSet getGraduateInfo(String username);//获取学生毕业信息
	ResultSet displayCourseInfo(String username, String classkind);//显示选课信息
	ResultSet getChosenCourseInfo(String courseno);//获取当前选课信息
	boolean chooseCourse (String courseno, String classno);//选课
	boolean withdrawCourse (String courseno, String classno);//退选
	ResultSet getGradeInfo(String username, String term);//成绩查看
	int creditStatistics(String username);//统计学分

	/*******************教务员视角***********************/
	ResultSet searchStudentno(String stuno, String username);//通过学号查询学生信息，username是为了确认院系信息
	ResultSet searchStudentname(String stuname, String username);//通过姓名查询学生信息（可能会有重名，所以返回数组）
	ResultSet filterStudent(StudentInfo stuInfo, String username);//通过输入学生信息来筛选学生信息
	ResultSet [] teacherManage();//进入导师管理界面，输出导师信息
	ResultSet teacherAdd(TeacherInfo TeaInfo);//添加导师，返回操作结果
	ResultSet teacherAlter(TeacherInfo TeaInfo);//修改导师，返回操作结果
	boolean teacherDelete(String teacherno);//删除导师，返回操作结果
	ResultSet teacherAndstudent(int year, String degree);//师生互联
	ResultSet optionalteacher(String stuno);//返回可选导师姓名列表
	ResultSet beyondtimeManage(int year, String degree, String nationality);//超期管理进入查询界面
	ResultSet stu_detail(String detail);//点击“详细信息”进入学生信息页面
	//Fileset exporttoExcel(String export);//点击“导出为Excel”，将结果输出到Excel文件中
	ResultSet graduateMange(int year, String degree, String stustate);//毕业信息管理，导出先不管
	ResultSet graduateStu(String stuno);//按学号搜索学生毕业信息
	ResultSet altergraduateInfo(StudentInfo stuInfo);//修改毕业学生信息
	ResultSet gradeInfo_stu(String stuno, String stuname);//通过学生学号和姓名查询其成绩
	ResultSet gradeInfo_course(String courseno, int year, int term, String teacherno);//通过课程信息查询本课程本学年本学期某位老师的课程的所有学生成绩
	ResultSet gradeForStu(int gradelow);//查询满足学分条件的学生的各类学分统计
	ResultSet importGrade(int year, int term, int courseno, int classno);//弹出某课程在某学期某班级的全体学生成绩列表
	ResultSet addGrade(int year, int term, int courseno, int classno, String stuno, String stuname, int grade);//根据当前课程信息以及学生成绩信息向数据库添加一条成绩信息
	ResultSet alterGrade(int year, int term, int courseno, int classno, String stuno, String stuname, int grade);//选择一名学生，可以修改其学号、姓名、分数
	ResultSet deleteGrade(int year, int term, int courseno, int classno, String stuno, String stuname, int grade);//删除一名学生的分数记录
	//Fileset importfromExcel();//将excel导入数据库
	ResultSet coursesForDpt(int year, int term, String depart);//查询所在院系的课程以及人数
	ResultSet courseSearch(int year, int term, int week, int coursetype);//排课查询
	ResultSet courseAlter(int courseno, String coursetime, String courseAddr);//修改所查课程
	ResultSet courseDelete(int courseno, String coursetime, String courseAddr);//删除所查课程
	ResultSet courseResult(int year, int term);//查询选课结果
	ResultSet specialityDisplay(String username);//输出院系专业信息
	ResultSet esnameAlter(String specialityno, String chiname, String ename);//修改专业英文名称
	ResultSet passwordAlter(String name, String newpassword);//修改密码

}
