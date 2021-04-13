package models;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public User(int id, String username) {
		super();
		this.id = id;
		this.username = username;
		
	}
	
	
	public User(int id, String username, String fullname, String email, String address, String telephone_number, int createBy,
			Timestamp createDate) {
		super();
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.address = address;
		this.email = email;
		this.telephone_number = telephone_number;
		this.createBy = createBy;
		this.createDate = createDate;
	}
	

	


	public User(String username, String password, String fullname, String email, String address,
			String telephone_number) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
		this.address = address;
		this.telephone_number = telephone_number;
	}

	



	public User(int id, String password, String fullname, String email, String address, String telephone_number) {
		super();
		this.id = id;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
		this.address = address;
		this.telephone_number = telephone_number;
	}





	public User(int id, String username, String password, String fullname, String email, String address,
			String telephone_number) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
		this.address = address;
		this.telephone_number = telephone_number;
	}





	private int id;
	
	private String username;
	
	private String password;
	
	private String fullname;
	
	private String email;

	private String address;
	
	private String telephone_number;

	private int status;
	
	private int createBy;
	
	private int updateBy;
	
	private Timestamp createDate;
	
	private Timestamp updateDate;
}
