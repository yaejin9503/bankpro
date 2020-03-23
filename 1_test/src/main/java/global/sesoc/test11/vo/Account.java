package global.sesoc.test11.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Account {
	
	private String accountno;
	private String custid;
	private String accounttype;
	private int balance;
	private int payment;
	private double interest;
	private String startdeposit;
	private String enddeposit;
	private String term; //상대 계좌번호 잠시 저장
	private String approval; 
	
}
