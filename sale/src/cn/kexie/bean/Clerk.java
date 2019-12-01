package cn.kexie.bean;


//此类为员工类，用于员工注册时

//信息包括工号，姓名，性别，密码， 密保问题

public class Clerk {
	private String id;
	private String name;
	private String sex;
	private String password;
	private String question;
	public Clerk() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Clerk(String id, String name, String sex, String password,
			String question) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.password = password;
		this.question = question;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	@Override
	public String toString() {
		return "Clerk [id=" + id + ", name=" + name + ", sex=" + sex
				+ ", password=" + password + ", question=" + question + "]";
	}
	
	
	
}
