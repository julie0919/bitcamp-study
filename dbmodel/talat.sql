-- 라이더
DROP TABLE IF EXISTS talat_rider RESTRICT;

-- 드라이버
DROP TABLE IF EXISTS talat_driver RESTRICT;

-- 관리자
DROP TABLE IF EXISTS talat_admin RESTRICT;

-- 지원메시지
DROP TABLE IF EXISTS talat_qna RESTRICT;

-- 회원
DROP TABLE IF EXISTS talat_memb RESTRICT;

-- 여정
DROP TABLE IF EXISTS talat_journey RESTRICT;

-- 리뷰
DROP TABLE IF EXISTS talat_review RESTRICT;

-- 회원가입 기본정보
DROP TABLE IF EXISTS talat_join RESTRICT;

-- 라이더 고객지원
DROP TABLE IF EXISTS talat_rider_cs RESTRICT;

-- 드라이버 고객지원
DROP TABLE IF EXISTS talat_driver_cs RESTRICT;

-- 라이더 여정 등록
DROP TABLE IF EXISTS talat_journey_rider RESTRICT;

-- 드라이버 여정 등록
DROP TABLE IF EXISTS talat_journey_driver RESTRICT;

-- 드라이버 승인
DROP TABLE IF EXISTS talat_apvl RESTRICT;

-- 라이더
CREATE TABLE talat_rider (
  mno       INTEGER      NOT NULL COMMENT '라이더번호', -- 라이더번호
  pymt_type INTEGER      NOT NULL COMMENT '결제수단', -- 결제수단
  card_no   VARCHAR(20)  NULL     COMMENT '카드번호', -- 카드번호
  card_cvc  INTEGER      NULL     COMMENT 'CVV/CVC', -- CVV/CVC
  exp_date  DATE         NULL     COMMENT '만료기간', -- 만료기간
  card_pwd  VARCHAR(100) NULL     COMMENT '비밀번호' -- 비밀번호
)
COMMENT '라이더';

-- 라이더
ALTER TABLE talat_rider
  ADD CONSTRAINT PK_talat_rider -- 라이더 기본키
    PRIMARY KEY (
      mno -- 라이더번호
    );

-- 라이더
ALTER TABLE talat_rider
  ADD CONSTRAINT CK_talat_rider -- 라이더 체크 제약
    CHECK (pymt_type = 1 or pymt_type = 2 or pymt_type = 3);

-- 드라이버
CREATE TABLE talat_driver (
  mno        INTEGER      NOT NULL COMMENT '드라이버번호', -- 드라이버번호
  lic_no     VARCHAR(20)  NOT NULL COMMENT '면허번호', -- 면허번호
  lic_type   INTEGER      NOT NULL COMMENT '면허종류', -- 면허종류
  lic_renew  DATE         NOT NULL DEFAULT curdate() COMMENT '면허갱신예정일', -- 면허갱신예정일
  lic_verf   INTEGER      NOT NULL COMMENT '면허인증번호', -- 면허인증번호
  cno        VARCHAR(10)  NOT NULL COMMENT '차량번호', -- 차량번호
  cname      VARCHAR(50)  NOT NULL COMMENT '차량모델명', -- 차량모델명
  ccolor     VARCHAR(100) NOT NULL COMMENT '차량색상', -- 차량색상
  cyear      YEAR         NOT NULL COMMENT '차량연식', -- 차량연식
  cowner     VARCHAR(50)  NOT NULL COMMENT '차량명의', -- 차량명의
  inc_type   INTEGER      NOT NULL COMMENT '지급받을 방법', -- 지급받을 방법
  bank       VARCHAR(50)  NULL     COMMENT '은행', -- 은행
  acct_no    VARCHAR(20)  NULL     COMMENT '계좌번호', -- 계좌번호
  acct_name  VARCHAR(50)  NULL     COMMENT '예금주', -- 예금주
  lic_photo  VARCHAR(255) NOT NULL COMMENT '운전면허증 사진', -- 운전면허증 사진
  ins_photo  VARCHAR(255) NOT NULL COMMENT '보험증 사진', -- 보험증 사진
  cphoto     VARCHAR(255) NOT NULL COMMENT '차량 측면 사진', -- 차량 측면 사진
  corp_photo VARCHAR(255) NOT NULL COMMENT '회사 인증 사진' -- 회사 인증 사진
)
COMMENT '드라이버';

-- 드라이버
ALTER TABLE talat_driver
  ADD CONSTRAINT PK_talat_driver -- 드라이버 기본키
    PRIMARY KEY (
      mno -- 드라이버번호
    );

-- 드라이버
ALTER TABLE talat_driver
  ADD CONSTRAINT CK_talat_driver -- 드라이버 체크 제약
    CHECK (lic_type = 1 or lic_type = 2);

-- 드라이버
ALTER TABLE talat_driver
  ADD CONSTRAINT CK_talat_driver2 -- 드라이버 체크 제약2
    CHECK (inc_type = 1 or inc_type = 2 or inc_type =3);

-- 드라이버 유니크 인덱스
CREATE UNIQUE INDEX UIX_talat_driver
  ON talat_driver ( -- 드라이버
    lic_no ASC -- 면허번호
  );

-- 드라이버 유니크 인덱스2
CREATE UNIQUE INDEX UIX_talat_driver2
  ON talat_driver ( -- 드라이버
    cno ASC -- 차량번호
  );

-- 관리자
CREATE TABLE talat_admin (
  mno INTEGER NOT NULL COMMENT '관리자번호' -- 관리자번호
)
COMMENT '관리자';

-- 관리자
ALTER TABLE talat_admin
  ADD CONSTRAINT PK_talat_admin -- 관리자 기본키
    PRIMARY KEY (
      mno -- 관리자번호
    );

-- 지원메시지
CREATE TABLE talat_qna (
  qno       INTEGER      NOT NULL COMMENT '메세지번호', -- 메세지번호
  qtype     INTEGER      NOT NULL COMMENT '메시지분류', -- 메시지분류
  qdate     DATE         NOT NULL DEFAULT curdate()  COMMENT '날짜', -- 날짜
  qtime     TIME         NULL     DEFAULT curtime() COMMENT '시간', -- 시간
  wrt       VARCHAR(50)  NOT NULL COMMENT '작성자', -- 작성자
  resp_stat INTEGER      NOT NULL COMMENT '답변여부', -- 답변여부
  qcont     LONGTEXT     NOT NULL COMMENT '문의 내용', -- 문의 내용
  resp_cont LONGTEXT     NOT NULL COMMENT '답변 내용', -- 답변 내용
  file      VARCHAR(255) NULL     COMMENT '첨부파일', -- 첨부파일
  jno       INTEGER      NOT NULL COMMENT '여정번호', -- 여정번호
  mno       INTEGER      NULL     COMMENT '관리자번호' -- 관리자번호
)
COMMENT '지원메시지';

-- 지원메시지
ALTER TABLE talat_qna
  ADD CONSTRAINT PK_talat_qna -- 지원메시지 기본키
    PRIMARY KEY (
      qno -- 메세지번호
    );

-- 지원메시지
ALTER TABLE talat_qna
  ADD CONSTRAINT CK_talat_qna -- 지원메시지 체크 제약
    CHECK (resp_stat = 1 or resp_stat = 0);

-- 지원메시지
ALTER TABLE talat_qna
  ADD CONSTRAINT CK_talat_qna2 -- 지원메시지 체크 제약2
    CHECK (qtype = 1 or qtype = 2 or qtype = 3 or qtype = 4 );

ALTER TABLE talat_qna
  MODIFY COLUMN qno INTEGER NOT NULL AUTO_INCREMENT COMMENT '메세지번호';

-- 회원
CREATE TABLE talat_memb (
  mno   INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  mname VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
  email VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
  pwd   VARCHAR(100) NOT NULL COMMENT '비밀번호', -- 비밀번호
  tel   VARCHAR(30)  NOT NULL COMMENT '휴대폰번호', -- 휴대폰번호
  birth DATE         NOT NULL COMMENT '생년월일' -- 생년월일
)
COMMENT '회원';

-- 회원
ALTER TABLE talat_memb
  ADD CONSTRAINT PK_talat_memb -- 회원 기본키
    PRIMARY KEY (
      mno -- 회원번호
    );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_talat_memb
  ON talat_memb ( -- 회원
    email ASC -- 이메일
  );

-- 회원 인덱스
CREATE INDEX IX_talat_memb
  ON talat_memb( -- 회원
    mname ASC -- 이름
  );

ALTER TABLE talat_memb
  MODIFY COLUMN mno INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 여정
CREATE TABLE talat_journey (
  jno           INTEGER      NOT NULL COMMENT '여정번호', -- 여정번호
  dept          VARCHAR(255) NOT NULL COMMENT '출발지', -- 출발지
  arr           VARCHAR(255) NOT NULL COMMENT '도착지', -- 도착지
  jdate         DATE         NOT NULL COMMENT '날짜', -- 날짜
  jtime         TIME         NOT NULL COMMENT '시간', -- 시간
  roption       INTEGER      NOT NULL COMMENT '라이드 옵션', -- 라이드 옵션
  seat_psgr_cap INTEGER      NOT NULL COMMENT '보조석 인원', -- 보조석 인원
  seat_rear_cap INTEGER      NOT NULL COMMENT '뒷자석 인원', -- 뒷자석 인원
  pet           INTEGER      NOT NULL COMMENT '반려동물 탑승', -- 반려동물 탑승
  jstat         INTEGER      NOT NULL COMMENT '매칭상태' -- 매칭상태
)
COMMENT '여정';

-- 여정
ALTER TABLE talat_journey
  ADD CONSTRAINT PK_talat_journey -- 여정 기본키
    PRIMARY KEY (
      jno -- 여정번호
    );

-- 여정
ALTER TABLE talat_journey
  ADD CONSTRAINT CK_talat_journey -- 여정 체크 제약
    CHECK (pet = 1 or pet = 0);

-- 여정
ALTER TABLE talat_journey
  ADD CONSTRAINT CK_talat_journey2 -- 여정 체크 제약2
    CHECK (jstat = 1 or jstat = 0);

ALTER TABLE talat_journey
  MODIFY COLUMN jno INTEGER NOT NULL AUTO_INCREMENT COMMENT '여정번호';

-- 리뷰
CREATE TABLE talat_review (
  jno       INTEGER NOT NULL COMMENT '여정번호', -- 여정번호
  wrt_no    INTEGER NOT NULL COMMENT '작성자번호', -- 작성자번호
  ptnr_no   INTEGER NOT NULL COMMENT '파트너번호', -- 파트너번호
  review    INTEGER NOT NULL COMMENT '리뷰메세지', -- 리뷰메세지
  star      FLOAT   NOT NULL COMMENT '별점', -- 별점
  my_star   FLOAT   NOT NULL COMMENT '나의 별점', -- 나의 별점
  my_review INTEGER NOT NULL COMMENT '나의 칭찬' -- 나의 칭찬
)
COMMENT '리뷰';

-- 리뷰
ALTER TABLE talat_review
  ADD CONSTRAINT PK_talat_review -- 리뷰 기본키
    PRIMARY KEY (
      jno -- 여정번호
    );

-- 회원가입 기본정보
CREATE TABLE talat_join (
  mno         INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  nic         VARCHAR(50)  NOT NULL COMMENT '닉네임', -- 닉네임
  gender      INTEGER      NOT NULL COMMENT '성별', -- 성별
  pst_no      VARCHAR(255) NOT NULL COMMENT '우편번호', -- 우편번호
  basic_addr  VARCHAR(255) NOT NULL COMMENT '기본주소', -- 기본주소
  det_addr    VARCHAR(255) NOT NULL COMMENT '상세주소', -- 상세주소
  profile     VARCHAR(255) NOT NULL COMMENT '프로필사진', -- 프로필사진
  pref_gender INTEGER      NOT NULL COMMENT '선호성별', -- 선호성별
  rdt         DATE         NOT NULL DEFAULT curdate() COMMENT '등록날짜' -- 등록날짜
)
COMMENT '회원가입 기본정보';

-- 회원가입 기본정보
ALTER TABLE talat_join
  ADD CONSTRAINT PK_talat_join -- 회원가입 기본정보 기본키
    PRIMARY KEY (
      mno -- 회원번호
    );

-- 회원가입 기본정보
ALTER TABLE talat_join
  ADD CONSTRAINT CK_talat_join -- 회원가입 기본정보 체크 제약
    CHECK (gender = 1 or gender = 0);

-- 회원가입 기본정보
ALTER TABLE talat_join
  ADD CONSTRAINT CK_talat_join2 -- 회원가입 기본정보 체크 제약2
    CHECK (pref_gender = 1 or pref_gender = 0);

-- 라이더 고객지원
CREATE TABLE talat_rider_cs (
  mno INTEGER NOT NULL COMMENT '라이더번호', -- 라이더번호
  qno INTEGER NOT NULL COMMENT '메세지번호' -- 메세지번호
)
COMMENT '라이더 고객지원';

-- 라이더 고객지원
ALTER TABLE talat_rider_cs
  ADD CONSTRAINT PK_talat_rider_cs -- 라이더 고객지원 기본키
    PRIMARY KEY (
      mno, -- 라이더번호
      qno  -- 메세지번호
    );

-- 드라이버 고객지원
CREATE TABLE talat_driver_cs (
  mno INTEGER NOT NULL COMMENT '드라이버번호', -- 드라이버번호
  qno INTEGER NOT NULL COMMENT '메세지번호' -- 메세지번호
)
COMMENT '드라이버 고객지원';

-- 드라이버 고객지원
ALTER TABLE talat_driver_cs
  ADD CONSTRAINT PK_talat_driver_cs -- 드라이버 고객지원 기본키
    PRIMARY KEY (
      mno, -- 드라이버번호
      qno  -- 메세지번호
    );

-- 라이더 여정 등록
CREATE TABLE talat_journey_rider (
  mno     INTEGER NOT NULL COMMENT '라이더번호', -- 라이더번호
  jno     INTEGER NOT NULL COMMENT '여정번호', -- 여정번호
  jr_rdt  DATE    NULL     DEFAULT curdate() COMMENT '날짜', -- 날짜
  jr_time TIME    NULL     DEFAULT curtime() COMMENT '시간' -- 시간
)
COMMENT '라이더 여정 등록';

-- 라이더 여정 등록
ALTER TABLE talat_journey_rider
  ADD CONSTRAINT PK_talat_journey_rider -- 라이더 여정 등록 기본키
    PRIMARY KEY (
      mno, -- 라이더번호
      jno  -- 여정번호
    );

-- 드라이버 여정 등록
CREATE TABLE talat_journey_driver (
  mno     INTEGER NOT NULL COMMENT '드라이버번호', -- 드라이버번호
  jno     INTEGER NOT NULL COMMENT '여정번호', -- 여정번호
  jd_rdt  DATE    NULL     DEFAULT curdate() COMMENT '날짜', -- 날짜
  jd_time TIME    NULL     DEFAULT curtime() COMMENT '시간' -- 시간
)
COMMENT '드라이버 여정 등록';

-- 드라이버 여정 등록
ALTER TABLE talat_journey_driver
  ADD CONSTRAINT PK_talat_journey_driver -- 드라이버 여정 등록 기본키
    PRIMARY KEY (
      mno, -- 드라이버번호
      jno  -- 여정번호
    );

-- 드라이버 승인
CREATE TABLE talat_apvl (
  dno  INTEGER NOT NULL COMMENT '드라이버번호', -- 드라이버번호
  rdt  DATE    NULL     DEFAULT curdate() COMMENT '등록날짜', -- 등록날짜
  apvl INTEGER NULL     COMMENT '승인상태', -- 승인상태
  mno  INTEGER NULL     COMMENT '관리자번호' -- 관리자번호
)
COMMENT '드라이버 승인';

-- 드라이버 승인
ALTER TABLE talat_apvl
  ADD CONSTRAINT PK_talat_apvl -- 드라이버 승인 기본키
    PRIMARY KEY (
      dno -- 드라이버번호
    );

-- 드라이버 승인
ALTER TABLE talat_apvl
  ADD CONSTRAINT CK_talat_apvl -- 드라이버 승인 체크 제약
    CHECK (apvl = 1 or apvl = 0);

-- 라이더
ALTER TABLE talat_rider
  ADD CONSTRAINT FK_talat_join_TO_talat_rider -- 회원가입 기본정보 -> 라이더
    FOREIGN KEY (
      mno -- 라이더번호
    )
    REFERENCES talat_join ( -- 회원가입 기본정보
      mno -- 회원번호
    );

-- 드라이버
ALTER TABLE talat_driver
  ADD CONSTRAINT FK_talat_join_TO_talat_driver -- 회원가입 기본정보 -> 드라이버
    FOREIGN KEY (
      mno -- 드라이버번호
    )
    REFERENCES talat_join ( -- 회원가입 기본정보
      mno -- 회원번호
    );

-- 관리자
ALTER TABLE talat_admin
  ADD CONSTRAINT FK_talat_memb_TO_talat_admin -- 회원 -> 관리자
    FOREIGN KEY (
      mno -- 관리자번호
    )
    REFERENCES talat_memb ( -- 회원
      mno -- 회원번호
    );

-- 지원메시지
ALTER TABLE talat_qna
  ADD CONSTRAINT FK_talat_journey_TO_talat_qna -- 여정 -> 지원메시지
    FOREIGN KEY (
      jno -- 여정번호
    )
    REFERENCES talat_journey ( -- 여정
      jno -- 여정번호
    );

-- 지원메시지
ALTER TABLE talat_qna
  ADD CONSTRAINT FK_talat_admin_TO_talat_qna -- 관리자 -> 지원메시지
    FOREIGN KEY (
      mno -- 관리자번호
    )
    REFERENCES talat_admin ( -- 관리자
      mno -- 관리자번호
    );

-- 리뷰
ALTER TABLE talat_review
  ADD CONSTRAINT FK_talat_journey_TO_talat_review -- 여정 -> 리뷰
    FOREIGN KEY (
      jno -- 여정번호
    )
    REFERENCES talat_journey ( -- 여정
      jno -- 여정번호
    );

-- 회원가입 기본정보
ALTER TABLE talat_join
  ADD CONSTRAINT FK_talat_memb_TO_talat_join -- 회원 -> 회원가입 기본정보
    FOREIGN KEY (
      mno -- 회원번호
    )
    REFERENCES talat_memb ( -- 회원
      mno -- 회원번호
    );

-- 라이더 고객지원
ALTER TABLE talat_rider_cs
  ADD CONSTRAINT FK_talat_rider_TO_talat_rider_cs -- 라이더 -> 라이더 고객지원
    FOREIGN KEY (
      mno -- 라이더번호
    )
    REFERENCES talat_rider ( -- 라이더
      mno -- 라이더번호
    );

-- 라이더 고객지원
ALTER TABLE talat_rider_cs
  ADD CONSTRAINT FK_talat_qna_TO_talat_rider_cs -- 지원메시지 -> 라이더 고객지원
    FOREIGN KEY (
      qno -- 메세지번호
    )
    REFERENCES talat_qna ( -- 지원메시지
      qno -- 메세지번호
    );

-- 드라이버 고객지원
ALTER TABLE talat_driver_cs
  ADD CONSTRAINT FK_talat_driver_TO_talat_driver_cs -- 드라이버 -> 드라이버 고객지원
    FOREIGN KEY (
      mno -- 드라이버번호
    )
    REFERENCES talat_driver ( -- 드라이버
      mno -- 드라이버번호
    );

-- 드라이버 고객지원
ALTER TABLE talat_driver_cs
  ADD CONSTRAINT FK_talat_qna_TO_talat_driver_cs -- 지원메시지 -> 드라이버 고객지원
    FOREIGN KEY (
      qno -- 메세지번호
    )
    REFERENCES talat_qna ( -- 지원메시지
      qno -- 메세지번호
    );

-- 라이더 여정 등록
ALTER TABLE talat_journey_rider
  ADD CONSTRAINT FK_talat_rider_TO_talat_journey_rider -- 라이더 -> 라이더 여정 등록
    FOREIGN KEY (
      mno -- 라이더번호
    )
    REFERENCES talat_rider ( -- 라이더
      mno -- 라이더번호
    );

-- 라이더 여정 등록
ALTER TABLE talat_journey_rider
  ADD CONSTRAINT FK_talat_journey_TO_talat_journey_rider -- 여정 -> 라이더 여정 등록
    FOREIGN KEY (
      jno -- 여정번호
    )
    REFERENCES talat_journey ( -- 여정
      jno -- 여정번호
    );

-- 드라이버 여정 등록
ALTER TABLE talat_journey_driver
  ADD CONSTRAINT FK_talat_driver_TO_talat_journey_driver -- 드라이버 -> 드라이버 여정 등록
    FOREIGN KEY (
      mno -- 드라이버번호
    )
    REFERENCES talat_driver ( -- 드라이버
      mno -- 드라이버번호
    );

-- 드라이버 여정 등록
ALTER TABLE talat_journey_driver
  ADD CONSTRAINT FK_talat_journey_TO_talat_journey_driver -- 여정 -> 드라이버 여정 등록
    FOREIGN KEY (
      jno -- 여정번호
    )
    REFERENCES talat_journey ( -- 여정
      jno -- 여정번호
    );

-- 드라이버 승인
ALTER TABLE talat_apvl
  ADD CONSTRAINT FK_talat_admin_TO_talat_apvl -- 관리자 -> 드라이버 승인
    FOREIGN KEY (
      mno -- 관리자번호
    )
    REFERENCES talat_admin ( -- 관리자
      mno -- 관리자번호
    );

-- 드라이버 승인
ALTER TABLE talat_apvl
  ADD CONSTRAINT FK_talat_driver_TO_talat_apvl -- 드라이버 -> 드라이버 승인
    FOREIGN KEY (
      dno -- 드라이버번호
    )
    REFERENCES talat_driver ( -- 드라이버
      mno -- 드라이버번호
    );