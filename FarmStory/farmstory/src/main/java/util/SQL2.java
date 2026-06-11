package util;

public class SQL2 {

    // member
    public static final String INSERT_MEMBER =
            "INSERT INTO member SET "
            + "memberid=?, "
            + "memberpass=SHA2(?, 256), "
            + "membername=?, "
            + "membernick=?, "
            + "memberemail=?, "
            + "memberhp=?, "
            + "memberzip=?, "
            + "memberaddr1=?, "
            + "memberaddr2=?, "
            + "regip=?";

    public static final String SELECT_MEMBER =
            "SELECT * FROM member "
            + "WHERE memberid=? "
            + "AND memberpass=SHA2(?, 256) "
            + "AND leavedate IS NULL";

    public static final String SELECT_COUNT_ID =
            "SELECT COUNT(*) FROM member WHERE memberid=?";

    public static final String SELECT_COUNT_NICK =
            "SELECT COUNT(*) FROM member WHERE membernick=?";

    public static final String SELECT_COUNT_EMAIL =
            "SELECT COUNT(*) FROM member WHERE memberemail=?";

    public static final String SELECT_COUNT_HP =
            "SELECT COUNT(*) FROM member WHERE memberhp=?";

    public static final String SELECT_ALL_MEMBERS =
            "SELECT * FROM member ORDER BY rdate DESC";

    public static final String UPDATE_MEMBER =
            "UPDATE member SET "
            + "memberpass=SHA2(?, 256), "
            + "membernick=?, "
            + "memberemail=?, "
            + "memberhp=?, "
            + "memberzip=?, "
            + "memberaddr1=?, "
            + "memberaddr2=? "
            + "WHERE memberid=?";

    public static final String DELETE_MEMBER =
            "UPDATE member SET leavedate=NOW() WHERE memberid=?";


    // product
    public static final String INSERT_PRODUCT =
            "INSERT INTO product "
          + "(productcate, productname, productprice, productdiscount, productpoint, productfinalprice, productcontent, productimg, productstock) "
          + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    public static final String SELECT_PRODUCT =
            "SELECT * FROM product WHERE productno=?";

    public static final String SELECT_PRODUCTS =
            "SELECT * FROM product ORDER BY productno DESC";

    public static final String SELECT_PRODUCTS_BY_CATE =
            "SELECT * FROM product WHERE productcate=? ORDER BY productno DESC";

    public static final String UPDATE_PRODUCT =
            "UPDATE product SET "
            + "productcate=?, "
            + "productname=?, "
            + "productprice=?, "
            + "productcontent=?, "
            + "productimg=?, "
            + "productstock=? "
            + "WHERE productno=?";

    public static final String DELETE_PRODUCT =
            "DELETE FROM product WHERE productno=?";


    // cart
 // MySQL
    public static final String INSERT_CART = "INSERT INTO cart (memberid, productno, cartcount, rdate) " +
                         "VALUES (?, ?, ?, NOW()) " +
                         "ON DUPLICATE KEY UPDATE cartcount = VALUES(cartcount), rdate = VALUES(rdate)";
    
    public static final String SELECT_CARTS =
            "SELECT "
            + "c.cartno, "
            + "c.memberid, "
            + "c.productno, "
            + "c.cartcount, "
            + "c.rdate, "
            + "p.productcate, "
            + "p.productname, "
            + "p.productprice, "
            + "p.productimg, "
            + "p.productstock "
            + "FROM cart AS c "
            + "JOIN product AS p ON c.productno = p.productno "
            + "WHERE c.memberid=? "
            + "ORDER BY c.cartno DESC";
    
    
    public static final String SELECT_CART_LIST =
    		"SELECT " +
    				"c.cartno, " +
    				"c.memberid, " +
    				"m.membername, " +
    				"c.productno, " +
    				"p.productname, " +
    				"p.productcate, " +
    				"p.productprice, " +
    				"c.cartcount, " +
    				"(p.productprice * c.cartcount) AS totalprice, " +
    				"c.rdate " +
    				"FROM cart AS c " +
    				"JOIN product AS p ON c.productno = p.productno " +
    				"JOIN member AS m ON c.memberid = m.memberid " +
    				"WHERE c.memberid = ? " +  // 추가!
    				"ORDER BY c.cartno DESC";

    public static final String UPDATE_CART_COUNT =
            "UPDATE cart SET cartcount=? WHERE cartno=?";

    public static final String DELETE_CART =
            "DELETE FROM cart WHERE cartno=?";


    // community
    public static final String INSERT_COMMUNITY =
            "INSERT INTO community "
          + "(boardno, boardpostno, title, content, writer, regip) "
          + "VALUES (?, ?, ?, ?, ?, ?)";
    
    public static final String SELECT_NEXT_BOARD_POST_NO =
            "SELECT IFNULL(MAX(boardpostno), 0) + 1 AS nextNo "
          + "FROM community "
          + "WHERE boardno = ?";
    
    

    public static final String SELECT_COMMUNITY =
            "SELECT c.*, m.membernick "
            + "FROM community AS c "
            + "JOIN member AS m ON c.writer = m.memberid "
            + "WHERE c.commno=?";

    public static final String SELECT_COMMUNITIES =
            "SELECT c.*, m.membernick "
            + "FROM community AS c "
            + "JOIN member AS m ON c.writer = m.memberid "
            + "WHERE c.boardno=? "
            + "ORDER BY c.commno DESC";

    public static final String SEARCH_COMMUNITIES =
            "SELECT c.*, m.membernick "
            + "FROM community AS c "
            + "JOIN member AS m ON c.writer = m.memberid "
            + "WHERE c.boardno=? "
            + "AND c.title LIKE ? "
            + "ORDER BY c.commno DESC";

    public static final String UPDATE_HIT =
            "UPDATE community SET hit = hit + 1 WHERE commno=?";

    public static final String UPDATE_COMMUNITY =
            "UPDATE community SET title=?, content=? WHERE commno=?";

    public static final String DELETE_COMMUNITY =
            "DELETE FROM community WHERE commno=?";


    // communitycomment
    public static final String INSERT_COMMENT =
            "INSERT INTO communitycomment SET "
            + "commno=?, "
            + "content=?, "
            + "writer=?, "
            + "regip=?";

    public static final String SELECT_COMMENTS =
            "SELECT cc.*, m.membernick "
            + "FROM communitycomment AS cc "
            + "JOIN member AS m ON cc.writer = m.memberid "
            + "WHERE cc.commno=? "
            + "ORDER BY cc.commentno ASC";

    public static final String UPDATE_COMMENT =
            "UPDATE communitycomment SET content=? WHERE commentno=?";

    public static final String DELETE_COMMENT =
            "DELETE FROM communitycomment WHERE commentno=?";

    public static final String UPDATE_COMMENT_COUNT_PLUS =
            "UPDATE community SET commentcount = commentcount + 1 WHERE commno=?";

    public static final String UPDATE_COMMENT_COUNT_MINUS =
            "UPDATE community SET commentcount = commentcount - 1 "
            + "WHERE commno=? AND commentcount > 0";


 // =========================
 // 첨부파일
 // =========================

 // 첨부파일 저장
 public static final String INSERT_FILE =
         "INSERT INTO `file` "
       + "(commno, ofname, sfname) "
       + "VALUES (?, ?, ?)";

 // 게시글 첨부파일 목록 조회
 public static final String SELECT_FILES_BY_COMMNO =
         "SELECT * FROM `file` WHERE commno = ? ORDER BY fileno ASC";

 // 첨부파일 1개 조회
 public static final String SELECT_FILE =
         "SELECT * FROM `file` WHERE fileno = ?";

 // 다운로드 수 증가
 public static final String UPDATE_FILE_DOWNLOAD =
         "UPDATE `file` SET download = download + 1 WHERE fileno = ?";

 // 첨부파일 삭제
 public static final String DELETE_FILE =
         "DELETE FROM `file` WHERE fileno = ?";

 // 게시글 첨부파일 개수 조회
 public static final String SELECT_FILE_COUNT_BY_COMMNO =
         "SELECT COUNT(*) AS cnt FROM `file` WHERE commno = ?";

 // 게시글 파일 여부 수정
 public static final String UPDATE_COMMUNITY_FILECHECK =
         "UPDATE community SET filecheck = ? WHERE commno = ?";
    
    
 // =========================
 // Community 게시판
 // =========================

//게시판별 글목록 조회 + 페이징
public static final String SELECT_COMMUNITIES_BY_BOARD =
      "SELECT * FROM community "
    + "WHERE boardno = ? "
    + "ORDER BY commno DESC "
    + "LIMIT ?, ?";

//게시판별 글목록 검색 + 페이징
public static final String SELECT_COMMUNITIES_BY_BOARD_SEARCH =
      "SELECT * FROM community "
    + "WHERE boardno = ? "
    + "AND (title LIKE ? OR writer LIKE ?) "
    + "ORDER BY commno DESC "
    + "LIMIT ?, ?";

//게시판별 전체 글 개수
public static final String SELECT_COMMUNITY_COUNT_BY_BOARD =
      "SELECT COUNT(*) AS cnt FROM community WHERE boardno = ?";

//게시판별 검색 글 개수
public static final String SELECT_COMMUNITY_COUNT_BY_BOARD_SEARCH =
      "SELECT COUNT(*) AS cnt FROM community "
    + "WHERE boardno = ? "
    + "AND (title LIKE ? OR writer LIKE ?)";
    
//=========================
//Community 글쓰기
//=========================
 
//게시글 1개 조회

//조회수 증가
public static final String UPDATE_COMMUNITY_HIT =
      "UPDATE community SET hit = hit + 1 WHERE commno = ?";




//=========================
//Community 글수정 / 글삭제
//=========================

//게시글 수정



//=========================
//Community 댓글
//=========================

//댓글 목록 조회
public static final String SELECT_COMMUNITY_COMMENTS =
"SELECT * FROM communitycomment WHERE commno = ? ORDER BY commentno ASC";


//댓글 작성
public static final String INSERT_COMMUNITY_COMMENT =
     "INSERT INTO communitycomment "
   + "(commno, content, writer, regip) "
   + "VALUES (?, ?, ?, ?)";

//댓글 삭제
public static final String DELETE_COMMUNITY_COMMENT =
     "DELETE FROM communitycomment WHERE commentno = ?";

//댓글 수 증가
public static final String UPDATE_COMMUNITY_COMMENT_COUNT_PLUS =
     "UPDATE community SET commentcount = commentcount + 1 WHERE commno = ?";

//댓글 수 감소
public static final String UPDATE_COMMUNITY_COMMENT_COUNT_MINUS =
     "UPDATE community "
   + "SET commentcount = CASE WHEN commentcount > 0 THEN commentcount - 1 ELSE 0 END "
   + "WHERE commno = ?";

//댓글 1개 조회
public static final String SELECT_COMMUNITY_COMMENT =
     "SELECT * FROM communitycomment WHERE commentno = ?";

//댓글 수정
public static final String UPDATE_COMMUNITY_COMMENT =
     "UPDATE communitycomment SET content = ? WHERE commentno = ?";

//=========================
//Event Calendar
//=========================

//이벤트 저장
public static final String INSERT_EVENT =
     "INSERT INTO event_calendar "
   + "(title, startdate) "
   + "VALUES (?, ?)";

//이벤트 목록 조회
public static final String SELECT_EVENTS =
     "SELECT * FROM event_calendar ORDER BY startdate ASC, eventno ASC";

//이벤트 삭제
public static final String DELETE_EVENT =
     "DELETE FROM event_calendar WHERE eventno = ?";



//=========================
//MyInfo 내가 쓴 글 / 댓글
//=========================

//내가 쓴 글 목록
public static final String SELECT_MY_ARTICLES =
     "SELECT * FROM community "
   + "WHERE writer = ? "
   + "ORDER BY commno DESC";

//내가 쓴 댓글 목록
public static final String SELECT_MY_COMMENTS =
     "SELECT c.*, cm.title, cm.boardno "
   + "FROM communitycomment c "
   + "JOIN community cm ON c.commno = cm.commno "
   + "WHERE c.writer = ? "
   + "ORDER BY c.commentno DESC";


//=========================
//MyInfo 회원정보 수정
//=========================

//비밀번호 포함 회원정보 수정
public static final String UPDATE_MEMBER_MYINFO_WITH_PASS =
     "UPDATE member SET "
   + "memberpass = SHA2(?, 256), "
   + "membernick = ?, "
   + "memberemail = ?, "
   + "memberhp = ?, "
   + "memberzip = ?, "
   + "memberaddr1 = ?, "
   + "memberaddr2 = ? "
   + "WHERE memberid = ?";


//비밀번호 제외 회원정보 수정
public static final String UPDATE_MEMBER_MYINFO_WITHOUT_PASS =
     "UPDATE member SET "
   + "membernick = ?, "
   + "memberemail = ?, "
   + "memberhp = ?, "
   + "memberzip = ?, "
   + "memberaddr1 = ?, "
   + "memberaddr2 = ? "
   + "WHERE memberid = ?";



//회원 1명 조회
public static final String SELECT_MEMBER_BY_ID =
     "SELECT * FROM member WHERE memberid = ?";


//=========================
//MyInfo 회원탈퇴
//=========================

//비밀번호 확인
public static final String CHECK_MEMBER_PASSWORD =
     "SELECT COUNT(*) AS cnt "
   + "FROM member "
   + "WHERE memberid = ? AND memberpass = SHA2(?, 256)";



//회원탈퇴 전 관련 데이터 삭제
public static final String DELETE_CART_BY_MEMBER =
     "DELETE FROM cart WHERE memberid = ?";

public static final String DELETE_COMMENTS_BY_MEMBER =
     "DELETE FROM communitycomment WHERE writer = ?";

public static final String DELETE_COMMUNITY_BY_MEMBER =
     "DELETE FROM community WHERE writer = ?";





    
}