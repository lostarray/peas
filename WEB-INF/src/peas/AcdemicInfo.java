package peas;

public class AcdemicInfo {
	private String acdemicno; 			//教务员号
	private String acdemicname;		 	//姓名	
	private String gender;				//性别
	private String specialityno;		//专业号
	
	public String getAcdemicno() {
		return acdemicno;
	}
	
	public String getAcdemicname() {
		return acdemicname;
	}
	
	public String getGender() {
		return gender;
	}
	
	public String getSpecialityno() {
		return specialityno;
	}
	
	public void setAcdemicno(String acdemicno) {
		this.acdemicno = acdemicno;
	}
	
	public void setAcdemicname(String acdemicname) {
		this.acdemicname = acdemicname;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public void setSpecialityno(String specialityno) {
		this.specialityno = specialityno;
	}
}
