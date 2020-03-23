package global.sesoc.test11.dao;


import java.util.List;

import global.sesoc.test11.vo.Account;
import global.sesoc.test11.vo.AccountLog;
import global.sesoc.test11.vo.Board;
import global.sesoc.test11.vo.Customer;

public interface BankMapper {

	public String selectId(String custid);
	public int insertcustomer(Customer customer);
	public Customer selectcustomer(Customer customer);
	public int updatecustomer(Customer customer);
	public String findid(Customer customer);
	public String findpw(Customer customer);
	public int writeboard(Board board);
	public List<Board>allBoard(); 
	public Board detailboard(int boarddno);
	public int delete(int boarddno);
	public int insertaccount(Account account);
	public int insertsavingaccount(Account account);
	public int insertloanaccount(Account account);
	public List<Account> showaccountList(String userid);
	public Account selectOneAccount(Account account);
	public int insertdeposit(Account account);
	public List<Account> selectmyaccount(String userid);
	public List<Account> selectyouraccount(String userid);
	public int transfer(Account account);
	public int insertaccountlog(AccountLog accountlog);
	public String selectaccount(String accountno);
}
