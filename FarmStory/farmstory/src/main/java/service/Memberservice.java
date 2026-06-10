package service;

import java.util.List;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import DAO.MemberDAO;
import DTO.MemberDTO;

public enum Memberservice {

	INSTANCE;
    

    private MemberDAO dao = MemberDAO.getInstance();

    private Memberservice() {}
    
	public void register(MemberDTO dto) {
		dao.insertMember(dto);
	}
	
	// 이메일 인증코드 전송
		public String sendEmailCode(String receiver) {
			
			// 인증코드 생성(6자리 랜덤 숫자)
			int code = ThreadLocalRandom.current().nextInt(100_000, 1_000_000);
			
			// 이메일 내용 정보
			String sender = "heocoding@gmail.com";
			String title = "farmstroy 인증코드 입니다.";
			String content = "<h1>인증코드는 " + code + " 입니다.</h1>";
			
			// Gmail SMTP 설정()
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			
			// Gmail SMTP 세션 생성
			Session sess = Session.getInstance(props, new Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication(){			
					final String APP_PASS = "gxxxabqbkpafulbs";			
					return new PasswordAuthentication(sender, APP_PASS);
				}
			});
			
			// 이메일 전송을 위한 마임메세지 작성
			Message message = new MimeMessage(sess);
			
			try {		
				message.setFrom(new InternetAddress(sender, "보내는사람", "UTF-8"));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
				message.setSubject(title);
				message.setContent(content, "text/html;charset=UTF-8");
				
				// 최종 전송
				Transport.send(message);
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
			return String.valueOf(code);
		}

    public MemberDTO login(String memberid, String memberpass) {
        return dao.selectMember(memberid, memberpass);
    }
    
	public int getCount(String type, String value) {
		return dao.selectCount(type, value);
	}
	
	public MemberDTO findById(String memeberid) {
		return dao.selectMember(memeberid);
	}
	public MemberDTO findById(String memeberid, String pass) {
		return dao.selectMember(memeberid, pass);
	}
	
	public List<MemberDTO> findAll() {
		return dao.selectAllMembers();
	}
	// 아이디 찾기 서비스
    public String selectMemberId(String name, String email) {
        return dao.selectMemberId(name, email);
    }

    // 비밀번호 찾기 1단계 서비스
    public int selectMemberForPass(String id, String email) {
        return dao.selectMemberForPass(id, email);
    }

    // 비밀번호 업데이트 서비스
    public int updatePass(String id, String pass) {
        return dao.updatePass(id, pass);
    }
	
	public void modify(MemberDTO dto) {
		dao.updateMember(dto);
	}
	
	public void remove(String memeberid) {
		dao.deleteMember(memeberid);
	}
	
	public void updateMemberRole(String memberid, String memberrole) {
	    dao.updateMemberRole(memberid, memberrole);
	}
	
	
}