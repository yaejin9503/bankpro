package global.sesoc.test11;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static String RSA_WEB_KEY = "_RSA_WEB_KEY_";
	private static String RSA_INSTANCE = "RSA";
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "index";
	}
	
	//회원가입 화면 이동
	@RequestMapping(value ="/insert" , method = RequestMethod.GET)
	public String goinsert(){
		return "insert"; 
	}
	
	//회원수정
	@RequestMapping(value ="/info" , method = RequestMethod.GET)
	public String goinfo(){
		return "info"; 
	}
	
	//아이디,비밀번호 찾기
	@RequestMapping(value ="/idpwfind" , method = RequestMethod.GET)
	public String idpwfind(){
		return "idpwfind"; 
	}
	
	//고객문의 게시판으로 넘어가기
	@RequestMapping(value ="/goboard" , method = RequestMethod.GET)
	public String goQboard(){
		return "qboardList"; 
	}
	
	//예금계좌 만들기 페이지로 넘어가기
	@RequestMapping(value ="/gomakeaccount" , method = RequestMethod.GET)
	public String gomakeaccount(){
		return "addaccount"; 
	}
	
	//q&a 게시판 글쓰기 이동
	@RequestMapping(value ="/gowriteboard" , method = RequestMethod.GET)
	public String gowriteBoard(Model model){
		Date today = new Date();
		model.addAttribute("today",today);
		return "qboardWrite"; 
	}
	
	//적금계좌 만들기 페이지로 넘어가기
		@RequestMapping(value ="/gomake2account" , method = RequestMethod.GET)
		public String gomake2account(){
			return "addaccount2"; 
	}
		
	//대출계좌 만들기 페이지로 넘어가기
	@RequestMapping(value ="/gomake3account" , method = RequestMethod.GET)
	public String gomake3account(){
		return "addaccount3"; 
	}
	
	//보유계좌페이지로 이동하기
	@RequestMapping(value ="/haveaccount" , method = RequestMethod.GET)
	public String gohaveaccount(){
		return "haveaccount"; 
	}
	
	//입금페이지로 이동하기 
	@RequestMapping(value ="/godeposit" , method = RequestMethod.GET)
	public String godeposit(String accountno,Model model){
		System.out.println(accountno);
		model.addAttribute("accountno",accountno);
		return "deposit"; 
	}
	
	//출금페이지로 이동하기
	@RequestMapping(value ="/gowithdraw" , method = RequestMethod.GET)
	public String gowithdraw(String accountno,Model model){
		model.addAttribute("accountno",accountno);
		return "withdraw"; 
	}
	
	//이체페이지로 이동하기
	@RequestMapping(value ="/gotransfer" , method = RequestMethod.GET)
	public String gotransfer(HttpServletRequest req,String accountno,Model model) throws NoSuchAlgorithmException, InvalidKeySpecException{
		initRSA(req);
		String RSAModulus = (String)req.getAttribute("RSAModulus");
		String RSAExponent = (String)req.getAttribute("RSAExponent");
		model.addAttribute("RSAModulus",RSAModulus);
		model.addAttribute("RSAExponent",RSAExponent);
		model.addAttribute("accountno",accountno);
		return "transfer"; 
	}
	
	//transfer_pop1 내 계좌 보는 창
	@RequestMapping(value ="/transfer_pop1" , method = RequestMethod.GET)
	public String transfer_pop1(String accountno,Model model){
		
		model.addAttribute("accountno",accountno);
		return "transfer_pop"; 
	}
	
	//transfer_pop1 내 계좌말고 다른 사람 계좌 보는 창 
	@RequestMapping(value ="/transferp" , method = RequestMethod.GET)
	public String transferp(String accountno,Model model){
		model.addAttribute("accountno",accountno);
		return "transfer_pop1"; 
	}
	
	//go_transfer_pop2
	@RequestMapping(value ="/transfer_pop2" , method = RequestMethod.GET)
	public String transfer_pop2(HttpServletRequest req,String accountno, String pop_account,Model model) throws NoSuchAlgorithmException, InvalidKeySpecException, InvalidKeyException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, UnsupportedEncodingException{
		
		HttpSession session = req.getSession();
		PrivateKey privatekey = (PrivateKey) session.getAttribute(HomeController.RSA_WEB_KEY);
		
		pop_account = decryptRsa(privatekey,pop_account);
		
		model.addAttribute("accountno",accountno);
		model.addAttribute("pop_account",pop_account);
		return "transfer_pop2"; 
	}
	
	//거래 내역 조회로 
	@RequestMapping(value ="/tradeList" , method = RequestMethod.GET)
	public String tradeList(String accountno,Model model){
		model.addAttribute("accountno",accountno);
		return "tradeList"; 
	}

	
	/*
	*	RSA 공개키, 개인키 생성
	*	@paran request */
	public void initRSA(HttpServletRequest req) throws NoSuchAlgorithmException,InvalidKeySpecException {
		HttpSession session = req.getSession();
		KeyPairGenerator generator;
		
		generator = KeyPairGenerator.getInstance(HomeController.RSA_INSTANCE);
		generator.initialize(1024);
		
		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance(HomeController.RSA_INSTANCE);
		PublicKey publickey = keyPair.getPublic();
		PrivateKey privatekey = keyPair.getPrivate();
		
		System.out.println("publickey :" + publickey);
		System.out.println("privatekey :" + privatekey);
		
		session.setAttribute(HomeController.RSA_WEB_KEY, privatekey);
		
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec)keyFactory.getKeySpec(publickey, RSAPublicKeySpec.class);
		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
		req.setAttribute("RSAModulus", publicKeyModulus);
		req.setAttribute("RSAExponent", publicKeyExponent);
		
	}
	/**
	 * 복호화
	 * @Param privateKey
	 * @Param securedValue
	 * @return String
	 * @throws NoSuchPaddingException 
	 * @throws NoSuchAlgorithmException 
	 * @throws InvalidKeyException 
	 * @throws BadPaddingException 
	 * @throws IllegalBlockSizeException 
	 * @throws UnsupportedEncodingException 
	 * */
	private String decryptRsa(PrivateKey privatekey,String securedValue) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException, UnsupportedEncodingException{
		Cipher cipher = Cipher.getInstance(HomeController.RSA_INSTANCE);
		if(privatekey==null){
			throw new RuntimeException("암호화 비밀키 정보가 없습니다.");
		}
		byte[] enceryteBytes = hextoByteArray(securedValue);
		cipher.init(Cipher.DECRYPT_MODE, privatekey);
		byte[] decrypteBytes =cipher.doFinal(enceryteBytes);
		String decrypedStr = new String(decrypteBytes,"UTF-8");
		return decrypedStr; 
	}
	
	public static byte[] hextoByteArray(String hex){
		if(hex==null || hex.length()%2!=0){
			return new byte[] {};
		}
		byte[] bytes = new byte[hex.length()/2];
		for (int i=0; i<hex.length();i +=2){
			byte value = (byte)Integer.parseInt(hex.substring(i,i+2),16);
			bytes[(int)Math.floor(i/2)] = value;
		}
		return bytes;
	}

}
