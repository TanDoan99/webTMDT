package models;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private int id;
	private Jewelry product;
	private int number;
	private int id_user;
	private Timestamp date;
	public Cart(int id) {
		super();
		this.id = id;
	}
	public Cart(int id,Jewelry product, int number) {
		super();
		this.id = id;
		this.product = product;
		this.number=number;
	}
	public Cart(int id, Jewelry product) {
		super();
		this.id = id;
		this.product = product;
	}
	
	
}
