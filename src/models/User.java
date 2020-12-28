package models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private int id;
	private String username;
	private String password;
	private String fullname;
	private String email;
	
	public User(int id, String password, String fullname) {
		super();
		this.id = id;
		this.password = password;
		this.fullname = fullname;
	}

	

	public User(int id, String password, String fullname, String email) {
		super();
		this.id = id;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
	}

	public User(String username, String password, String fullname, String email) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
	}
	
	
	
}
