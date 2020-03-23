package global.sesoc.test11.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountLog {
	
	private int logid; 
	private String custid; 
	private String accounntno;
	private String transferno; 
	private String eventdate; 
	private String eventtype;
	private String eventrecord; 
	private int amount; 
	private int balance; 

}
