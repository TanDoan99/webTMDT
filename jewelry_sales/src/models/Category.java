package models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Category {
	private int id;
	private String name;
	private String description; 
		public Category(String name) {
			super();
			this.name = name;
		}
		public Category(int id) {
			super();
			this.id = id;
		}
		public Category(int id, String name) {
			super();
			this.id = id;
			this.name = name;
		}
		public Category(String name, String description) {
			super();
			this.name = name;
			this.description = description;
		}
}
