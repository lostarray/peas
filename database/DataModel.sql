create table if not exists MajorInfo
(	specialityno char(5) not null,
	speciality varchar(30) not null,
	departmentno int(3) not null,
	department varchar(30) not null,
	primary key(specialityno)
);

create table if not exists UserInfo
(	id char(9),/*需要登录界面处以正则表达式约束！*/
	password varchar(15) not null default '123456',
	role int(1) not null,
	primary key(id),
	/*0代表管理员，1代表教务员，2代表学生*/
	check (role = '0' or role = '1' or role = '2')
);

create table if not exists TeacherInfo
( 	teacherno char(9),
	name varchar(20) not null,
	ename varchar(20),
	gender varchar(2),
	specialityno char(5) not null,
	title varchar(10),
	remark varchar(100),
	primary key(teacherno),
	foreign key (specialityno) references MajorInfo(specialityno),
	check (gender = '男' or gender = '女'),
	check (title in ('讲师' , '副教授' , '教授' , '博导'))
);

create table if not exists StudentInfo
(	stuno char(9),/*这个如何建立约束？考虑到可能是inser语句插入，也可能是导入表。*/
	stuname varchar(20) not null,
	pinyin varchar(30),
	gender	char(2),
	specialityno char(5) not null,
	admissiontime varchar(5),
	birthdate varchar(10),
	teacherno char(9),
	culturednature varchar(20) not null,
	master_doctor char(20) not null,
	schoolrollstate int(1) not null,
	nationality varchar(30),
	familyaddr varchar(80),
	zip varchar(6),
	stationname varchar(80),
	homephone varchar(12),
	phonenum varchar(11),
	email varchar(30),
	ethnicity varchar(10),
	personid  varchar(20) not null,
	graduatedate varchar(5), /*default CURRENT_TIMESTAMP,*/
	certificate_no char(15),
	primary key(stuno),
	foreign key (stuno) references UserInfo(id),
	/*can't add this FK-------don't know why*/
	foreign key (specialityno) references MajorInfo(specialityno),
	foreign key (teacherno) references TeacherInfo(teacherno),
	check (gender = '男' or gender = '女'),
	check (culturednature = '定向' or culturednature = '非定向'),
	check (master_doctor = 'master' or master_doctor = 'doctor'),
	check (schoolrollstate = '0' or schoolrollstate = '1')
);



/*
	为了简化，删去了一些属性。
*/
create table if not exists CourseInfo
(	courseno	char(7),
	coursename	varchar(40),
	ename	varchar(100),
	schoolyear varchar(15),
	schoolterm varchar(2),
	teacherno char(9),
	classroom varchar(20), 
	selcourseremark varchar(100),
	coursetime varchar(40),
	classno int(1),
	startweek int(2) default '1',
	endweek int(2),
	numofelec int(3),
	maxelec	int(3),
	weekno int(2),
	grade char(4),
	isodd int(1),
	speciality varchar(20),
	schoolarea varchar(10),
	coursetype varchar(10) not null,
	credit int(1) not null,
	classhour int(2),
	property varchar(10),
	primary key(courseno, classno, schoolyear, schoolterm),
	foreign key (teacherno) references TeacherInfo(teacherno),
	check (coursetype in ('专业课', '公选课', '通识课'))
);

create table if not exists CourseSelection
(	
	stuno char(9),
	courseno	char(7),
	classno int(1),
	schoolyear varchar(15) not null,
	schoolterm varchar(2) not null,
	score int(3),
	remark varchar(100),
	primary key(stuno, courseno, classno, schoolyear, schoolterm),
	foreign key (stuno) references StudentInfo(stuno),
	foreign key (courseno, classno, schoolyear, schoolterm) references CourseInfo(courseno, classno, schoolyear, schoolterm),
	check (schoolterm = '1' or schoolterm = '2'),
	check (score >= 0 && score <= 100)
);


/*
	插入数据
*/


