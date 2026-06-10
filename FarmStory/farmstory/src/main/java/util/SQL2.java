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
          + "(boardno, title, content, writer, regip) "
          + "VALUES (?, ?, ?, ?, ?)";

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


    // file
    public static final String INSERT_FILE =
            "INSERT INTO `file` SET "
            + "commno=?, "
            + "ofname=?, "
            + "sfname=?";

    public static final String SELECT_FILES =
            "SELECT * FROM `file` WHERE commno=?";

    public static final String SELECT_FILE =
            "SELECT * FROM `file` WHERE fileno=?";

    public static final String UPDATE_DOWNLOAD =
            "UPDATE `file` SET download = download + 1 WHERE fileno=?";

    public static final String DELETE_FILE =
            "DELETE FROM `file` WHERE fileno=?";
    
    
    public static final String UPDATE_MEMBER_ROLE =
            "UPDATE member SET memberrole = ? WHERE memberid = ?";
    
    public static final String INSERT_EVENT =
            "INSERT INTO event_calendar (title, startdate) VALUES (?, ?)";

    public static final String SELECT_EVENTS =
            "SELECT * FROM event_calendar ORDER BY startdate ASC, eventno ASC";
    
    
    public static final String DELETE_EVENT =
            "DELETE FROM event_calendar WHERE eventno = ?";
    
 // =========================
 // Community 게시판
 // =========================

 // 게시판별 글목록 조회
 public static final String SELECT_COMMUNITIES_BY_BOARD =
         "SELECT * FROM community WHERE boardno = ? ORDER BY commno DESC";

 // 게시판별 글목록 검색
 public static final String SELECT_COMMUNITIES_BY_BOARD_SEARCH =
         "SELECT * FROM community "
       + "WHERE boardno = ? "
       + "AND (title LIKE ? OR writer LIKE ?) "
       + "ORDER BY commno DESC";
    
    
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


    
}