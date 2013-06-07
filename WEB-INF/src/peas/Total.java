package peas;
import java.sql.*;



public class Total implements LogicControl {
	
	private static Connection connection;
	//private static Statement statement;
	private StudentInfo stuInfo;
	private GradeInfo graInfo;
	private TeacherInfo teaInfo;
	private CourseInfo couInfo;

	public Total() {
		
	}

	public StudentInfo getStuInfo() {
		return stuInfo;
	}

	public GradeInfo getGraInfo() {
		return graInfo;
	}

	public TeacherInfo getTeaInfo() {
		return teaInfo;
	}

	public CourseInfo getCouInfo() {
		return couInfo;
	}

	public void setStuInfo(StudentInfo stuInfo) {
		this.stuInfo = stuInfo;
	}

	public void setGraInfo(GradeInfo graInfo) {
		this.graInfo = graInfo;
	}

	public void setTeaInfo(TeacherInfo teaInfo) {
		this.teaInfo = teaInfo;
	}

	public void setCouInfo(CourseInfo couInfo) {
		this.couInfo = couInfo;
	}
	
	public Connection getConnection() {
		Connection connection = null;	//创建用于连接数据库的Connection对象
		try {
			Class.forName("com.mysql.jdbc.Driver");// 加载Mysql数据驱动
			
			connection = DriverManager.getConnection("jdbc:mysql://114.212.134.13/pybdb", "admin", "pyb15");// 创建数据连接
			
		} catch (Exception e) {
			System.out.println("Fail to connect the db!!" + e.getMessage());
		}
		return connection;
	}
	
	@Override
	public ResultSet login(String username, String password) {
		// TODO Auto-generated method stub
		
		connection = getConnection();
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			
			String sql = "select role from UserInfo where id = '" + username + "' and password = '" + password + "'";
			resultset = statement.executeQuery(sql);
			//connection.close();
			//while(resultset.next())
				
			while(resultset.next()) {
				System.out.println(resultset.getString(1));
				if (resultset.getInt(1)==2) {
					sql = "select id,stuname,role" +
						  " from UserInfo,StudentInfo " +
						  "where UserInfo.id = StudentInfo.stuno and UserInfo.id = '" + username + "'"; 
				}
				else {
					sql = "select id,tname,role" +
						  " from UserInfo,TeacherInfo " +
						  "where UserInfo.id = TeacherInfo.teacherno and UserInfo.id = '" + username + "'"; 
				}
			}
			
			resultset = statement.executeQuery(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultset;
		//return null;
		
	}

	@Override
	public ResultSet getBasicInfo(String username) {
		// TODO Auto-generated method stub
		//connection = getConnection();
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			//
			String sql = "select stuno,stuname,StudentInfo.gender,StudentInfo.majorno,mname,admissiontime,tname,culturednature,master_doctor,schoolrollstate,nationality,familyaddr,zip,homephone,telephone,email,personid,ethnicity" + 
						 " from StudentInfo LEFT JOIN TeacherInfo ON StudentInfo.teacherno = TeacherInfo.teacherno LEFT JOIN MajorInfo ON StudentInfo.majorno = MajorInfo.majorno " + 
						 "where StudentInfo.stuno = '" + username + "'";
			resultset = statement.executeQuery(sql);
			
			/*try {
				while(resultset.next())
					System.out.println(resultset.getString(1) + resultset.getString("mname") + resultset.getString("tname"));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultset;
	}

	@Override
	public ResultSet getNaturalInfo(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet getGraduateInfo(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet displayourseInfo(String username, String classkind) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet getChosenCourseInfo(String courseno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean chooseCourse(String courseno, String classno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean withdrawCourse(String courseno, String classno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ResultSet getGradeInfo(String username, String term) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int creditStatistics(String username) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ResultSet searchStudentno(String stuno, String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet searchStudentname(String stuname, String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet filterStudent(StudentInfo stuInfo, String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet[] teacherManage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet teacherAdd(TeacherInfo TeaInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet teacherAlter(TeacherInfo TeaInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean teacherDelete(String teacherno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ResultSet teacherAndstudent(int year, String degree) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet optionalteacher(String stuno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet beyondtimeManage(int year, String degree,
			String nationality) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet stu_detail(String detail) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet graduateMange(int year, String degree, String stustate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet graduateStu(String stuno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet altergraduateInfo(StudentInfo stuInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet gradeInfo_stu(String stuno, String stuname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet gradeInfo_course(String courseno, int year, int term,
			String teacherno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet gradeForStu(int gradelow) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet importGrade(int year, int term, int courseno, int classno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet addGrade(int year, int term, int courseno, int classno,
			String stuno, String stuname, int grade) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet alterGrade(int year, int term, int courseno, int classno,
			String stuno, String stuname, int grade) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet deleteGrade(int year, int term, int courseno, int classno,
			String stuno, String stuname, int grade) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet coursesForDpt(int year, int term, String depart) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet courseSearch(int year, int term, int week, int coursetype) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet courseAlter(int courseno, String coursetime,
			String courseAddr) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet courseDelete(int courseno, String coursetime,
			String courseAddr) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet courseResult(int year, int term) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet specialityDisplay(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet esnameAlter(String specialityno, String chiname,
			String ename) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet passwordAlter(String name, String newpassword) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public static void main(String[] args) {

		Total t = new Total();
		String id = "101220036";
		String pwd = "101220036";
		ResultSet r = t.login(id,pwd);
		t.getBasicInfo(id);
		if (r==null) {
			System.out.println("null\n");
		}
		else
		{
			System.out.println("not null\n");
		}
			
		try {
			while(r.next())
				System.out.println(r.getString(1) + r.getString(2) + r.getString(3));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
