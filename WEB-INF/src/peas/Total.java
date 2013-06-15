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
		Connection connection = null;	//���������������ݿ��Connection����
		try {
			Class.forName("com.mysql.jdbc.Driver");// ����Mysql��������
			
			connection = DriverManager.getConnection("jdbc:mysql://114.212.135.113/pybdb", "admin", "pyb15");// ������������
			
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
				//System.out.println(resultset.getString(1));
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
			
			//ѧ�ţ��������Ա�רҵ���룬רҵ���������£���ѧ���ڣ���ʦ���������ʣ�����ѧλ��ѧ��״̬�����������֤�ţ�����
			String sql = "select stuno,stuname,StudentInfo.gender,StudentInfo.specialityno,speciality,birthdate,admissiontime,TeacherInfo.name,culturednature,master_doctor,schoolrollstate,nationality,personid,ethnicity" + 
						 " from StudentInfo LEFT JOIN TeacherInfo ON StudentInfo.teacherno = TeacherInfo.teacherno LEFT JOIN MajorInfo ON StudentInfo.specialityno = MajorInfo.specialityno " + 
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
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			
			//ƴ����������ͥסַ����ͥ���ڵس�վ������ͥ�绰���ֻ����룬E-mail,�ʱ�
			String sql = "select pinyin,familyaddr,stationname,homephone,phonenum,email,zip" + 
						 " from StudentInfo " + 
						 "where StudentInfo.stuno = '" + username + "'";
			resultset = statement.executeQuery(sql);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultset;
	}
	
	public boolean alterNaturalInfo(String stuno, String pinyin, String familyaddr, String stationname, String homephone, String phonenum, String email, String zip) {
		stuInfo = new StudentInfo(stuno,pinyin,familyaddr,stationname,homephone,phonenum,email,zip);
		//ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			
			//ƴ����������ͥסַ����ͥ���ڵس�վ������ͥ�绰���ֻ����룬E-mail,�ʱ�
			String sql = "update StudentInfo " +
						 "set pinyin = '" + stuInfo.getPinyin() + "',familyaddr = '" + stuInfo.getFamilyaddr() + "',stationname = '" + stuInfo.getStationname() + 
						 "',homephone = '" + stuInfo.getHomephone() + "',phonenum = '" + stuInfo.getPhonenum() + "',email = '" + stuInfo.getEmail() + "',zip = '" + stuInfo.getZip() + "' " +
						 "where stuno = '" + stuInfo.getStuno() + "'";
			statement.executeUpdate(sql);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("alter fail!");
			return false;
			//e.printStackTrace();
		}
		return true;
	}
	
	@Override
	public ResultSet getGraduateInfo(String username) {
		// TODO Auto-generated method stub
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			
			//ѧ�ţ��������Ա𣬵�ʦ����ҵ���ڣ�֤����
			String sql = "select stuno,stuname,StudentInfo.gender,TeacherInfo.name,graduatedate,certificate_no" + 
						 " from StudentInfo LEFT JOIN TeacherInfo ON StudentInfo.teacherno = TeacherInfo.teacherno " + 
						 "where StudentInfo.stuno = '" + username + "'";
			resultset = statement.executeQuery(sql);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultset;
	}

	@Override
	public ResultSet displayCourseInfo(String username, String classkind) {
		// TODO Auto-generated method stub
		
		
		return null;
	}

	@Override
	public ResultSet getChosenCourseInfo(String courseno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean chooseCourse(String courseno, String stuno, String schoolyear, String schoolterm, int score, String remark, int classno) {
		// TODO Auto-generated method stub
		Statement statement;
		try {
			statement = connection.createStatement();
			String sql = "insert into CourseSelection (courseno, stuno, schoolyear, schoolterm, score, remark, classno)" +
					 	" values('" + courseno + "', '" + stuno + "', '" + schoolyear + "', '" + 
					 	schoolterm + "', '" + score + "', '" + remark + "', '" + classno + "')";
			statement.executeUpdate(sql);
			String sql_1 = "update CourseInfo" +
						" set numofelec = numofelec + 1" +
						" where courseno = '" + courseno + "' and schoolyear = '" + schoolyear + 
						 "' and schoolterm = '" + schoolterm + "' and classno = '" + classno + "'";
			statement.executeUpdate(sql_1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean withdrawCourse(String courseno, String classno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ResultSet getGradeInfo(String username, String schoolyear, String schoolterm) {
		// TODO Auto-generated method stub
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			
			//�γ̱�š��γ����ݡ��γ�Ӣ�������γ����͡�ѧ�֡��ɼ�
			String sql = "select CourseInfo.courseno, CourseInfo.coursename, CourseInfo.ename, CourseInfo.coursetype, CourseInfo.credit, CourseSelection.score" +
						 " from CourseInfo, CourseSelection" +
						 " where CourseInfo.courseno = CourseSelection.courseno and CourseInfo.schoolyear = CourseSelection.schoolyear and CourseInfo.schoolterm = CourseSelection.schoolterm" +
						 " and CourseInfo.classno = CourseSelection.classno and CourseSelection.stuno = '" + username + "' and CourseSelection.schoolyear = '" + schoolyear + 
						 "' and CourseSelection.schoolterm = '" + schoolterm + "'";
			resultset = statement.executeQuery(sql);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultset;
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
	
	public static void main(String[] args) throws SQLException {

		Total t = new Total();
		String id = "101220036";
		String pwd = "101220036";
		t.login(id,pwd);
		//t.chooseCourse("220020", id, "2012-2013", "2", 93, "", 1);
		ResultSet r = t.getGradeInfo(id, "2012-2013", "2");
		while(r.next())
			System.out.println(r.getString(1) + r.getString(2) + r.getString(3) + r.getString(4) + r.getString(5) + r.getString(6));
		System.out.println("test over");
		//ResultSet r = t.getBasicInfo(id);
		//ResultSet r = t.getNaturalInfo(id);
		//t.alterNaturalInfo(id,"houbojian","jiangsu","","","","","210");
		/*if (r==null) {
			System.out.println("null\n");
		else
		{
			System.out.println("not null\n");
		}*/
			
		/*try {
			while(r.next())
				System.out.println(r.getString(1) + r.getString(2) + r.getString(3));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
	
}


