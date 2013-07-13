
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
			
			connection = DriverManager.getConnection("jdbc:mysql://localhost/pybdb?characterEncoding=utf-8", "peas", "pyb15");// 创建数据连接
			
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
					sql = "select id,name,role" +
						  " from UserInfo,TeacherInfo " +
						  "where UserInfo.id = TeacherInfo.teacherno and UserInfo.id = '" + username + "'"; 
				}
			}
			
			resultset = statement.executeQuery(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("login!");
		return resultset;
		//return null;
		
	}

	@Override
	public ResultSet getadmissiontime(String username) {
		// TODO Auto-generated method stub
		//connection = getConnection();
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			
			//学号，姓名，性别，专业代码，专业，出生年月，入学日期，导师，培养性质，攻读学位，学籍状态，国籍，身份证号，名族
			String sql = "select admissiontime" + 
						 " from StudentInfo" + 
						 " where StudentInfo.stuno = '" + username + "'";
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
	public ResultSet getBasicInfo(String username) {
		// TODO Auto-generated method stub
		//connection = getConnection();
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			
			//学号，姓名，性别，专业代码，专业，出生年月，入学日期，导师，培养性质，攻读学位，学籍状态，国籍，身份证号，名族
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
			
			//拼音姓名，家庭住址，家庭所在地车站名，家庭电话，手机号码，E-mail,邮编
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
			
			//拼音姓名，家庭住址，家庭所在地车站名，家庭电话，手机号码，E-mail,邮编
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
			
			//学号，姓名，性别，导师，毕业日期，证书编号
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
	
	public int isSelected(String stuno, String courseno, String schoolyear, String schoolterm)
	{
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			
			//学号，姓名，性别，导师，毕业日期，证书编号
			String sql = "select * " + 
						 "from CourseSelection " + 
						 "where stuno = '" + stuno + "' and courseno = '" + courseno + "' and schoolyear = '" + schoolyear + "' and schoolterm = '" + schoolterm + "'";
			resultset = statement.executeQuery(sql);
			
			if (resultset.next()) {
				return resultset.getInt("classno");
			}
			return 0;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("search failure!");
			return 0;
		}
		//return true;
	}

	
	@Override
	public ResultSet displayCourseInfo(String username, String classkind, String schoolyear, String schoolterm) {
		// TODO Auto-generated method stub
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			String speciality = null,grade = null;
			
			String sql = "select speciality,admissiontime " + 
						 "from StudentInfo,MajorInfo " + 
						 "where StudentInfo.specialityno = MajorInfo.specialityno and stuno = '" + username + "'";
			
			resultset = statement.executeQuery(sql);
			while(resultset.next()) {
				speciality = resultset.getString(1);
				grade = resultset.getString(2);
			}
			
			//课程号，课程名，学分，学时，类型，性质，专业，校区
			sql = "select distinct courseno,coursename,credit,classhour,coursetype,property,speciality,schoolarea " + 
				  "from CourseInfo " + 
				  "where speciality = '" + speciality + "' and coursetype = '" + classkind + "' and schoolyear = '" + schoolyear + "' and schoolterm = '" + schoolterm + "' and (grade = '" + grade + "' or grade = '-1')";
			resultset = statement.executeQuery(sql);
			
			
			/*try {
				while(resultset.next())
					System.out.println(resultset.getString(1) + resultset.getString(2) + resultset.getString(3) + resultset.getString(5));
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
	public ResultSet getChosenCourseInfo(String courseno, String schoolyear, String schoolterm) {
		// TODO Auto-generated method stub
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			
			//班级，上课地点，上课时间，教师，人数上限，已选人数
			String sql = "select classno,classroom,coursetime,TeacherInfo.name,maxelec,numofelec " + 
						 "from CourseInfo,TeacherInfo " + 
						 "where CourseInfo.teacherno = TeacherInfo.teacherno and courseno = '" + courseno + "' and schoolyear = '" + schoolyear + "' and schoolterm = '" + schoolterm + "' " +
						 "group by classno";
			resultset = statement.executeQuery(sql);
			
			/*try {
				while(resultset.next())
					System.out.println(resultset.getString(1) + resultset.getString(2) + resultset.getString(3) + resultset.getString(4));
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
	public ResultSet getMyCourseInfo(String stuno, String schoolyear, String schoolterm) {
		// TODO Auto-generated method stub
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			
			//班级，上课地点，上课时间，教师，人数上限，已选人数
			String sql = "select CourseInfo.courseno,coursename,schoolarea,TeacherInfo.name,coursetime,startweek,endweek,classroom,property,CourseInfo.classno " + 
						 "from CourseInfo,TeacherInfo,CourseSelection " + 
						 "where CourseSelection.schoolyear = '" + schoolyear + "' and CourseSelection.schoolterm = '" + schoolterm + "' " +
						 		"and CourseInfo.schoolyear = CourseSelection.schoolyear and CourseInfo.schoolterm = CourseSelection.schoolterm" +
						 		" and CourseInfo.classno = CourseSelection.classno and CourseInfo.courseno = CourseSelection.courseno and CourseSelection.stuno = '" + stuno + "' and CourseInfo.teacherno = TeacherInfo.teacherno ";
			resultset = statement.executeQuery(sql);
			
			/*try {
				while(resultset.next())
					System.out.println(resultset.getString(1) + resultset.getString(2) + resultset.getString(3) + resultset.getString(4));
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
	public boolean chooseCourse(String courseno, String stuno, String schoolyear, String schoolterm, int score, String remark, int classno) {
		// TODO Auto-generated method stub
		Statement statement;
		try {
			statement = connection.createStatement();
			String sql = "insert into CourseSelection (courseno, stuno, schoolyear, schoolterm, score, remark, classno)" +
					 	" values('" + courseno + "', '" + stuno + "', '" + schoolyear + "', '" + 
					 	schoolterm + "', '" + score + "', '" + remark + "', '" + classno + "')";
			statement.executeUpdate(sql);
			/*String sql_1 = "update CourseInfo" +
						" set numofelec = numofelec + 1" +
						" where courseno = '" + courseno + "' and schoolyear = '" + schoolyear + 
						 "' and schoolterm = '" + schoolterm + "' and classno = '" + classno + "'";
			statement.executeUpdate(sql_1);*/
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean withdrawCourse(String stuno, String courseno, String schoolyear, String schoolterm, int classno) {
		// TODO Auto-generated method stub
		try {
			Statement statement = connection.createStatement();
			
			String sql = "delete " +
						 "from CourseSelection " +
						 "where stuno = '" + stuno + "' and courseno = '" + courseno + "' and schoolyear = '" + schoolyear + "' and schoolterm = '" + schoolterm + "'";
			statement.executeUpdate(sql);
			
			/*sql = "update CourseInfo " + 
				  "set numofelec = numofelec - 1 " +
				  "where courseno = '" + courseno + "' and classno = '" + classno + "' and schoolyear = '" + schoolyear + "' and schoolterm = '" + schoolterm + "'"; 
			statement.executeUpdate(sql);*/
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("draw fail!");
			return false;
			//e.printStackTrace();
		}
		return true;
	}


	@Override
	public ResultSet getGradeInfo(String username, String schoolyear, String schoolterm) {
		// TODO Auto-generated method stub
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			
			//课程编号、课程内容、课程英文名、课程类型、学分、成绩
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
	public int creditStatistics(String username, String coursetype) {
		// TODO Auto-generated method stub
		ResultSet resultset = null;
		int credit = 0;
		try {
			Statement statement = connection.createStatement();
			
			String sql = "select distinct CourseInfo.courseno,CourseInfo.credit,score " + 
						 "from CourseInfo,CourseSelection " + 
						 "where CourseInfo.courseno = CourseSelection.courseno and CourseInfo.schoolyear = CourseSelection.schoolyear and CourseInfo.schoolterm = CourseSelection.schoolterm and " + 
						 "CourseSelection.stuno = '" + username + "' and CourseInfo.coursetype = '" + coursetype + "'";
			resultset = statement.executeQuery(sql);
			
			while (resultset.next()) {
				if (resultset.getInt(3) >= 60) {
					credit += resultset.getInt(2);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return credit;
	}



	@Override
	public ResultSet searchStudentno(String stuno, String username) {
		// TODO Auto-generated method stub
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			String specialityno = null;
			
			//课程编号、课程内容、课程英文名、课程类型、学分、成绩
			String sql = "select specialityno " +
						 "from AcdemicInfo " +
						 "where acdemicno = '" + username + "'"; 
			resultset = statement.executeQuery(sql);
			
			while(resultset.next())
			{
				specialityno = resultset.getString(1);
			}
			
			//学号，姓名，性别，专业，出生日期，入学时间，导师，培养性质，硕士/博士，学籍状态
			sql = "select stuno,stuname,StudentInfo.gender,MajorInfo.speciality,birthdate,admissiontime,TeacherInfo.name,culturednature,master_doctor,schoolrollstate " +
				  "from StudentInfo LEFT JOIN TeacherInfo ON StudentInfo.teacherno = TeacherInfo.teacherno LEFT JOIN MajorInfo ON StudentInfo.specialityno = MajorInfo.specialityno " +
				  "where stuno = '" + stuno + "' and StudentInfo.specialityno = '" + specialityno + "'";
			resultset = statement.executeQuery(sql);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultset;
		
	}

	@Override
	public ResultSet searchStudentname(String stuname, String username) {
		// TODO Auto-generated method stub
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			String specialityno = null;
			
			//课程编号、课程内容、课程英文名、课程类型、学分、成绩
			String sql = "select specialityno " +
						 "from AcdemicInfo " +
						 "where acdemicno = '" + username + "'"; 
			resultset = statement.executeQuery(sql);
			
			while(resultset.next())
			{
				specialityno = resultset.getString(1);
			}
			
			//学号，姓名，性别，专业，出生日期，入学时间，导师，培养性质，硕士/博士，学籍状态
			sql = "select stuno,stuname,StudentInfo.gender,MajorInfo.speciality,birthdate,admissiontime,TeacherInfo.name,culturednature,master_doctor,schoolrollstate " +
				  "from StudentInfo LEFT JOIN TeacherInfo ON StudentInfo.teacherno = TeacherInfo.teacherno LEFT JOIN MajorInfo ON StudentInfo.specialityno = MajorInfo.specialityno " +
				  "where stuname = '" + stuname + "' and StudentInfo.specialityno = '" + specialityno + "'";
			resultset = statement.executeQuery(sql);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultset;
	}

	@Override
	public ResultSet filterStudent(String nationality, String culturednature, String admissiontime, String gender, int schoolrollstate, String master_doctor, String teacherno, String username) {
		// TODO Auto-generated method stub
		Statement statement;
		ResultSet resultset = null;
		try {
			statement = connection.createStatement();
			
			String specialityno = null;
			
			//课程编号、课程内容、课程英文名、课程类型、学分、成绩
			String sql = "select specialityno " +
						 "from AcdemicInfo " +
						 "where acdemicno = '" + username + "'"; 
			resultset = statement.executeQuery(sql);
			
			while(resultset.next())
			{
				specialityno = resultset.getString(1);
			}
			sql = "select stuname, stuno, StudentInfo.gender, culturednature, birthdate, speciality, TeacherInfo.name, schoolrollstate " + 
			             "from StudentInfo LEFT JOIN TeacherInfo ON StudentInfo.teacherno = TeacherInfo.teacherno LEFT JOIN MajorInfo ON StudentInfo.specialityno = MajorInfo.specialityno " +
					     "where nationality = '" + nationality + "' and culturednature = '" + culturednature + "' and StudentInfo.specialityno = '" 
			             + specialityno + "' and admissiontime = '" + admissiontime + "' and StudentInfo.gender = '" + gender + "' and schoolrollstate = '" + 
			             schoolrollstate + "' and master_doctor = '" + master_doctor + "' and StudentInfo.teacherno = '" + teacherno + "'";
			resultset = statement.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultset;
	}

	@Override
	public ResultSet teacherManage(String username) {
		// TODO Auto-generated method stub
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			String specialityno = null;
			
			//课程编号、课程内容、课程英文名、课程类型、学分、成绩
			String sql = "select specialityno " +
						 "from AcdemicInfo " +
						 "where acdemicno = '" + username + "'"; 
			resultset = statement.executeQuery(sql);
			
			while(resultset.next())
			{
				specialityno = resultset.getString(1);
			}
			
			//导师序号，姓名，英文名，职称，备注
			sql = "select teacherno,name,ename,title,remark " +
				  "from TeacherInfo " +
				  "where specialityno = '" + specialityno + "'";
			resultset = statement.executeQuery(sql);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultset;
	}

	@Override
	public boolean teacherAdd(String username,String teacherno,String name,String ename,String gender,String title,String remark) {
		// TODO Auto-generated method stub
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			String specialityno = null;
			
			String sql = "select specialityno " +
						 "from AcdemicInfo " +
						 "where acdemicno = '" + username + "'"; 
			resultset = statement.executeQuery(sql);
			
			while(resultset.next()) {
				specialityno = resultset.getString(1);
			}
			
			sql = "insert " +
				  "into TeacherInfo (teacherno,name,ename,gender,specialityno,title,remark) " +
				  "values ('" + teacherno + "', '" + name + "', '" + ename + "', '" +  gender + "', '" + specialityno + "', '" + title + "', '" + remark + "')";
			statement.executeUpdate(sql);
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean teacherAlter(String teacherno,String ename,String title,String remark) {
		// TODO Auto-generated method stub
		//ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			
			String sql = "update TeacherInfo " +
					 	 "set ename = '" + ename + "',title = '" + title + "', remark = '" + remark + "' " +
					 	 "where teacherno = '" + teacherno + "'";
			statement.executeUpdate(sql);
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean teacherDelete(String teacherno) {
		// TODO Auto-generated method stub
		ResultSet resultset = null;
		try {
			Statement statement = connection.createStatement();
			
			String sql = "select * " +
						 "from StudentInfo " +
						 "where teacherno = '" + teacherno + "'";
			resultset = statement.executeQuery(sql);
			
			if (resultset.next())
			{
				//System.out.println("fail!");
				return false;
			}
			
			sql = "delete " +
				  "from TeacherInfo " +
				  "where teacherno = '" + teacherno + "'";
			statement.executeUpdate(sql);
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			return false;
		}
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
		//ResultSet r = t.getGradeInfo(id, "2012-2013", "2");
		ResultSet r = t.getMyCourseInfo(id, "2012-2013", "2");
		while(r.next())
			System.out.println(r.getString(1) + r.getString(2) + r.getString(3) + r.getString(4) + r.getString(5) + r.getString(6) + r.getString(7) + r.getString(8) + r.getString(9) + r.getString(10));
		System.out.println("test over");
		//t.login(id,pwd);
		
		
		
		//t.getChosenCourseInfo("220020", "2012-2013", "2");
		//ResultSet r = t.getBasicInfo(id);
		//ResultSet r = t.getNaturalInfo(id);
		//t.alterNaturalInfo(id,"houbojian","jiangsu","","","","",null);
		/*if (r==null) {
			System.out.println("null\n");
		}
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
