-- 기존 테이블 삭제
-- 자식 테이블부터 안전하게 삭제 (초기화용)
DROP TABLE IF EXISTS `file`;
DROP TABLE IF EXISTS `communitycomment`;
DROP TABLE IF EXISTS `community`;
DROP TABLE IF EXISTS `cart`;
DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS `member`;

-- farmstory 데이터베이스 사용
USE `farmstory`;

-- 1. 외래키(FOREIGN KEY) 제약 조건 일시 중지 (연관된 테이블 무시하고 삭제하기 위함)
SET FOREIGN_KEY_CHECKS = 0;

-- 2. 모든 테이블 데이터 삭제 및 AUTO_INCREMENT (자동 증가 번호) 1로 초기화
TRUNCATE TABLE `file`;
TRUNCATE TABLE `communitycomment`;
TRUNCATE TABLE `community`;
TRUNCATE TABLE `cart`;
TRUNCATE TABLE `product`;
TRUNCATE TABLE `member`;

-- 3. 외래키 제약 조건 검사 다시 활성화 (필수)
SET FOREIGN_KEY_CHECKS = 1;

-- farmstory 데이터베이스가 없으면 새로 생성
CREATE DATABASE IF NOT EXISTS `farmstory`

-- 데이터베이스의 기본 문자셋을 utf8mb4로 설정
-- 한글, 영어, 숫자, 특수문자, 이모지 등을 안정적으로 저장하기 위한 설정
DEFAULT CHARACTER SET utf8mb4

-- 문자열 비교 및 정렬 기준 설정
-- general_ci에서 ci는 Case Insensitive의 약자로 대소문자를 구분하지 않음
COLLATE utf8mb4_general_ci;

-- farmstory 데이터베이스 사용
USE `farmstory`;

-- farmstory 데이터베이스 전용 계정 생성
CREATE USER IF NOT EXISTS 'project'@'localhost'
IDENTIFIED BY '1234';

-- farmstory DB 안에서만 모든 작업 가능하도록 권한 부여
GRANT ALL PRIVILEGES ON `farmstory`.* 
TO 'project'@'localhost';

-- 권한 적용
FLUSH PRIVILEGES;

-- 계정 권한 확인
SHOW GRANTS FOR 'project'@'localhost';

-- 1. 회원 및 관리자 테이블
CREATE TABLE `member` (
    `memberid` VARCHAR(20) PRIMARY KEY COMMENT '회원 아이디',
    `memberpass` VARCHAR(100) NOT NULL COMMENT '비밀번호',
    `membername` VARCHAR(20) NOT NULL COMMENT '이름',
    `membernick` VARCHAR(20) UNIQUE COMMENT '닉네임',
    `memberemail` VARCHAR(40) UNIQUE COMMENT '이메일',
    `memberhp` CHAR(13) UNIQUE COMMENT '휴대폰',
    `memberrole` VARCHAR(20) DEFAULT 'member' COMMENT '회원등급 admin/member',
    `memberzip` CHAR(5) COMMENT '우편번호',
    `memberaddr1` VARCHAR(100) COMMENT '기본주소',
    `memberaddr2` VARCHAR(100) COMMENT '상세주소',
    `regip` VARCHAR(100) COMMENT '회원 IP주소',
    `rdate` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '회원가입일',
    `leavedate` DATETIME COMMENT '회원탈퇴일'
) COMMENT='회원 및 관리자';

-- 2. 상품 테이블 (productcate 추가됨)
CREATE TABLE `product` (
    `productno` INT AUTO_INCREMENT PRIMARY KEY COMMENT '상품 번호',
    `productcate` VARCHAR(20) NOT NULL COMMENT '상품 종류 과일/야채/곡류',
    `productname` VARCHAR(100) NOT NULL COMMENT '상품명',
    `productprice` INT NOT NULL COMMENT '상품 가격',
    `productcontent` TEXT COMMENT '상품 설명',
    `productimg` VARCHAR(255) COMMENT '상품 이미지',
    `productstock` INT DEFAULT 0 COMMENT '재고 수량',
    `rdate` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '상품 등록일'
) COMMENT='상품';

-- 3. 장바구니 테이블
CREATE TABLE `cart` (
    `cartno` INT AUTO_INCREMENT PRIMARY KEY COMMENT '장바구니 번호',
    `memberid` VARCHAR(20) NOT NULL COMMENT '회원 아이디',
    `productno` INT NOT NULL COMMENT '상품 번호',
    `cartcount` INT DEFAULT 1 COMMENT '상품 수량',
    `rdate` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '장바구니 등록일',

    CONSTRAINT `fk_cart_member`
        FOREIGN KEY (`memberid`)
        REFERENCES `member` (`memberid`)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT `fk_cart_product`
        FOREIGN KEY (`productno`)
        REFERENCES `product` (`productno`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) COMMENT='장바구니';

-- 4. 커뮤니티 게시글 테이블 (boardno 추가됨)
CREATE TABLE `community` (
    `commno` INT AUTO_INCREMENT PRIMARY KEY COMMENT '게시글 번호',
    `boardno` INT NOT NULL COMMENT '게시판 번호 (예: 1=농작물, 2=귀농, 3=공지 등)',
    `title` VARCHAR(100) NOT NULL COMMENT '게시글 제목',
    `content` TEXT NOT NULL COMMENT '게시글 내용',
    `commentcount` INT DEFAULT 0 COMMENT '댓글 수',
    `filecheck` TINYINT DEFAULT 0 COMMENT '파일 첨부 여부',
    `hit` INT DEFAULT 0 COMMENT '조회수',
    `writer` VARCHAR(20) NOT NULL COMMENT '작성자 아이디',
    `regip` VARCHAR(100) NOT NULL COMMENT '작성자 IP주소',
    `wdate` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',

    CONSTRAINT `fk_community_member`
        FOREIGN KEY (`writer`)
        REFERENCES `member` (`memberid`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) COMMENT='커뮤니티 게시글';

-- 5. 커뮤니티 댓글 테이블
CREATE TABLE `communitycomment` (
    `commentno` INT AUTO_INCREMENT PRIMARY KEY COMMENT '댓글 번호',
    `commno` INT NOT NULL COMMENT '게시글 번호',
    `content` TEXT NOT NULL COMMENT '댓글 내용',
    `writer` VARCHAR(20) NOT NULL COMMENT '작성자 아이디',
    `regip` VARCHAR(100) NOT NULL COMMENT '작성자 IP주소',
    `wdate` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',

    CONSTRAINT `fk_comment_community`
        FOREIGN KEY (`commno`)
        REFERENCES `community` (`commno`)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT `fk_comment_member`
        FOREIGN KEY (`writer`)
        REFERENCES `member` (`memberid`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) COMMENT='커뮤니티 댓글';

-- 6. 첨부파일 테이블
CREATE TABLE `file` (
    `fileno` INT AUTO_INCREMENT PRIMARY KEY COMMENT '파일 번호',
    `commno` INT NOT NULL COMMENT '게시글 번호',
    `ofname` VARCHAR(100) NOT NULL COMMENT '원본 파일명',
    `sfname` VARCHAR(100) NOT NULL COMMENT '저장 파일명',
    `download` INT DEFAULT 0 COMMENT '다운로드 수',
    `rdate` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '파일 등록일',

    CONSTRAINT `fk_file_community`
        FOREIGN KEY (`commno`)
        REFERENCES `community` (`commno`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) COMMENT='첨부파일';

-- 1. 회원(member) 더미 데이터
INSERT INTO `member` (`memberid`, `memberpass`, `membername`, `membernick`, `memberemail`, `memberhp`, `memberrole`, `memberzip`, `memberaddr1`, `memberaddr2`, `regip`) VALUES
('admin', '1234', '관리자', '관리자', 'admin@farmstory.com', '010-1234-5678', 'admin', '12345', '서울시 강남구', '테헤란로 123', '127.0.0.1'),
('user01', '1234', '홍길동', '길동이', 'user01@farmstory.com', '010-1111-2222', 'member', '54321', '부산시 해운대구', '센텀중앙로 45', '192.168.0.10'),
('user02', '1234', '김농부', '농부왕', 'user02@farmstory.com', '010-3333-4444', 'member', '67890', '제주도 제주시', '해맞이해안로 78', '192.168.0.11');

-- 2. 상품(product) 더미 데이터 (productcate 추가됨)
INSERT INTO `product` (`productcate`, `productname`, `productprice`, `productcontent`, `productimg`, `productstock`) VALUES
('과일', '친환경 꿀사과 1kg', 15000, '달콤하고 아삭한 친환경 사과입니다.', '/images/apple.jpg', 100),
('야채', '유기농 상추 500g', 5000, '농약 없이 깨끗하게 기른 상추입니다.', '/images/lettuce.jpg', 50),
('곡류', '햅쌀 10kg', 35000, '올해 갓 수확한 맛있는 햅쌀입니다.', '/images/rice.jpg', 200);

-- 3. 장바구니(cart) 더미 데이터
INSERT INTO `cart` (`memberid`, `productno`, `cartcount`) VALUES
('user01', 1, 2),
('user01', 2, 1),
('user02', 3, 1);

-- 4. 커뮤니티 게시글(community) 더미 데이터 (boardno 추가됨)
-- 가정: boardno 1=농작물 이야기, 2=텃밭가꾸기, 3=귀농학교 
-- boardno 4=공지사항, 5=오늘의식단, 6=나도요리사, 7=1:1고객문의, 8=자주묻는질문

INSERT INTO `community` (`boardno`, `title`, `content`, `commentcount`, `filecheck`, `hit`, `writer`, `regip`) VALUES
-- 1. 농작물 이야기
(1, '올해 고구마 수확량이 엄청나네요!', '비가 적당히 와서 그런지 작년보다 씨알도 굵고 수확량도 크게 늘었습니다. 사진 첨부합니다.', 2, 1, 45, 'user02', '192.168.0.11'),
(1, '가을 무청 말리는 중입니다.', '시래기국 끓여 먹으려고 그늘에 잘 널어두었습니다. 벌써부터 구수한 냄새가 나는 것 같네요.', 0, 0, 12, 'user01', '192.168.0.10'),
-- 2. 텃밭 가꾸기
(2, '베란다에서 방울토마토 키우기 1주차', '화분에 씨앗 심고 싹이 트기를 기다리는 중입니다. 아파트에서도 잘 자라겠죠?', 1, 0, 22, 'user01', '192.168.0.10'),
-- 3. 귀농학교
(3, '귀농 3년차, 초보 농부의 현실적인 조언', '처음 귀농을 준비하시는 분들께 꼭 드리고 싶은 말씀은, 초기 자본을 너무 타이트하게 잡지 말라는 것입니다...', 5, 0, 150, 'user02', '192.168.0.11'),
-- 4. 공지사항 (주로 admin이 작성)
(4, '[필독] 팜스토리 이용 약관 및 개인정보 처리방침 개정 안내', '안녕하세요. 팜스토리 관리자입니다. 2023년 11월 1일부로 이용 약관이 일부 변경됩니다.', 0, 0, 210, 'admin', '127.0.0.1'),
(4, '가을맞이 농산물 특별 할인 이벤트 안내!', '이번 주말 동안 햅쌀과 제철 과일 20% 할인 이벤트를 진행합니다. 많은 관심 부탁드립니다.', 0, 1, 340, 'admin', '127.0.0.1'),
-- 5. 오늘의 식단
(5, '오늘 저녁은 직접 기른 상추로 삼겹살 파티!', '역시 파는 것보다 직접 키운 상추가 연하고 맛있네요. 다들 맛저하세요~', 3, 1, 55, 'user01', '192.168.0.10'),
-- 6. 나도 요리사
(6, '제철 감자로 만드는 초간단 바삭 감자전 레시피', '믹서기에 갈지 않고 채 썰어서 부치면 훨씬 바삭하고 식감이 좋습니다. 비 오는 날 강추합니다!', 1, 0, 88, 'user02', '192.168.0.11'),
-- 7. 1:1 고객문의
(7, '배송지가 잘못 입력되었는데 수정 가능한가요?', '어제 주문했는데 예전 집 주소로 들어갔어요. 아직 배송 전인데 주소 변경 부탁드립니다.', 0, 0, 2, 'user01', '192.168.0.10'),
-- 8. 자주 묻는 질문 (주로 admin이 작성)
(8, '주문 취소 및 환불은 어떻게 진행되나요?', '결제 완료 상태에서는 마이페이지에서 직접 취소 가능하며, 배송 준비 중 단계부터는 고객센터로 문의하셔야 합니다.', 0, 0, 500, 'admin', '127.0.0.1'),
(8, '회원 탈퇴는 어떻게 하나요?', '마이페이지 하단의 [회원 탈퇴] 버튼을 누르시면 즉시 처리되며, 개인정보는 안전하게 파기됩니다.', 0, 0, 420, 'admin', '127.0.0.1');

-- 5. 커뮤니티 댓글(communitycomment) 더미 데이터
INSERT INTO `communitycomment` (`commno`, `content`, `writer`, `regip`) VALUES
(1, '좋은 정보 감사합니다! 당장 적용해봐야겠네요.', 'user01', '192.168.0.10');

-- 6. 첨부파일(file)


-- 모든 IP('%')에서 접속 가능한 'project' 계정 생성
CREATE USER IF NOT EXISTS 'project'@'%' 
IDENTIFIED BY '1234';

-- farmstory DB에 대한 권한 부여
GRANT ALL PRIVILEGES ON `farmstory`.* TO 'project'@'%';

-- 권한 적용
FLUSH PRIVILEGES;

CREATE TABLE `event_calendar` (
  `eventno` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `startdate` date NOT NULL,
  `rdate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`eventno`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

ALTER TABLE community
ADD COLUMN boardpostno INT DEFAULT 0 COMMENT '게시판별 게시글 번호' AFTER boardno;

UPDATE community c
JOIN (
    SELECT 
        commno,
        ROW_NUMBER() OVER (
            PARTITION BY boardno 
            ORDER BY commno ASC
        ) AS rn
    FROM community
) x ON c.commno = x.commno
SET c.boardpostno = x.rn;

