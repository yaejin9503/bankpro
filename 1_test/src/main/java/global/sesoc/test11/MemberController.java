package global.sesoc.test11;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.test11.dao.BankRepository;
import global.sesoc.test11.util.FileService;
import global.sesoc.test11.vo.Board;
import global.sesoc.test11.vo.Customer;


@Controller
public class MemberController {


	@Autowired
	BankRepository repo; 

	final String uploadPath="/uploadfile";
	
	//아이디 중복체크
	@RequestMapping("/idcheck")
	@ResponseBody
	public String idCheck(String custid){
		String result = repo.selectId(custid);
		if(result!=null){
			return "fail";
		}
		return "success";
	}
	
	//회원가입 
	@RequestMapping(value ="/insertcustomer" , method = RequestMethod.POST)
	public String insertcustomer(Customer customer){
		int result = repo.insertcustomer(customer);
		if(result==0){
			return "insert";
		}
		return "index"; 
	}
	
	//login 하기
	@RequestMapping(value ="/logincustomer" , method = RequestMethod.POST)
	public String logincustomer(Customer customer, HttpSession session){
		Customer result = repo.selectcustomer(customer);
		if(result==null){
			return "index";
		}
		session.setAttribute("loginId", result.getCustid());
		return "addaccount"; 
	}
	
	//로그아웃
	@RequestMapping(value ="/logout" , method = RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		return "index"; 
	}
	
	//회원정보 수정하기 
	@RequestMapping(value ="/info" , method = RequestMethod.POST)
	public String updatecustomer(Customer customer,HttpSession session){
		String userid = (String)session.getAttribute("loginId");
		customer.setCustid(userid);
		int result = repo.updateCustomer(customer);
		if(result==0){
			return "info"; 
		}
		return "index"; 
	}
	
	//id찾기
	@RequestMapping("/idfind")
	@ResponseBody
	public String idfind(Customer customer){
		String result = repo.findid(customer);
		System.out.println(result);
		return result;
	}
	
	//비밀번호 찾기
	@RequestMapping("/pwfind")
	@ResponseBody
	public String pwfind(Customer customer){
		String result = repo.findpw(customer);
		System.out.println(result);
		return result;
	}
	
	//게시글 작성하기
	@RequestMapping(value ="/writeboard" , method = RequestMethod.POST)
	public String writeBoard(Board board,HttpSession session, MultipartFile upload){
		String userid = (String)session.getAttribute("loginId");
		board.setCustid(userid);
		
		System.out.println(upload.getOriginalFilename());
		
		String originalfile = upload.getOriginalFilename(); 
		String savedfile = FileService.saveFile(upload,uploadPath);
		
		board.setOriginalfile(originalfile);
		board.setSavedfile(savedfile);
		
		int result = repo.writeBoard(board);
		if(result==0){
			return "qboardWrite"; 
		}
		return "qboardList"; 
	}
	
	//Board 전체글 보기
	@RequestMapping("/listBoard")
	@ResponseBody
	public List<Board> selectBoard(){
		List<Board> result = repo.allBoard();
		return result;
	}
	
	//Q&A게시글 상세보기
	@RequestMapping(value ="/goboardDetail" , method = RequestMethod.GET)
	public String goboardDetail(Model model, int boarddno){
		Date today = new Date();
		Board board = repo.detailBoard(boarddno);
		model.addAttribute("today",today);
		model.addAttribute("board",board); 
		return "qboarddetail"; 
	}
	
	//파일 다운로드
	@RequestMapping(value ="/download", method=RequestMethod.GET)
	public String download(int boarddno,HttpServletResponse response){
		Board board = repo.detailBoard(boarddno); 
		String savedfile = board.getSavedfile();
		String originalfile = board.getOriginalfile();
		  
		response.setHeader("Content-Disposition", "attachment;filename="+ originalfile);
		   
		String fullPath = uploadPath + "/" + savedfile;
		   
		FileInputStream filein = null;
		ServletOutputStream  fileout = null; 
		   
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
			
		}catch (IOException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null; 
	}
	
	//게시글 삭제하기
	@RequestMapping(value ="/deleteboard" , method = RequestMethod.GET)
	public String deleteboard(Model model, int boarddno){
		int result = repo.deleteBoard(boarddno);
		if(result==0){
			return "qboarddetail";
		}
		return "qboardList"; 
	}
}
