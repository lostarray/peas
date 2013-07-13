delimiter |
CREATE TRIGGER AddCourseSelection BEFORE INSERT ON CourseSelection FOR EACH ROW
BEGIN
	UPDATE CourseInfo SET numofelec = numofelec + 1 WHERE (courseno = NEW.courseno AND classno = NEW.classno AND schoolyear = NEW.schoolyear AND schoolterm = NEW.schoolterm);
END
|

CREATE TRIGGER DelCourseSelection BEFORE DELETE ON CourseSelection FOR EACH ROW
BEGIN
	UPDATE CourseInfo SET numofelec = numofelec - 1 WHERE (courseno = OLD.courseno AND classno = OLD.classno AND schoolyear = OLD.schoolyear AND schoolterm = OLD.schoolterm);
END
|
delimiter ;

