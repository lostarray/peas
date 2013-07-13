-- phpMyAdmin SQL Dump
-- version 4.0.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 07 月 13 日 14:11
-- 服务器版本: 5.5.31-MariaDB-log
-- PHP 版本: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `pybdb`
--

-- --------------------------------------------------------

--
-- 表的结构 `AcdemicInfo`
--

CREATE TABLE IF NOT EXISTS `AcdemicInfo` (
  `acdemicno` char(9) NOT NULL DEFAULT '',
  `acdemicname` varchar(20) DEFAULT NULL,
  `gender` char(2) DEFAULT NULL,
  `specialityno` char(5) NOT NULL,
  PRIMARY KEY (`acdemicno`),
  KEY `specialityno` (`specialityno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `AcdemicInfo`
--

INSERT INTO `AcdemicInfo` (`acdemicno`, `acdemicname`, `gender`, `specialityno`) VALUES
('122011', 'houbodashen', '女', '12201');

-- --------------------------------------------------------

--
-- 表的结构 `CourseInfo`
--

CREATE TABLE IF NOT EXISTS `CourseInfo` (
  `courseno` char(7) NOT NULL DEFAULT '',
  `coursename` varchar(40) DEFAULT NULL,
  `ename` varchar(100) DEFAULT NULL,
  `schoolyear` varchar(15) NOT NULL DEFAULT '',
  `schoolterm` varchar(2) NOT NULL DEFAULT '',
  `teacherno` char(9) DEFAULT NULL,
  `classroom` varchar(20) DEFAULT NULL,
  `selcourseremark` varchar(100) DEFAULT NULL,
  `coursetime` varchar(40) DEFAULT NULL,
  `classno` int(1) NOT NULL DEFAULT '0',
  `startweek` int(2) DEFAULT '1',
  `endweek` int(2) DEFAULT NULL,
  `numofelec` int(3) DEFAULT NULL,
  `maxelec` int(3) DEFAULT NULL,
  `weekno` int(2) DEFAULT NULL,
  `grade` char(4) DEFAULT NULL,
  `isodd` int(1) DEFAULT NULL,
  `speciality` varchar(20) DEFAULT NULL,
  `schoolarea` varchar(10) DEFAULT NULL,
  `coursetype` varchar(10) NOT NULL,
  `credit` int(1) NOT NULL,
  `classhour` int(2) DEFAULT NULL,
  `property` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`courseno`,`classno`,`schoolyear`,`schoolterm`),
  KEY `teacherno` (`teacherno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `CourseInfo`
--

INSERT INTO `CourseInfo` (`courseno`, `coursename`, `ename`, `schoolyear`, `schoolterm`, `teacherno`, `classroom`, `selcourseremark`, `coursetime`, `classno`, `startweek`, `endweek`, `numofelec`, `maxelec`, `weekno`, `grade`, `isodd`, `speciality`, `schoolarea`, `coursetype`, `credit`, `classhour`, `property`) VALUES
('220020', '离散数学', 'Discrete Mathematics', '2012-2013', '2', '122012', '仙II-103', NULL, '周五第1-2节', 1, 1, 17, 67, 80, NULL, '-1', 0, '计算机科学与技术', '仙林校区', '专业课', 4, 4, '平台'),
('220020', '离散数学', 'Discrete Mathematics', '2012-2013', '2', '122013', '仙II-104', NULL, '周四第1-2节', 2, 1, 17, 67, 80, NULL, '2010', 0, '计算机科学与技术', '仙林校区', '专业课', 4, 4, '平台'),
('221020', '数据结构', 'Data Structures', '2011-2012', '2', '122013', '逸B-206', NULL, '周三第3-4节，周五第3-4节', 1, 1, 17, 60, 180, NULL, '2010', 0, '计算机科学与技术', '仙林校区', '专业课', 4, 4, '核心'),
('221230', '数据挖掘导论', 'Introduction to Data Mining', '2012-2013', '2', '122011', '逸B-101', NULL, '周三第3-4节', 1, 1, 17, 158, 180, NULL, '2010', 0, '计算机科学与技术', '仙林校区', '专业课', 2, 2, '选修'),
('370080', '音乐艺术与审美', 'Music Art and Aesthetic', '2012-2013', '2', '137011', '仙II-306', NULL, '周三7-8节', 1, 2, 17, 180, 185, NULL, '2010', 0, '计算机科学与技术', '仙林校区', '通识课', 2, 2, '选修');

-- --------------------------------------------------------

--
-- 表的结构 `CourseSelection`
--

CREATE TABLE IF NOT EXISTS `CourseSelection` (
  `stuno` char(9) NOT NULL DEFAULT '',
  `courseno` char(7) NOT NULL DEFAULT '',
  `classno` int(1) NOT NULL DEFAULT '0',
  `schoolyear` varchar(15) NOT NULL,
  `schoolterm` varchar(2) NOT NULL,
  `score` int(3) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stuno`,`courseno`,`classno`,`schoolyear`,`schoolterm`),
  KEY `courseno` (`courseno`,`classno`,`schoolyear`,`schoolterm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `CourseSelection`
--

INSERT INTO `CourseSelection` (`stuno`, `courseno`, `classno`, `schoolyear`, `schoolterm`, `score`, `remark`) VALUES
('101220013', '220020', 2, '2012-2013', '2', 0, ''),
('101220036', '220020', 2, '2012-2013', '2', 0, ''),
('101220036', '221020', 1, '2011-2012', '2', 90, ''),
('101220036', '221230', 1, '2012-2013', '2', 0, ''),
('101220042', '220020', 1, '2012-2013', '2', 96, ''),
('101220042', '221230', 1, '2012-2013', '2', 92, '');

--
-- 触发器 `CourseSelection`
--
DROP TRIGGER IF EXISTS `DelCourseSelection`;
DELIMITER //
CREATE TRIGGER `DelCourseSelection` BEFORE DELETE ON `CourseSelection`
 FOR EACH ROW BEGIN
	UPDATE CourseInfo SET numofelec = numofelec - 1 WHERE (courseno = OLD.courseno AND classno = OLD.classno AND schoolyear = OLD.schoolyear AND schoolterm = OLD.schoolterm);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `UpdateCourseSelection`;
DELIMITER //
CREATE TRIGGER `UpdateCourseSelection` BEFORE INSERT ON `CourseSelection`
 FOR EACH ROW BEGIN
	UPDATE CourseInfo SET numofelec = numofelec + 1 WHERE (courseno = NEW.courseno AND classno = NEW.classno AND schoolyear = NEW.schoolyear AND schoolterm = NEW.schoolterm);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `MajorInfo`
--

CREATE TABLE IF NOT EXISTS `MajorInfo` (
  `specialityno` char(5) NOT NULL,
  `speciality` varchar(30) NOT NULL,
  `departmentno` int(3) NOT NULL,
  `department` varchar(30) NOT NULL,
  PRIMARY KEY (`specialityno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `MajorInfo`
--

INSERT INTO `MajorInfo` (`specialityno`, `speciality`, `departmentno`, `department`) VALUES
('12201', '数据挖掘', 122, '计算机科学与技术'),
('12202', '计算机科学与技术', 122, '计算机科学与技术'),
('12203', '软件工程', 122, '计算机科学与技术'),
('12204', '分布式计算', 122, '计算机科学与技术'),
('12301', '量子力学', 123, '物理学院'),
('12302', '应用物理', 123, '物理学院'),
('12303', '天体物理', 123, '物理学院'),
('12401', '经济学', 124, '商学院'),
('12402', '金融学', 124, '商学院'),
('12403', '会计', 124, '商学院'),
('12404', '财务管理', 124, '商学院'),
('12405', '保险学', 124, '商学院'),
('13701', '艺术系', 137, '艺术学院');

-- --------------------------------------------------------

--
-- 表的结构 `StudentInfo`
--

CREATE TABLE IF NOT EXISTS `StudentInfo` (
  `stuno` char(9) NOT NULL DEFAULT '',
  `stuname` varchar(20) NOT NULL,
  `pinyin` varchar(30) DEFAULT NULL,
  `gender` char(2) DEFAULT NULL,
  `specialityno` char(5) NOT NULL,
  `admissiontime` varchar(5) DEFAULT NULL,
  `birthdate` varchar(10) DEFAULT NULL,
  `teacherno` char(9) DEFAULT NULL,
  `culturednature` varchar(20) NOT NULL,
  `master_doctor` char(20) NOT NULL,
  `schoolrollstate` int(1) NOT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `familyaddr` varchar(80) DEFAULT NULL,
  `zip` varchar(6) DEFAULT NULL,
  `stationname` varchar(80) DEFAULT NULL,
  `homephone` varchar(12) DEFAULT NULL,
  `phonenum` varchar(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `ethnicity` varchar(10) DEFAULT NULL,
  `personid` varchar(20) NOT NULL,
  `graduatedate` varchar(5) DEFAULT NULL,
  `certificate_no` char(15) DEFAULT NULL,
  PRIMARY KEY (`stuno`),
  KEY `specialityno` (`specialityno`),
  KEY `teacherno` (`teacherno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `StudentInfo`
--

INSERT INTO `StudentInfo` (`stuno`, `stuname`, `pinyin`, `gender`, `specialityno`, `admissiontime`, `birthdate`, `teacherno`, `culturednature`, `master_doctor`, `schoolrollstate`, `nationality`, `familyaddr`, `zip`, `stationname`, `homephone`, `phonenum`, `email`, `ethnicity`, `personid`, `graduatedate`, `certificate_no`) VALUES
('101220001', '李政委', 'lizhengwei', '男', '12203', '2010', NULL, '122014', '非定向', 'master', 1, '中国大陆', NULL, NULL, NULL, NULL, NULL, NULL, '汉', '111111111111111177', NULL, NULL),
('101220002', '鲍煜坚', 'baoyujian', '男', '12201', '2010', NULL, '122013', '非定向', 'master', 1, '中国大陆', NULL, NULL, NULL, NULL, NULL, NULL, '汉', '111111111111111111', NULL, NULL),
('101220013', '陈欣', 'chenxin', '男', '12202', '2010', NULL, '122012', '非定向', 'master', 1, '中国大陆', '江苏省徐州市', '', '', '', '', '', '汉', '111111111111111122', NULL, NULL),
('101220036', '侯博建', 'houbojian', '男', '12202', '2010', NULL, '122012', '非定向', 'master', 1, '中国大陆', '', '223900', '', '1232938', '159962656', '761131656@qq.com', '汉', '111111111111111133', NULL, NULL),
('101220042', '黄真川', 'huangzhenchuan', '男', '12202', '2010', NULL, '122012', '非定向', 'master', 1, '中国大陆', '', '', '', '', '12345678910', 'hzhchuan@gmail.com', '汉', '111111111111111144', NULL, NULL),
('101220088', '苗园', 'miaoyuan', '女', '12201', '2010', NULL, '122011', '非定向', 'master', 1, '中国大陆', NULL, NULL, NULL, NULL, NULL, NULL, '汉', '111111111111111188', NULL, NULL),
('101220123', '吴勇', 'wuyong', '男', '12203', '2010', NULL, '122014', '非定向', 'master', 1, '中国大陆', NULL, NULL, NULL, NULL, NULL, NULL, '汉', '111111111111111155', NULL, NULL),
('101220151', '元玉慧', 'yuanyuhui', '男', '12203', '2010', NULL, '122014', '非定向', 'master', 1, '中国大陆', NULL, NULL, NULL, NULL, NULL, NULL, '汉', '111111111111111166', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `TeacherInfo`
--

CREATE TABLE IF NOT EXISTS `TeacherInfo` (
  `teacherno` char(9) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL,
  `ename` varchar(20) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `specialityno` char(5) NOT NULL,
  `title` varchar(10) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`teacherno`),
  KEY `specialityno` (`specialityno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `TeacherInfo`
--

INSERT INTO `TeacherInfo` (`teacherno`, `name`, `ename`, `gender`, `specialityno`, `title`, `remark`) VALUES
('122011', '周志华', 'ZhouZhihua', '男', '12201', '博导', NULL),
('122012', '陶先平', 'TaoXianping', '男', '12202', '教授', NULL),
('122013', '商琳', 'ShangLin', '女', '12201', '副教授', NULL),
('122014', '王林章', 'WangLinzhang', '男', '12203', '副教授', NULL),
('137011', '张静波', 'ZhangJingbo', '女', '13701', '教授', NULL),
('admin', 'admin', 'root', '男', '12201', '博导', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `UserInfo`
--

CREATE TABLE IF NOT EXISTS `UserInfo` (
  `id` char(9) NOT NULL DEFAULT '',
  `password` varchar(15) NOT NULL DEFAULT '123456',
  `role` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `UserInfo`
--

INSERT INTO `UserInfo` (`id`, `password`, `role`) VALUES
('101220001', '123456', 2),
('101220002', '123456', 2),
('101220013', '123456', 2),
('101220036', '123456', 2),
('101220042', '123456', 2),
('101220088', '123456', 2),
('101220123', '123456', 2),
('101220151', '123456', 2),
('122011', '123456', 1),
('122012', '123456', 1),
('122013', '123456', 1),
('122014', '123456', 1),
('admin', 'admin', 0);

--
-- 限制导出的表
--

--
-- 限制表 `AcdemicInfo`
--
ALTER TABLE `AcdemicInfo`
  ADD CONSTRAINT `AcdemicInfo_ibfk_1` FOREIGN KEY (`specialityno`) REFERENCES `MajorInfo` (`specialityno`),
  ADD CONSTRAINT `AcdemicInfo_ibfk_2` FOREIGN KEY (`acdemicno`) REFERENCES `UserInfo` (`id`);

--
-- 限制表 `CourseInfo`
--
ALTER TABLE `CourseInfo`
  ADD CONSTRAINT `CourseInfo_ibfk_1` FOREIGN KEY (`teacherno`) REFERENCES `TeacherInfo` (`teacherno`);

--
-- 限制表 `CourseSelection`
--
ALTER TABLE `CourseSelection`
  ADD CONSTRAINT `CourseSelection_ibfk_1` FOREIGN KEY (`stuno`) REFERENCES `StudentInfo` (`stuno`),
  ADD CONSTRAINT `CourseSelection_ibfk_2` FOREIGN KEY (`courseno`, `classno`, `schoolyear`, `schoolterm`) REFERENCES `CourseInfo` (`courseno`, `classno`, `schoolyear`, `schoolterm`);

--
-- 限制表 `StudentInfo`
--
ALTER TABLE `StudentInfo`
  ADD CONSTRAINT `StudentInfo_ibfk_1` FOREIGN KEY (`stuno`) REFERENCES `UserInfo` (`id`),
  ADD CONSTRAINT `StudentInfo_ibfk_2` FOREIGN KEY (`specialityno`) REFERENCES `MajorInfo` (`specialityno`),
  ADD CONSTRAINT `StudentInfo_ibfk_3` FOREIGN KEY (`teacherno`) REFERENCES `TeacherInfo` (`teacherno`);

--
-- 限制表 `TeacherInfo`
--
ALTER TABLE `TeacherInfo`
  ADD CONSTRAINT `TeacherInfo_ibfk_1` FOREIGN KEY (`specialityno`) REFERENCES `MajorInfo` (`specialityno`);