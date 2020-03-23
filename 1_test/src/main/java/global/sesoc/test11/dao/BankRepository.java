package global.sesoc.test11.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.test11.vo.Account;
import global.sesoc.test11.vo.AccountLog;
import global.sesoc.test11.vo.Board;
import global.sesoc.test11.vo.Customer;


@Repository
public class BankRepository {
	
	@Autowired
	SqlSession session;

	public String selectId(String custid) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		String result = mapper.selectId(custid); 
		return result;
	}

	public int insertcustomer(Customer customer) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		int result= mapper.insertcustomer(customer);
		return result;
	}

	public Customer selectcustomer(Customer customer) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		Customer result= mapper.selectcustomer(customer);
		return result;
	}
	
	public int updateCustomer(Customer customer) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		int result= mapper.updatecustomer(customer);
		return result;
	}
	
	public String findid(Customer customer){
		BankMapper mapper = session.getMapper(BankMapper.class);
		String result= mapper.findid(customer);
		return result;
	}
	
	public String findpw(Customer customer){
		BankMapper mapper = session.getMapper(BankMapper.class);
		String result= mapper.findpw(customer);
		return result;
	}

	public int writeBoard(Board board) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		int result= mapper.writeboard(board);
		return result;
	}
	
	public List<Board>allBoard(){
		BankMapper mapper = session.getMapper(BankMapper.class);
		List<Board> result= mapper.allBoard();
		return result;
	}
	
	public Board detailBoard(int boarddno){
		BankMapper mapper = session.getMapper(BankMapper.class);
		Board result= mapper.detailboard(boarddno);
		return result;
	}

	public int deleteBoard(int boarddno) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		int result= mapper.delete(boarddno);
		return result;
	}

	public int insertaccount(Account account) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		int result= mapper.insertaccount(account);
		return result;
	}

	public int insertsavingaccount(Account account) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		int result= mapper.insertsavingaccount(account);
		return result;
	}

	public int insertloanaccount(Account account) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		int result= mapper.insertloanaccount(account);
		return result;
	}

	public List<Account> showaccountList(String userid) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		List<Account> result= mapper.showaccountList(userid);
		return result;
	}

	public Account selectoneAcoount(Account account) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		Account result = mapper.selectOneAccount(account); 
		return result;
	}

	public int insertdeposit(Account account) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		int result = mapper.insertdeposit(account); 
		return result;
	}
	
	public List<Account> selectmyaccount(String userid) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		List<Account> result= mapper.selectmyaccount(userid);
		return result;
	}
	
	public List<Account> selectyouraccount(String userid) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		List<Account> result= mapper.selectyouraccount(userid);
		return result;
	}
	
	public int transfer(Account account){
		BankMapper mapper = session.getMapper(BankMapper.class);
		int result = mapper.transfer(account); 
		return result;
	}

	public int insertaccountlog(AccountLog accountlog) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		int result = mapper.insertaccountlog(accountlog); 
		return result;
	}

	public String selectaccount(String accountno) {
		BankMapper mapper = session.getMapper(BankMapper.class);
		String result = mapper.selectaccount(accountno); 
		return result;
	}
}
