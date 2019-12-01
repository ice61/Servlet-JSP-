package cn.kexie.bean;

//此类为保单类，用于保单提交时

//包含保单号，投保人姓名，性别，生日，电话号码，保险种类，保金，被保人信息，员工工号，出单时间

public class Warranty {
	
	private String baodan;
	private String name;
	private String sex;
	private String birthday;
	private String phone;
	private String kind;
	private String money;
	private String clerk1;
	private String clerk2;
	private String id;
	private String time;
	
	public Warranty() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Warranty(String baodan, String name, String sex, String birthday,
			String phone, String kind, String money, String clerk1,
			String clerk2, String id, String time) {
		super();
		this.baodan = baodan;
		this.name = name;
		this.sex = sex;
		this.birthday = birthday;
		this.phone = phone;
		this.kind = kind;
		this.money = money;
		this.clerk1 = clerk1;
		this.clerk2 = clerk2;
		this.id = id;
		this.time = time;
	}
	@Override
	public String toString() {
		return "Warranty [baodan=" + baodan + ", name=" + name + ", sex=" + sex
				+ ", birthday=" + birthday + ", phone=" + phone + ", kind="
				+ kind + ", money=" + money + ", clerk1=" + clerk1
				+ ", clerk2=" + clerk2 + ", id=" + id + ", time=" + time + "]";
	}
	public String getBaodan() {
		return baodan;
	}
	public void setBaodan(String baodan) {
		this.baodan = baodan;
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
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getClerk1() {
		return clerk1;
	}
	public void setClerk1(String clerk1) {
		this.clerk1 = clerk1;
	}
	public String getClerk2() {
		return clerk2;
	}
	public void setClerk2(String clerk2) {
		this.clerk2 = clerk2;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
