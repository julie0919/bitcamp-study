-- 라이더
DROP TABLE IF EXISTS talat_rider RESTRICT;

-- 드라이버
DROP TABLE IF EXISTS talat_driver RESTRICT;

-- 드라이버문의
DROP TABLE IF EXISTS talat_qna_driver RESTRICT;

-- 회원
DROP TABLE IF EXISTS talat_memb RESTRICT;

-- 카풀여정
DROP TABLE IF EXISTS talat_journey RESTRICT;

-- 리뷰메시지
DROP TABLE IF EXISTS talat_review RESTRICT;

-- 회원가입 기본정보
DROP TABLE IF EXISTS talat_join RESTRICT;

-- 라이더 여정 신청
DROP TABLE IF EXISTS talat_journey_rider RESTRICT;

-- 카풀경로
DROP TABLE IF EXISTS talat_journey_route RESTRICT;

-- 문의유형
DROP TABLE IF EXISTS talat_qna RESTRICT;

-- 라이더문의
DROP TABLE IF EXISTS talat_qna_rider RESTRICT;

-- 라이더
CREATE TABLE talat_rider (
  mno INTEGER NOT NULL COMMENT '라이더번호' -- 라이더번호
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
  lic_photo  VARCHAR(255) NOT NULL COMMENT '운전면허증 사진', -- 운전면허증 사진
  ins_photo  VARCHAR(255) NOT NULL COMMENT '보험증 사진', -- 보험증 사진
  car_photo  VARCHAR(255) NOT NULL COMMENT '차량 측면 사진', -- 차량 측면 사진
  corp_photo VARCHAR(255) NOT NULL COMMENT '회사 인증 사진', -- 회사 인증 사진
  apvl       INTEGER      NOT NULL COMMENT '승인여부', -- 승인여부
  drdt       DATE         NOT NULL DEFAULT curdate() COMMENT '승인날짜', -- 승인날짜
  apvl_cont  LONGTEXT     NULL     COMMENT '비고', -- 비고
  star_avg   FLOAT        NOT NULL COMMENT '별점통계', -- 별점통계
  rev_no     INTEGER      NOT NULL COMMENT '리뷰메시지통계' -- 리뷰메시지통계
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

-- 드라이버문의
CREATE TABLE talat_qna_driver (
  dqno        INTEGER      NOT NULL COMMENT '드라이버문의번호', -- 드라이버문의번호
  qno         INTEGER      NOT NULL COMMENT '문의유형번호', -- 문의유형번호
  jno         INTEGER      NOT NULL COMMENT '여정번호', -- 여정번호
  dqdate      DATE         NOT NULL DEFAULT curdate()  COMMENT '날짜', -- 날짜
  dqtime      TIME         NOT NULL DEFAULT curtime() COMMENT '시간', -- 시간
  dwrt        VARCHAR(50)  NOT NULL COMMENT '작성자', -- 작성자
  answ_stat_d INTEGER      NOT NULL COMMENT '답변여부', -- 답변여부
  dqcont      LONGTEXT     NOT NULL COMMENT '문의 내용', -- 문의 내용
  answ_cont_d LONGTEXT     NOT NULL COMMENT '답변 내용', -- 답변 내용
  dfile       VARCHAR(255) NULL     COMMENT '첨부파일' -- 첨부파일
)
COMMENT '드라이버문의';

-- 드라이버문의
ALTER TABLE talat_qna_driver
  ADD CONSTRAINT PK_talat_qna_driver -- 드라이버문의 기본키
    PRIMARY KEY (
      dqno -- 드라이버문의번호
    );

-- 드라이버문의
ALTER TABLE talat_qna_driver
  ADD CONSTRAINT CK_talat_qna_driver -- 드라이버문의 체크 제약
    CHECK (resp_stat = 1 or resp_stat = 0);

-- 드라이버문의
ALTER TABLE talat_qna_driver
  ADD CONSTRAINT CK_talat_qna_driver2 -- 드라이버문의 체크 제약2
    CHECK (qtype = 1 or qtype = 2 or qtype = 3 or qtype = 4 );

ALTER TABLE talat_qna_driver
  MODIFY COLUMN dqno INTEGER NOT NULL AUTO_INCREMENT COMMENT '드라이버문의번호';

-- 회원
CREATE TABLE talat_memb (
  mno   INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  mname VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
  email VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
  pwd   VARCHAR(100) NOT NULL COMMENT '비밀번호', -- 비밀번호
  tel   VARCHAR(30)  NOT NULL COMMENT '휴대폰번호', -- 휴대폰번호
  birth DATE         NOT NULL COMMENT '생년월일', -- 생년월일
  mtype INTEGER      NOT NULL COMMENT '회원분류' -- 회원분류
)
COMMENT '회원';

-- 회원
ALTER TABLE talat_memb
  ADD CONSTRAINT PK_talat_memb -- 회원 기본키
    PRIMARY KEY (
      mno -- 회원번호
    );

-- 회원
ALTER TABLE talat_memb
  ADD CONSTRAINT CK_talat_memb -- 회원 체크 제약
    CHECK (mtype = 0 or mtype = 1 or mtype = 2);

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

-- 카풀여정
CREATE TABLE talat_journey (
  jno           INTEGER      NOT NULL COMMENT '여정번호', -- 여정번호
  mno           INTEGER      NOT NULL COMMENT '드라이버번호', -- 드라이버번호
  dept          VARCHAR(255) NOT NULL COMMENT '출발지', -- 출발지
  arr           VARCHAR(255) NOT NULL COMMENT '도착지', -- 도착지
  jdate         DATE         NOT NULL COMMENT '날짜', -- 날짜
  jtime         TIME         NOT NULL COMMENT '도착시각', -- 도착시각
  seat_psgr_cap INTEGER      NOT NULL COMMENT '보조석 인원', -- 보조석 인원
  seat_rear_cap INTEGER      NOT NULL COMMENT '뒷자석 인원', -- 뒷자석 인원
  pet           INTEGER      NOT NULL COMMENT '반려동물 탑승', -- 반려동물 탑승
  jfee          INTEGER      NOT NULL COMMENT '운임요금', -- 운임요금
  jcont         LONGTEXT     NULL     COMMENT '여정설명' -- 여정설명
)
COMMENT '카풀여정';

-- 카풀여정
ALTER TABLE talat_journey
  ADD CONSTRAINT PK_talat_journey -- 카풀여정 기본키
    PRIMARY KEY (
      jno -- 여정번호
    );

-- 카풀여정
ALTER TABLE talat_journey
  ADD CONSTRAINT CK_talat_journey -- 카풀여정 체크 제약
    CHECK (pet = 1 or pet = 0);

-- 카풀여정
ALTER TABLE talat_journey
  ADD CONSTRAINT CK_talat_journey2 -- 카풀여정 체크 제약2
    CHECK (jstat = 1 or jstat = 0);

ALTER TABLE talat_journey
  MODIFY COLUMN jno INTEGER NOT NULL AUTO_INCREMENT COMMENT '여정번호';

-- 리뷰메시지
CREATE TABLE talat_review (
  rev_no INTEGER NOT NULL COMMENT '리뷰메시지번호', -- 리뷰메시지번호
  rev    INTEGER NOT NULL COMMENT '리뷰내용' -- 리뷰내용
)
COMMENT '리뷰메시지';

-- 리뷰메시지
ALTER TABLE talat_review
  ADD CONSTRAINT PK_talat_review -- 리뷰메시지 기본키
    PRIMARY KEY (
      rev_no -- 리뷰메시지번호
    );

-- 회원가입 기본정보
CREATE TABLE talat_join (
  mno         INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  nic         VARCHAR(50)  NOT NULL COMMENT '닉네임', -- 닉네임
  gender      INTEGER      NOT NULL COMMENT '성별', -- 성별
  pst_no      VARCHAR(255) NOT NULL COMMENT '우편번호', -- 우편번호
  basic_addr  VARCHAR(255) NOT NULL COMMENT '기본주소', -- 기본주소
  det_addr    VARCHAR(255) NOT NULL COMMENT '상세주소', -- 상세주소
  prof        VARCHAR(255) NOT NULL COMMENT '프로필사진', -- 프로필사진
  pref_gender INTEGER      NOT NULL COMMENT '선호성별', -- 선호성별
  mrdt        DATE         NOT NULL DEFAULT curdate() COMMENT '등록날짜' -- 등록날짜
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

-- 라이더 여정 신청
CREATE TABLE talat_journey_rider (
  rjno     INTEGER  NOT NULL COMMENT '라이더여정신청번호', -- 라이더여정신청번호
  mno      INTEGER  NOT NULL COMMENT '라이더번호', -- 라이더번호
  jno      INTEGER  NOT NULL COMMENT '여정번호', -- 여정번호
  mstat    INTEGER  NOT NULL COMMENT '매칭상태', -- 매칭상태
  mcont    LONGTEXT NULL     COMMENT '비고', -- 비고
  dstar    FLOAT    NULL     COMMENT '드라이버별점', -- 드라이버별점
  rev_no_d INTEGER  NULL     COMMENT '드라이버리뷰유형번호', -- 드라이버리뷰유형번호
  rstar    FLOAT    NULL     COMMENT '라이더별점', -- 라이더별점
  rev_no_r INTEGER  NULL     COMMENT '라이더리뷰유형번호' -- 라이더리뷰유형번호
)
COMMENT '라이더 여정 신청';

-- 라이더 여정 신청
ALTER TABLE talat_journey_rider
  ADD CONSTRAINT PK_talat_journey_rider -- 라이더 여정 신청 기본키
    PRIMARY KEY (
      rjno -- 라이더여정신청번호
    );

-- 라이더 여정 신청 유니크 인덱스
CREATE UNIQUE INDEX UIX_talat_journey_rider
  ON talat_journey_rider ( -- 라이더 여정 신청
    mno ASC, -- 라이더번호
    jno ASC  -- 여정번호
  );

-- 카풀경로
CREATE TABLE talat_journey_route (
  rno        INTEGER     NOT NULL COMMENT '경로번호', -- 경로번호
  jno        INTEGER     NOT NULL COMMENT '여정번호', -- 여정번호
  spot_order INTEGER     NOT NULL COMMENT '경로순서', -- 경로순서
  lat        DECIMAL     NOT NULL COMMENT '위도', -- 위도
  lng        DECIMAL     NOT NULL COMMENT '경도', -- 경도
  spot_name  VARCHAR(50) NOT NULL COMMENT '장소명', -- 장소명
  spot_time  TIME        NULL     COMMENT '정차예상시각' -- 정차예상시각
)
COMMENT '카풀경로';

-- 카풀경로
ALTER TABLE talat_journey_route
  ADD CONSTRAINT PK_talat_journey_route -- 카풀경로 기본키
    PRIMARY KEY (
      rno -- 경로번호
    );

-- 문의유형
CREATE TABLE talat_qna (
  qno    INTEGER NOT NULL COMMENT '문의유형번호', -- 문의유형번호
  qtitle INTEGER NOT NULL COMMENT '문의유형제목' -- 문의유형제목
)
COMMENT '문의유형';

-- 문의유형
ALTER TABLE talat_qna
  ADD CONSTRAINT PK_talat_qna -- 문의유형 기본키
    PRIMARY KEY (
      qno -- 문의유형번호
    );

-- 라이더문의
CREATE TABLE talat_qna_rider (
  rqno        INTEGER      NOT NULL COMMENT '라이더문의번호', -- 라이더문의번호
  qno         INTEGER      NOT NULL COMMENT '문의유형번호', -- 문의유형번호
  rjno        INTEGER      NOT NULL COMMENT '라이더여정신청번호', -- 라이더여정신청번호
  rqdate      DATE         NOT NULL DEFAULT curdate()  COMMENT '날짜', -- 날짜
  rqtime      TIME         NOT NULL DEFAULT curtime() COMMENT '시간', -- 시간
  rwrt        VARCHAR(50)  NOT NULL COMMENT '작성자', -- 작성자
  answ_stat_r INTEGER      NOT NULL COMMENT '답변여부', -- 답변여부
  rqcont      LONGTEXT     NOT NULL COMMENT '문의 내용', -- 문의 내용
  answ_cont_r LONGTEXT     NOT NULL COMMENT '답변 내용', -- 답변 내용
  rfile       VARCHAR(255) NULL     COMMENT '첨부파일' -- 첨부파일
)
COMMENT '라이더문의';

-- 라이더문의
ALTER TABLE talat_qna_rider
  ADD CONSTRAINT PK_talat_qna_rider -- 라이더문의 기본키
    PRIMARY KEY (
      rqno -- 라이더문의번호
    );

-- 라이더문의
ALTER TABLE talat_qna_rider
  ADD CONSTRAINT CK_talat_qna_rider -- 라이더문의 체크 제약
    CHECK (resp_stat = 1 or resp_stat = 0);

-- 라이더문의
ALTER TABLE talat_qna_rider
  ADD CONSTRAINT CK_talat_qna_rider2 -- 라이더문의 체크 제약2
    CHECK (qtype = 1 or qtype = 2 or qtype = 3 or qtype = 4 );

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

-- 드라이버
ALTER TABLE talat_driver
  ADD CONSTRAINT FK_talat_review_TO_talat_driver -- 리뷰메시지 -> 드라이버
    FOREIGN KEY (
      rev_no -- 리뷰메시지통계
    )
    REFERENCES talat_review ( -- 리뷰메시지
      rev_no -- 리뷰메시지번호
    );

-- 드라이버문의
ALTER TABLE talat_qna_driver
  ADD CONSTRAINT FK_talat_journey_TO_talat_qna_driver -- 카풀여정 -> 드라이버문의
    FOREIGN KEY (
      jno -- 여정번호
    )
    REFERENCES talat_journey ( -- 카풀여정
      jno -- 여정번호
    );

-- 드라이버문의
ALTER TABLE talat_qna_driver
  ADD CONSTRAINT FK_talat_qna_TO_talat_qna_driver -- 문의유형 -> 드라이버문의
    FOREIGN KEY (
      qno -- 문의유형번호
    )
    REFERENCES talat_qna ( -- 문의유형
      qno -- 문의유형번호
    );

-- 카풀여정
ALTER TABLE talat_journey
  ADD CONSTRAINT FK_talat_driver_TO_talat_journey -- 드라이버 -> 카풀여정
    FOREIGN KEY (
      mno -- 드라이버번호
    )
    REFERENCES talat_driver ( -- 드라이버
      mno -- 드라이버번호
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

-- 라이더 여정 신청
ALTER TABLE talat_journey_rider
  ADD CONSTRAINT FK_talat_rider_TO_talat_journey_rider -- 라이더 -> 라이더 여정 신청
    FOREIGN KEY (
      mno -- 라이더번호
    )
    REFERENCES talat_rider ( -- 라이더
      mno -- 라이더번호
    );

-- 라이더 여정 신청
ALTER TABLE talat_journey_rider
  ADD CONSTRAINT FK_talat_journey_TO_talat_journey_rider -- 카풀여정 -> 라이더 여정 신청
    FOREIGN KEY (
      jno -- 여정번호
    )
    REFERENCES talat_journey ( -- 카풀여정
      jno -- 여정번호
    );

-- 라이더 여정 신청
ALTER TABLE talat_journey_rider
  ADD CONSTRAINT FK_talat_review_TO_talat_journey_rider -- 리뷰메시지 -> 라이더 여정 신청2
    FOREIGN KEY (
      rev_no_d -- 드라이버리뷰유형번호
    )
    REFERENCES talat_review ( -- 리뷰메시지
      rev_no -- 리뷰메시지번호
    );

-- 라이더 여정 신청
ALTER TABLE talat_journey_rider
  ADD CONSTRAINT FK_talat_review_TO_talat_journey_rider2 -- 리뷰메시지 -> 라이더 여정 신청
    FOREIGN KEY (
      rev_no_r -- 라이더리뷰유형번호
    )
    REFERENCES talat_review ( -- 리뷰메시지
      rev_no -- 리뷰메시지번호
    );

-- 카풀경로
ALTER TABLE talat_journey_route
  ADD CONSTRAINT FK_talat_journey_TO_talat_journey_route -- 카풀여정 -> 카풀경로
    FOREIGN KEY (
      jno -- 여정번호
    )
    REFERENCES talat_journey ( -- 카풀여정
      jno -- 여정번호
    );

-- 라이더문의
ALTER TABLE talat_qna_rider
  ADD CONSTRAINT FK_talat_journey_rider_TO_talat_qna_rider -- 라이더 여정 신청 -> 라이더문의
    FOREIGN KEY (
      rjno -- 라이더여정신청번호
    )
    REFERENCES talat_journey_rider ( -- 라이더 여정 신청
      rjno -- 라이더여정신청번호
    );

-- 라이더문의
ALTER TABLE talat_qna_rider
  ADD CONSTRAINT FK_talat_qna_TO_talat_qna_rider -- 문의유형 -> 라이더문의
    FOREIGN KEY (
      qno -- 문의유형번호
    )
    REFERENCES talat_qna ( -- 문의유형
      qno -- 문의유형번호
    );