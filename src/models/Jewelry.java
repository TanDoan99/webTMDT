package models;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Jewelry {
	private int id;
	private Category id_category;
	private String sizes;
	private String name;
	private String picture;
	private double price;
	private int sale;
	private String title;
	private int highlight;
	private int new_product;
	private String detail;
	private Timestamp created_at;
	private Timestamp updated_at;

	public Jewelry(Category id_category, String sizes, String name, String picture, double price, int sale,
			String title, int highlight, int new_product, String detail, Timestamp created_at, Timestamp updated_at) {
		super();
		this.id_category = id_category;
		this.sizes = sizes;
		this.name = name;
		this.picture = picture;
		this.price = price;
		this.sale = sale;
		this.title = title;
		this.highlight = highlight;
		this.new_product = new_product;
		this.detail = detail;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}
	

	public Jewelry(Category id_category, String name) {
		super();
		this.id_category = id_category;
		this.name = name;
	}
	public Jewelry(int id, String sizes, String name, String picture, double price, int sale, String title,
			int highlight, int new_product, String detail, Timestamp created_at, Timestamp updated_at) {
		super();
		this.id = id;
		this.sizes = sizes;
		this.name = name;
		this.picture = picture;
		this.price = price;
		this.sale = sale;
		this.title = title;
		this.highlight = highlight;
		this.new_product = new_product;
		this.detail = detail;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}


	public Jewelry(Category id_category, String sizes, String name, String picture, double price, int sale,
			String title, int highlight, int new_product, String detail) {
		super();
		this.id_category = id_category;
		this.sizes = sizes;
		this.name = name;
		this.picture = picture;
		this.price = price;
		this.sale = sale;
		this.title = title;
		this.highlight = highlight;
		this.new_product = new_product;
		this.detail = detail;
	}


	public Jewelry(int id, Category id_category, String sizes, String name, String picture, double price, int sale,
			String title, int highlight, int new_product, String detail) {
		super();
		this.id = id;
		this.id_category = id_category;
		this.sizes = sizes;
		this.name = name;
		this.picture = picture;
		this.price = price;
		this.sale = sale;
		this.title = title;
		this.highlight = highlight;
		this.new_product = new_product;
		this.detail = detail;
	}
	

}
