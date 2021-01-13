package models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetail {


	public OrderDetail(Order order, Jewelry product, int quantity) {
		super();
		this.order = order;
		Product = product;
		this.quantity = quantity;
	}
	
	public OrderDetail(Jewelry product, int quantity) {
		super();
		Product = product;
		this.quantity = quantity;
	}

	private int id;
	
	private Order order;
	
	private Jewelry Product;
	
	private int quantity;
	
	
	
}
