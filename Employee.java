package movie.work.entity;

public class Employee {
	String fullname;
	String password;
	String email;

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Employee [fullname=" + fullname + ", password=" + password + ", email=" + email + "]";
	}

	public Employee(String fullname, String password, String email) {
		super();
		this.fullname = fullname;
		this.password = password;
		this.email = email;
	}

	public Employee() {
		super();
	}

}
