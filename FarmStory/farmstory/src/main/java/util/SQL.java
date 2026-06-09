package util;

public class SQL {

	// ==========================================
	// Member (회원)
	// ==========================================
	public static final String INSERT_MEMBER = "INSERT INTO member SET " + "memberid=?," + "memberpass=SHA2(?, 256),"
			+ "membername=?," + "membernick=?," + "memberemail=?," + "memberhp=?," + "memberzip=?," + "memberaddr1=?,"
			+ "memberaddr2=?," + "regip=?," + "rdate=NOW()";

	public static final String SELECT_MEMBER_WITH_PASS = "SELECT * FROM member WHERE memberid=? AND memberpass=SHA2(?, 256)";
	public static final String WHERE_MEMBER = "SELECT COUNT(*) FROM member ";
	public static final String WHERE_MEMBERID = "WHERE memberid=?";
	public static final String WHERE_NICK = "WHERE membernick=?";
	public static final String WHERE_EMAIL = "WHERE memberemail=?";
	public static final String WHERE_HP = "WHERE hp=?";

	// ==========================================
	// Community (게시판 공통 - 농작물, 텃밭, 공지사항 등)
	// ==========================================
	public static final String INSERT_ARTICLE = "INSERT INTO community SET " + "boardno=?," + "title=?," + "content=?,"
			+ "filecheck=?," + "writer=?," + "regip=?," + "wdate=NOW()";

	// 특정 게시글 조회 (작성자 닉네임과 파일 정보 포함 조인)
	public static final String SELECT_ARTICLE = "SELECT " + "c.*, " + "m.membernick, " + "f.* " + "FROM community AS c "
			+ "LEFT JOIN file AS f ON c.commno = f.commno " + "JOIN member AS m ON c.writer = m.memberid "
			+ "WHERE c.commno=?";

	public static final String SELECT_MAX_COMMNO = "SELECT MAX(commno) FROM community";
	public static final String SELECT_COUNT_ARTICLE = "SELECT COUNT(*) FROM community";

	// 게시판별 목록 조회 (boardno 기준)
	public static final String SELECT_ALL_ARTICLE = "SELECT c.*, m.membernick FROM community AS c "
			+ "JOIN member AS m " + "ON c.writer = m.memberid " + "WHERE c.boardno=? " + "ORDER BY commno DESC "
			+ "LIMIT ?, 10";

	public static final String SELECT_COUNT_ARTICLE_BY_KEYWORD = "SELECT COUNT(*) FROM community AS c "
			+ "JOIN member AS m ON c.writer = m.memberid " + "WHERE c.boardno=? AND ";

	// 기본 SELECT 절 (항상 고정)
	public static final String SELECT_BASE = "SELECT c.*, m.membernick FROM community AS c "
			+ "JOIN member AS m ON c.writer = m.memberid ";

	// 필수 조건 (보드 번호는 항상 필요하므로)
	public static final String WHERE_BOARDNO = "WHERE c.boardno=? ";

	// 검색 추가 조각 (필요할 때만 이어 붙임)
	public static final String AND_TITLE = "AND title LIKE ? ";
	public static final String AND_CONTENT = "AND content LIKE ? ";
	public static final String AND_NICK = "AND membernick LIKE ? ";

	// 페이징 및 정렬
	public static final String ORDER_LIMIT = "ORDER BY commno DESC LIMIT ?, 10";

	public static final String UPDATE_ARTICLE = "UPDATE community SET title=?, content=? WHERE commno=?";
	public static final String UPDATE_ARTICLE_HIT = "UPDATE community SET hit = hit + 1 WHERE commno=?";
	public static final String DELETE_ARTICLE = "DELETE FROM community WHERE commno=?";

	// ==========================================
	// CommunityComment (게시판 댓글)
	// ==========================================
	public static final String INSERT_COMMENT = "INSERT INTO communitycomment SET " + "commno=?, " + "content=?, "
			+ "writer=?, " + "regip=?, " + "wdate=NOW()";

	public static final String SELECT_ALL_COMMENT = "SELECT * FROM communitycomment WHERE commno=?  ";
	public static final String UPDATE_COMMENT = "UPDATE communitycomment SET content=? WHERE commentno=?";
	public static final String DELETE_COMMENT = "DELETE FROM communitycomment WHERE commentno=?";

	// ==========================================
	// File (첨부파일)
	// ==========================================
	public static final String INSERT_FILE = "INSERT INTO file SET " + "commno=?," + "ofname=?," + "sfname=?,"
			+ "rdate=NOW()";
	public static final String SELECT_FILE = "SELECT * FROM file WHERE fileno=?";
	public static final String UPDATE_FILE_DOWNLOAD = "UPDATE file SET download = download + 1 WHERE fileno=?";
	public static final String DELETE_FILE = "DELETE FROM file WHERE fileno=?";

	// ==========================================
	// Product (장보기 상품)
	// ==========================================
	public static final String INSERT_PRODUCT = "INSERT INTO product SET " + "productcate=?," + "productname=?,"
			+ "productprice=?," + "productcontent=?," + "productimg=?," + "productstock=?," + "rdate=NOW()";

	public static final String SELECT_PRODUCT = "SELECT * FROM product WHERE productno=?";
	public static final String SELECT_ALL_PRODUCT = "SELECT * FROM product WHERE productcate=? ORDER BY productno DESC LIMIT ?, 10";
	public static final String SELECT_COUNT_PRODUCT = "SELECT COUNT(*) FROM product WHERE productcate=?";

	// ==========================================
	// Cart (장바구니)
	// ==========================================
	public static final String INSERT_CART = "INSERT INTO cart SET " + "memberid=?," + "productno=?," + "cartcount=?,"
			+ "rdate=NOW()";

	// 장바구니 목록 조회 시 상품 테이블(product)과 조인하여 상품명, 가격, 이미지 등을 함께 가져옵니다.
	public static final String SELECT_CARTS = "SELECT c.*, p.productname, p.productprice, p.productimg "
			+ "FROM cart AS c " + "JOIN product AS p ON c.productno = p.productno " + "WHERE c.memberid=? "
			+ "ORDER BY c.cartno DESC";

	public static final String DELETE_CART = "DELETE FROM cart WHERE cartno=?";

}