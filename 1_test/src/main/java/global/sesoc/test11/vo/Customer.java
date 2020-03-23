package global.sesoc.test11.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Customer {
	private String custid; 
	private String password;
	private String email;
	private String division;
	private String name;
	private String idno;
	private String address;
}
