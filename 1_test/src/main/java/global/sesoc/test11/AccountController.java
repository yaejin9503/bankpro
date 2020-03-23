package global.sesoc.test11;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.test11.dao.BankRepository;
import global.sesoc.test11.vo.Account;
import global.sesoc.test11.vo.AccountLog;
import global.sesoc.test11.vo.Board;

@Controller
public class AccountController {
	
	@Autowired
	BankRepository repo; 

	//계좌 번호 생성
	@RequestMapping("/accountmake")
	@ResponseBody
	public String accountmake(){
		Random random = new Random();
		int result = 0; 
		int lastNumber = random.nextInt(100000);
		if(lastNumber>100000 || lastNumber<999999){
			result = lastNumber;
		}
		String result2=Integer.toString(result);
		String account = "1001002"+result2; 
		//System.out.println(account);
		
		return account; 
	}
	
	//적금 이율 랜덤하게 생성
		@RequestMapping("/interest")
		@ResponseBody
		public double interestmake(){
			double num = Math.random();	
			double interest = (num+2.0);
			double result = Math.round(interest*100)/100.0;
			return result; 
		}
	
	//insert 예금계좌 
	@RequestMapping(value ="/insertcheckaccount")
	@ResponseBody
	public String insertAccount(Account account,HttpSession session){
		String custid = (String)session.getAttribute("loginId");
		account.setCustid(custid);
		account.setAccounttype("checking");
		int result = repo.insertaccount(account);
		if(result==0){
			return "false"; 
		}
		return "success"; 
	}
	
	//insert 적금계좌
	@RequestMapping(value ="/insertsavingaccount")
	@ResponseBody
	public String insertAccount2(Account account,HttpSession session){
		
		String custid = (String)session.getAttribute("loginId");
		account.setCustid(custid);
		account.setAccounttype("saving");
		int result = repo.insertsavingaccount(account);
		if(result==0){
			return "false"; 
		}
		return "success"; 
	}
	
	//대출 이율 랜덤하게 생성
	@RequestMapping("/loaninterest")
	@ResponseBody
	public double loaninterestmake(){
		double num = Math.random();	
		double interest = (num+4.0);
		double result = Math.round(interest*100)/100.0;
		return result; 
	}
	
	//insert 대출계좌신청
	@RequestMapping(value ="/insertloanaccount")
	@ResponseBody
	public String insertAccount3(Account account,HttpSession session){
			
		String custid = (String)session.getAttribute("loginId");
		account.setCustid(custid);
		account.setAccounttype("loan");
		account.setApproval("N");
		int result = repo.insertloanaccount(account);
		
		
		if(result==0){
			return "false"; 
		}
		return "success"; 
	}
	
	//계좌 불러오기 
	@RequestMapping("/showaccount")
	@ResponseBody
	public List<Account> showaccountList(String userid,HttpSession session, Model model){
		userid = (String)session.getAttribute("loginId");
		List<Account> result = repo.showaccountList(userid);
		model.addAttribute("result",result); 
		/*for(Account a: result){
			if(a.getStartdeposit().equals(null) && a.getEnddeposit().equals(null)){
				a.setStartdeposit("");
				a.setEnddeposit("");
			}
		}*/
		return result; 
	}
	
	
	@RequestMapping("/plusdeposit")
	@ResponseBody
	public String plusdeposit(Account account, AccountLog accountlog, HttpSession session, Model model){
		 
		String userid = (String)session.getAttribute("loginId");
		account.setCustid(userid);
		Account oneAccount = repo.selectoneAcoount(account);
		accountlog.setAmount(account.getBalance());

		if(oneAccount.getAccounttype().equals("checking")){
			account.setBalance(account.getBalance()+oneAccount.getBalance());
			account.setPayment(0);
			accountlog.setBalance(account.getBalance());
	
		}else if(oneAccount.getAccounttype().equals("saving")){
			account.setPayment(account.getBalance()+oneAccount.getPayment());
			account.setBalance(0);
			accountlog.setBalance(account.getPayment());
		}
		
		accountlog.setCustid(userid);
		accountlog.setAccounntno(account.getAccountno());
		accountlog.setTransferno("");
		accountlog.setEventrecord("입금이다");
		accountlog.setEventtype("deposit");
		
		
		int logList = repo.insertaccountlog(accountlog); 
		if(logList==0){
			return "false"; 
		}
		int result = repo.insertdeposit(account);
		
		if(result==0){
			return "false" ;
		}
		return "success"; 
	}
	
	
	@RequestMapping("/minuswithdraw")
	@ResponseBody
	public String minuswithdraw(Account account,  AccountLog accountlog,HttpSession session, Model model){
		String userid = (String)session.getAttribute("loginId");
		account.setCustid(userid);
		Account oneAccount = repo.selectoneAcoount(account);
		
		if(oneAccount.getAccounttype().equals("saving")){
			return "false"; 
		}
		else if(oneAccount.getAccounttype().equals("checking")){
			if(account.getBalance()>oneAccount.getBalance()){
				return "moneyflow";
			}
			accountlog.setAmount(account.getBalance());
			account.setBalance(oneAccount.getBalance()-account.getBalance());
			account.setPayment(0);
			accountlog.setBalance(account.getBalance());
		}
		
		accountlog.setCustid(userid);
		accountlog.setAccounntno(account.getAccountno());
		accountlog.setTransferno("");
		accountlog.setEventrecord("출금이다");
		accountlog.setEventtype("withdraw");
		
		int logList = repo.insertaccountlog(accountlog); 
		if(logList==0){
			return "false"; 
		}
		
		int result = repo.insertdeposit(account); 
		if(result==0){
			return "false" ;
		}
		return "success"; 
	}
	
	
	@RequestMapping("/showmyaccount")
	@ResponseBody
	public List<Account> showmyaccount(Account account, HttpSession session, Model model){
		String userid = (String)session.getAttribute("loginId");
		account.setCustid(userid);
		List<Account> result = repo.selectmyaccount(userid);
		model.addAttribute("result",result); 
		return result; 
	}
	
	@RequestMapping("/showyouraccount")
	@ResponseBody
	public List<Account> showyouraccount(Account account, HttpSession session, Model model){
		String custid = (String)session.getAttribute("loginId");
		account.setCustid(custid);
		List<Account> result = repo.selectyouraccount(custid);
		model.addAttribute("result",result); 
		return result; 
	}
	
	
	
	@RequestMapping("/transferin")
	@ResponseBody
	public String transferin(Account account,AccountLog accountlog, HttpSession session, Model model){
		
		Account myAccount = repo.selectoneAcoount(account); // 내 계좌
		if(myAccount.getBalance()<account.getBalance()){
			return "overflow"; 
		}
		accountlog.setAmount(account.getBalance());
		myAccount.setBalance(myAccount.getBalance()-account.getBalance());
		accountlog.setBalance(account.getBalance());
		myAccount.setPayment(0);
		int result = repo.transfer(myAccount);
		
		if(result ==0){
			return "false"; 
		}
		//---------------------------------------------------출금 
		
		account.setAccountno(account.getTerm());
		accountlog.setTransferno(account.getTerm());
		Account yourAccount = repo.selectoneAcoount(account); //상대 계좌 
		yourAccount.setBalance(account.getBalance()+yourAccount.getBalance());
		yourAccount.setPayment(0);
		
		int result1 = repo.transfer(yourAccount);
		if(result1 ==0){
			return "false"; 
		}
		//----------------------------------------------------상대 계좌 입금		
		String userid = (String)session.getAttribute("loginId"); 
		accountlog.setCustid(userid);
		accountlog.setAccounntno(account.getAccountno());
		accountlog.setEventrecord("출금이다");
		accountlog.setEventtype("withdraw");
		
		int logList = repo.insertaccountlog(accountlog); 
		if(logList==0){
			return "false"; 
		}
		return "success"; 
	}
	@RequestMapping("/selectaccount")
	@ResponseBody
	public String selectaccount(String accountno, HttpSession session, Model model){
		String isitaccount = repo.selectaccount(accountno);
		if(isitaccount!=null){
			return "yes";  
		}else{
			return "no";
		} 
	}
}
