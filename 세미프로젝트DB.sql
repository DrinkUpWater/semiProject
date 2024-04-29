--ALTER TABLE SPACE ADD USER_NO REFERENCES MEMBER(USER_NO) ON DELETE SET NULL;
---CREATE USER ROOMMOA IDENTIFIED BY ROOMMOA;

---GRANT RESOURCE ,CONNECT TO ROOMMOA;
--DROP SEQUENCE SEQ_ATNO;
--DROP TABLE ATTACHMENT;
--
--DROP SEQUENCE SEQ_HCNO;
--DROP TABLE HOSTCOMMENT;
--
--DROP SEQUENCE SEQ_GCNO;
--DROP TABLE GUESTCOMMENT;
--
--
--DROP SEQUENCE SEQ_RDNO;
--DROP TABLE  RESERVATION_DATE; 
--
--DROP SEQUENCE SEQ_RNO;
--DROP TABLE RESERVATION;
--
--DROP SEQUENCE SEQ_RDNO;
--DROP TABLE RESERVATION_DATE;
--
--
--DROP SEQUENCE SEQ_UNO; -- 회원번호 발생시킬 시퀀스
--DROP TABLE MEMBER;
--DROP SEQUENCE SEQ_SNO;
--DROP TABLE SPACE;
--
--DROP SEQUENCE SEQ_SONO;
--DROP TABLE SPACE_OPTION; 
--
--DROP SEQUENCE SEQ_SCNO;
--DROP TABLE SPACE_CATEGORY; 
--
--DROP SEQUENCE SEQ_PNO;
--DROP TABLE PICKED; 
--
--DROP SEQUENCE SEQ_NRNO;
--DROP TABLE NOTICE_REPLY;
--
--DROP SEQUENCE SEQ_BRNO;
--DROP TABLE BOARD_REPLY;
--
--DROP SEQUENCE SEQ_NNO;
--DROP TABLE NOTICE;
--
--DROP SEQUENCE SEQ_BNO;
--DROP TABLE BOARD;
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/

--접속유저의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/

--접속유저의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/



--------------------------------------------------------------------------
------------------------ MEMBER 관련 ---------------------------
--------------------------------------------------------------------

CREATE TABLE MEMBER(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(50) NOT NULL UNIQUE,
    USER_PWD VARCHAR2(50) NOT NULL,
    USER_NAME VARCHAR2(20) NOT NULL,
    GENDER VARCHAR2(3) CHECK (GENDER IN ('M','F')) NOT NULL,
    USER_NICKNAME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(20) NOT NULL,
    PHONE VARCHAR2(20) NOT NULL UNIQUE,
    BIRTH VARCHAR2(20) NOT NULL,
    JOIN_DATE DATE DEFAULT SYSDATE NOT NULL,
    MODIFY_DATE DATE DEFAULT SYSDATE  NULL,
    STATUS VARCHAR2(3) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')) NOT NULL,
    USER_HOST VARCHAR2(3) DEFAULT 'G' CHECK (USER_HOST IN('H', 'G')) NOT NULL,
    USER_ADMIN VARCHAR2(3) DEFAULT 'N' CHECK (USER_ADMIN IN('Y', 'N')) NOT NULL
);
CREATE SEQUENCE SEQ_UNO
NOCACHE;
--TO_DATE('9999-12-31', 'YYYY-MM-DD')
-- TO_CHAR(SYSDATE, 'YYYY-MM-DD')

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'admin', '1234', '관리자','M','관리자','admin@kh.or.kr', '01011112222','991024',DEFAULT,DEFAULT,DEFAULT,DEFAULT, 'Y');
INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'admintori', '1234', '형우','M','토리','tori@kh.or.kr', '01055558888','980416',DEFAULT,NULL,DEFAULT,'H', 'Y');
SELECT *FROM MEMBER;

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'USER1', '1234', 'USER1','M','유저1','USER1@kh.or.kr', '01055556666','000101',DEFAULT,NULL,DEFAULT,'H', 'N');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'USER2', '1234', 'USER2','M','유저2','USER2@kh.or.kr', '01055556667','090101',DEFAULT,NULL,DEFAULT,'G', 'N');
INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'USER3', '1234', 'USER3','M','유저3','USER3@kh.or.kr', '01055556668','090101',DEFAULT,NULL,DEFAULT,'H', 'N');
INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'USER5', '1234', '이경주','M','경주쿤','USER5@kh.or.kr', '01055556696','090101',DEFAULT,NULL,DEFAULT,'G', 'Y');
INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'USER6', '1234', '신형우','M','형우쿤','USER6@kh.or.kr', '01055556106','090101',DEFAULT,NULL,DEFAULT,'G', 'Y');
INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'USER7', '1234', '박성호','M','성호쿤','USER7@kh.or.kr', '01055556611','090101',DEFAULT,NULL,DEFAULT,'G', 'Y');
INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'USER8', '1234', '함유철','M','유철쿤','USER8@kh.or.kr', '01055551412','990101',DEFAULT,NULL,DEFAULT,'G', 'Y');
INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'USER9', '1234', '워크맨','M','워크맨채널','USER8@kh.or.kr', '01022551412','990101',DEFAULT,NULL,DEFAULT,'G', 'N');
INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'USER10', '1234', '빠니보틀','M','빠니보틀123','USER8@kh.or.kr', '01033551412','990101',DEFAULT,NULL,DEFAULT,'G', 'N');
INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'USER11', '1234', '유재석','M','유재석MC','USER8@kh.or.kr', '01056651412','990101',DEFAULT,NULL,DEFAULT,'G', 'N');


SELECT *FROM MEMBER;


--currval

-------------------------space 테이블 ---------------------------

create table space(
    SPACE_NO NUMBER PRIMARY KEY,
    SPACE_NAME VARCHAR2(50) NOT NULL,
    SPACE_KIND VARCHAR2(100) NOT NULL,
    SPACE_ONE_INTRODUCE VARCHAR(1000),
    SPACE_INTRODUCE VARCHAR2(1000),
    SPACE_TAG VARCHAR2(1000),
    SPACE_INFORMATION VARCHAR2(1000),
    SPACE_CAUTION VARCHAR(1000),
    SPACE_MIMG VARCHAR2(50),
    SPACE_IMG VARCHAR2(50),
    SPACE_ADDRESS VARCHAR2(100) NOT NULL,
    SPACE_DETAIL_ADDRESS VARCHAR2(100) NOT NULL,
    SPACE_PRICE NUMBER,
    SPACE_LOCATION VARCHAR2(100),
    SPACE_TEL VARCHAR(20),
    USER_NO NUMBER,
    SPACE_COUNT NUMBER DEFAULT 0 NOT NULL,
 
    SPACE_CAPACITY NUMBER,
    SPACE_RESERVATION_STATUS CHAR(1) DEFAULT 'N' CHECK( SPACE_RESERVATION_STATUS IN('Y','N')) NOT NULL, --공간예약상태
    SPACE_ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL, --공간 등록일
    SPACE_ENROLL_STATUS VARCHAR(3) DEFAULT 'Y' CHECK( SPACE_ENROLL_STATUS IN('Y','N')), --공간 등록상태
    
    FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO) ON DELETE SET NULL
    
);



CREATE SEQUENCE SEQ_SNO
NOCACHE;


INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '카페 디라이트',
            '파티룸/회의실/세미나실',
            '자연 속 평화로운 산장 리트리트',
            '아늑한 분위기와 다양한 음료를 즐길 수 있는 휴식 공간입니다.',
            '#카페 #커피 #휴식',
            '개별노트북/독서/의자/책상',
            '1.피크 시간에는 자리가 제한될 수 있으니 사전 예약이 권장됩니다./2.환불 불가입니다. 주의해주세요',
            '/resources/space_sample_img/sample2.jpg',
            '이미지',
            '서울 강남구 역삼로38길 16',
            'kh빌딩 1001호',
             1500,
             '위치',
             '010-1234-1234',
             8,
             2,
             DEFAULT
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '러닝 강의실',
            '파티룸/회의실/스터디룸',
            ' ',
            '교육과 트레이닝에 최적화된 공간으로, 최신 시설과 편의시설이 구비되어 있습니다.',
            '#교육 #강의 #트레이닝',
            '프로젝터/스크린/화이트보드/의자/책상',
            '예약시 주의사항',
            '/resources/space_sample_img/sample3.jpg',
            '이미지',
            '서울 강남구 역삼로 226',
            '삼보빌딩 1023호',
             2000,
             '역삼역 도보 10분거리',
             '010-1234-1234',
             10,
            2,
             DEFAULT
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '비즈니스 코너',
            '강의실 회의실',
            ' ',
            '회의와 업무 모임에 최적화된 공간으로, 협업과 토론을 위한 시설이 갖춰져 있습니다.',
            '#회의 #업무 #모임 #협업',
            '비디오 컨퍼런싱 시스템/의자/테이블/프로젝터',
            '1.회의실 예약 시 필요한 시간과 장비를 명확히 밝혀주세요./',
            '/resources/space_sample_img/sample4.jpg',
            '이미지',
            '서울 강남구 역삼로25길 3',
            '역삼빌딩 1223호',
             1000,
             '역삼역 8번출구 도보 25분',
             '010-1234-5678',
             8,
            2,
             2
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '빅 세미나실',
            '파티룸',
            ' ',
            '대규모 행사나 교육 프로그램을 위한 공간으로, 특별한 이벤트에 적합합니다.',
            '#세미나 #대규모이벤트 #교육',
            '무대 및 오디오 시스템/의자와 테이블/무선 마이크',
            '1.세미나실 예약 시 추가 서비스 및 시설을 사전에 문의해주세요./',
            '/resources/space_sample_img/sample5.jpg',
            '이미지',
            '서울 강남구 역삼동 738-8',
            '강남빌딩 3동 1234호',
             2500,
             '강남역 10번출구 버스 15분거리',
             '010-1234-1235',
             10,
             2,
             11
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '스터디 코너',
            '파티룸/스터디룸',
            ' ',
            '조용한 환경에서 공부하고 작업할 수 있는 공간으로, 전용 시설이 제공됩니다.',
            '#스터디 #공부 #작업',
            '개별 노트북/의자/책상',
            '스터디룸 예약 시 최대 이용 시간을 확인해주세요./',
            '/resources/space_sample_img/sample6.jpg',
            '이미지',
            '서울 강남구 역삼로17길 51',
            '강남빌딩 123호-3',
             1000,
             '강남역 도보 21분',
             '010-1234-1234',
             6,
             3,
             2
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '플렉스 스페이스',
            '카페/스터디룸',
            ' ',
            '유연한 사용이 가능한 다목적 공간으로, 다양한 활동에 활용할 수 있습니다. ',
            '#다목적 #플렉스 #다용도',
            '1.이동 가능한 가구 및 장비, 다용도 활용 가능/',
            '1.플렉스 스페이스 예약 시 사용 목적을 명확히 밝혀주세요./',
            '/resources/space_sample_img/sample7.jpg',
            '이미지',
            '서울 강남구 테헤란로20길 33',
            '테헤빌딩 5232호',
             1000,
             '테헤빌딩 3호',
             '010-1234-1234',
             7,
             3,
             15
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '디자인 스튜디오',
            '회의실/세미나실',
            ' ',
            '디자인 작업을 위한 전문 공간으로, 창의적인 활동을 지원합니다..',
            '#디자인 #창작 #창의성',
            '그래픽 디자인 소프트웨어/디자인 보드/컴퓨터/태블릿',
            '1.디자인 스튜디오 예약 시 필요한 장비와 소재를 사전에 확인해주세요./',
            '/resources/space_sample_img/sample8.jpg',
            '이미지',
            '서울 강남구 테헤란로14길 34',
            '상세주소',
             1800,
             '위치',
             '010-1234-1234',
             8,
             3,
             6
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '공간9',
            '파티룸/세미나실/스터디룸',
            '로맨틱 신혼부부 하우스',
            '신혼부부를 위한 로맨틱한 하우스, 아늑한 분위기와 함께 당신만의 특별한 추억을 만들어보세요.',
            '태그9',
            '시설안내9',
            '1.예약시 주의사항/2.최대 2시간까지예약가능합니다./3.연속된 시간은 예약 불가/4.추가인원은 연락주시면 안내도와드리고 있습니다./5.지나친 소음은 삼가해주세요',
            '/resources/space_sample_img/sample9.jpg',
            '이미지',
            '서울 강남구 테헤란로14길 30-1',
            '상세주소',
             1900,
             '위치',
             '010-1234-1234',
             9,
             3,
             10
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '공간10',
            '파티룸/카페/회의실/강의실',
            '호수 전망 모던 코티지',
            '고요한 호수 전망과 함께하는 모던한 코티지, 자연 속에서의 평온한 휴식을 즐기세요.',
            '태그10',
            '시설안내10',
            '예약시 주의사항10',
            '/resources/space_sample_img/sample10.jpg',
            '이미지',
            '서울 강남구 테헤란로8길 33',
            '상세주소',
             1200,
             '위치',
             '010-1234-1234',
             10,
             3,
             23
);

INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '공간11',
            '파티룸/카페/강의실',
            '도심 오아시스의 아늑한 하우스',
            '도심 속 작은 오아시스, 심플하고 아늑한 인테리어가 돋보이는 편안한 하우스입니다.',
            '태그11',
            '시설안내11',
            '예약시 주의사항11',
            '/resources/space_sample_img/sample11.jpg',
            '이미지',
            '서울 강남구 테헤란로6길 30',
            '상세주소',
             1000,
             '위치',
             '010-1234-1234',
             5,
             3,
             0
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '공간12',
            '파티룸/회의실/세미나실',
            '전통 한옥 스테이의 문화 여행',
            '문화와 역사가 깃든 전통 한옥 스테이, 한국의 아름다운 전통을 경험해보세요.',
            '태그12',
            '시설안내12',
            '예약시 주의사항12',
            '/resources/space_sample_img/sample12.jpg',
            '이미지',
            '서울 강남구 강남대로84길 24-4',
            '상세주소',
             1500,
             '위치',
             '010-1234-1234',
             8,
             4,
             DEFAULT
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '공간13',
            '파티룸/회의실/스터디룸',
            '독특한 아키텍처의 럭셔리 빌라',
            '독특한 아키텍처와 아름다운 정원이 어우러진 럭셔리 빌라, 완벽한 프라이빗 휴가를 위한 최적의 선택입니다.',
            '태그13',
            '시설안내13',
            '예약시 주의사항13',
            '/resources/space_sample_img/sample13.jpg',
            '이미지',
            '서울 강남구 강남대로 382',
            '상세주소',
             2000,
             '위치',
             '010-1234-1234',
             10,
            4,
             DEFAULT
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '공간14',
            '강의실/회의실',
            '산과 자연이 어우러진 플랜트리트',
            '푸른 산과 함께하는 자연 속 플랜트리트, 조용한 환경에서의 힐링을 위한 완벽한 장소입니다.',
            '태그14',
            '시설안내14',
            '예약시 주의사항14',
            '/resources/space_sample_img/sample14.jpg',
            '이미지',
            '서울 강남구 테헤란로5길 7',
            '상세주소',
             1000,
             '위치',
             '010-1234-1234',
             8,
             4,
             2
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '공간15',
            '카페/스터디룸',
            '트렌디한 루프탑 바의 도시 아파트',
            '트렌디한 루프탑 바와 함께하는 도시 전망 아파트, 도시의 활력을 느껴보세요.',
            '태그15',
            '시설안내15',
            '예약시 주의사항15',
            '/resources/space_sample_img/sample15.jpg',
            '이미지',
            '서울 강남구 테헤란로5길 18',
            '상세주소',
             2500,
             '위치',
             '010-1234-1234',
             10,
             5,
             11
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '공간16',
            '파티룸/스터디룸',
            '역동적인 시내의 터키식 아파트',
            '역동적인 시내와 가까운 아늑한 터키식 아파트, 도시 생활을 즐기는 최적의 선택입니다.',
            '태그16',
            '시설안내16',
            '예약시 주의사항16',
            '/resources/space_sample_img/sample16.jpg',
            '이미지',
            '서울 강남구 테헤란로 131',
            '상세주소',
             1000,
             '위치',
             '010-1234-1234',
             6,
            5,
             2
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '공간17',
            '카페/스터디룸',
            ' 역사적 건물의 독특한 게스트하우스',
            '역사적인 건물을 개조한 독특한 게스트하우스, 도심 속 특별한 경험을 선사합니다.',
            '태그17',
            '시설안내',
            '예약시 주의사항',
            '/resources/space_sample_img/sample17.jpg',
            '이미지',
            '서울 강남구 테헤란로19길 18',
            '상세주소',
             1000,
             '위치',
             '010-1234-1234',
             7,
            5,
             15
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '공간18',
            '회의실/세미나실',
            ' 루치아 시골 빌라의 아름다운 풍경',
            '루치아의 아름다운 풍경을 감상할 수 있는 시골 빌라, 자연과 어우러진 평온한 휴식을 즐기세요.',
            '태그18',
            '시설안내18',
            '1.예약시 주의사항/2.최대 2시간까지예약가능합니다./3.연속된 시간만 예약 가능/4.추가인원은 연락주시면 안내도와드리고 있습니다./5.지나친 소음은 삼가해주세요',
            '/resources/space_sample_img/sample18.jpg',
            '이미지',
            '서울 강남구 테헤란로 146',
            '상세주소',
             1800,
             '위치',
             '010-1234-1234',
             8,
            6,
             6
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '공간19',
            '파티룸/세미나실/스터디룸',
            ' 고요한 강가의 코티지 휴식',
            '고요한 강가의 아름다운 풍경을 감상할 수 있는 강가 코티지, 자연 속에서의 여유를 만끽하세요.',
            '태그19',
            '시설안내19',
            '예약시 주의사항',
            '/resources/space_sample_img/sample19.jpg',
            '이미지',
            '서울 강남구 삼성로103길 12',
            '상세주소',
             1900,
             '위치',
             '010-1234-1234',
             9,
            6,
             10
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '공간20',
            '파티룸/카페/회의실/강의실',
            '심플 모던 도심 아파트의 생활 공간',
            '심플하고 모던한 인테리어가 돋보이는 도심 아파트, 편리한 생활과 함께하는 휴식 공간입니다.',
            '태그20',
            '시설안내20',
            '예약시 주의사항20',
            '/resources/space_sample_img/sample20.jpg',
            '이미지',
            '서울 강남구 선릉로 120',
            '상세주소',
             1200,
             '위치',
             '010-1234-1234',
             10,
             6,
             23
);

INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '공간21',
            '파티룸/카페/강의실',
            '산 속 평온한 산장 리트리트',
            '자연 속에서의 아름다운 경치를 감상할 수 있는 산장, 심플한 디자인과 함께하는 평온한 휴식을 즐기세요.',
            '태그21',
            '시설안내21',
            '예약시 주의사항21',
            '/resources/space_sample_img/sample21.jpg',
            '이미지',
            '서울 서초구 반포2동 15-2',
            '상세주소',
             1000,
             '위치',
             '010-1234-1234',
             5,
            7,
             0
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '빈티지 아파트',
            '파티룸/회의실/세미나실',
            '역사적 빈티지 아파트의 특별한 경험',
            '역사적인 건물 내에 위치한 고풍스러운 빈티지 아파트, 도심 속에서의 독특한 경험을 선사합니다.',
            '#태그22/#태그22/#태그22/#태그22',
            '시설안내22',
            '1.예약시 주의사항/2.최대 2시간까지예약가능합니다./3.연속된 시간만 예약 가능/4.추가인원은 연락주시면 안내도와드리고 있습니다./5.지나친 소음은 삼가해주세요',
            '/resources/space_sample_img/sample22.jpg',
            '이미지',
            '경기 안양시 동안구 시민대로 235',
            '상세주소',
             1500,
             '위치',
             '010-1234-1234',
             8,
            7,
             DEFAULT
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '전통 주택',
            '파티룸/회의실/스터디룸',
            '시골 전통 목조 주택의 아름다운 전망',
            '시골 마을의 아름다운 전망을 바라볼 수 있는 전통적인 목조 주택, 옛 감성을 느껴보세요.',
            '태그23',
            '시설안내23',
            '1.예약시 주의사항/2.최대 2시간까지예약가능합니다./3.연속된 시간만 예약 가능/4.추가인원은 연락주시면 안내도와드리고 있습니다./5.지나친 소음은 삼가해주세요',
            '/resources/space_sample_img/sample23.jpg',
            '이미지',
            '경기 안양시 동안구 동안로 80',
            '상세주소',
             2000,
             '위치',
             '010-1234-1234',
             10,
             8,
             DEFAULT
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '문화 예술 공간',
            '강의실/회의실/세미나실',
            '예술과 문화를 경험하고 창작하는 다목적 공간',
            '문화와 예술 활동을 지원하는 다목적 공간으로, 다양한 예술 행사와 전시를 개최합니다.',
            '#문화 #예술 #다목적',
            '1.전시장/2.미술용품 보관실/3. 이벤트 공간',
            '1.예약시 주의사항/2.최대 2시간까지예약가능합니다./3.연속된 시간만 예약 가능/4.추가인원은 연락주시면 안내도와드리고 있습니다./5.지나친 소음은 삼가해주세요',
            '/resources/space_sample_img/sample24.jpg',
            '이미지',
            '경기 안양시 만안구 안양천서로 177',
            '안양빌딩 3호',
             1000,
             '안약역 도보3분거리',
             '010-1234-5666',
             8,
             8,
             2
);

INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '창업 카페',
            '카페',
            '창업자들의 아이디어와 비즈니스 네트워킹을 지원하는 카페 ',
            '자연과 어우러진 평화로운 강가 캐빈, 강물 소리와 함께하는 힐링 타임을 경험해보세요.',
            '#창업 #네트워킹 #카페',
            '1.커피 머신/2.테이블/3.의자/4.네트워킹 코너',
            '1.예약시 주의사항/2.최대 2시간까지예약가능합니다./3.연속된 시간은 예약 불가/4.추가인원은 연락주시면 안내도와드리고 있습니다./5.지나친 소음은 삼가해주세요',
            '/resources/space_sample_img/sample26.jpg',
            '이미지',
            '경기 광명시 디지털로 56',
            '디지털 빌딩 23호',
             1000,
             '광명동',
             '010-1234-1234',
             6,
             9,
             2
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '사무 공간',
            '카페/스터디룸',
            '비즈니스 업무와 회의를 위한 전문적인 사무실 ',
            '업무 및 업무 모임을 위한 전문적인 사무 공간으로, 비즈니스 활동을 지원합니다.',
            '#사무 #업무 #모임 #비즈니스',
            '1.회의실/2.작업 공간/3.비즈니스 서비스',
            '1.예약시 주의사항/2.최대 2시간까지예약가능합니다./3.연속된 시간은 예약 불가/4.추가인원은 연락주시면 안내도와드리고 있습니다./5.지나친 소음은 삼가해주세요',
            '/resources/space_sample_img/work1.jpg',
            '이미지',
            '경기 광명시 너부대로35번길 20',
            '상세주소',
             1000,
             '위치',
             '010-1234-1234',
             7,
             9,
             15
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '코워킹 스페이스',
            '회의실/세미나실',
            '다양한 사업가들이 함께하는 협업과 네트워킹 공간 ',
            '다양한 사업가와 프리랜서들이 함께하는 공간으로, 협업과 네트워킹을 지원합니다.',
            '#코워킹 #협업 #네트워킹',
            '1.공용 책상과 의자/2.커뮤니티 공간/3.네트워킹 이벤트',
            '1.예약시 주의사항/2.최대 2시간까지예약가능합니다./3.연속된 시간만 예약 가능/4.추가인원은 연락주시면 안내도와드리고 있습니다./5.지나친 소음은 삼가해주세요',
            '/resources/space_sample_img/sample28.jpg',
            '이미지',
            '경기 광명시 광명동 263-42',
            '광명아울렛 12층',
             1800,
             '광명역 도보 1분거리',
             '010-1234-1234',
             8,
            9,
             6
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '스파클 파티룸',
            '파티룸/',
            '파티와 이벤트를 위한 화려한 공간',
            '파티와 이벤트에 최적화된 공간으로, 즐거운 분위기와 편의시설이 갖춰져 있습니다.',
            '#파티 #이벤트',
            '1음향 시스템/2.조명 설비/3.의자와 테이블 제공',
            '파티룸 예약 시 최대 수용인원을 확인해주세요.',
            '/resources/space_sample_img/sample1.jpg',
            '이미지',
            '서울 강남구 언주로71길 9',
            '언주빌딩 1032호',
             1000,
             '언주역 도보 10분거리',
             '010-1234-1234',
             5,
             2,
             0
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '유아 교육 공간',
            '스터디룸',
            '어린이들의 교육과 놀이를 위한 안전하고 유익한 공 ',
            '어린이들의 교육과 놀이를 위한 특별한 공간으로, 안전하고 유익한 활동을 제공합니다.',
            '#유아 #교육 #놀이 #안전',
            ' 1.도서관/2.독서 코너/3.문학 행사 공간',
            '1.예약시 주의사항/2.최대 2시간까지예약가능합니다./3.연속된 시간만 예약 가능/4.추가인원은 연락주시면 안내도와드리고 있습니다./5.지나친 소음은 삼가해주세요',
            '/resources/space_sample_img/kid.jpg',
            '이미지',
            '경기 광명시 광명로812번길 16',
            '광명빌딩 12-3',
             1900,
             '광명역 도보 13분거리',
             '010-1234-1234',
             9,
             9,
             10
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '자연 친화 코너',
            '파티룸',
            '자연 속에서 힐링하고 휴식하는 친환경 공간 ',
            '자연과 조화를 이루는 휴식과 활동을 즐기는 친환경 공간입니다.',
            '#자연 #친환경 #휴식',
            '1.실내 정원/2.휴식 공간/3.친환경 소품',
            '1.예약시 주의사항/2.최대 2시간까지예약가능합니다./3.연속된 시간만 예약 가능/4.추가인원은 연락주시면 안내도와드리고 있습니다./5.지나친 소음은 삼가해주세요',
            '/resources/space_sample_img/nature1.jpg',
            '이미지',
            '경기 광명시 시청로 20 광명시청',
            '광명시청 2층',
             2500,
             '광명역 전철역 도보 3분',
             '010-1234-1234',
             10,
            8,
             11
);
INSERT INTO SPACE
        (SPACE_NO,
         SPACE_NAME,
         SPACE_KIND,
         SPACE_ONE_INTRODUCE,
         SPACE_INTRODUCE,
         SPACE_TAG,
         SPACE_INFORMATION,  
         SPACE_CAUTION,
         SPACE_MIMG,
         SPACE_IMG,
         SPACE_ADDRESS,
         SPACE_DETAIL_ADDRESS,
         SPACE_PRICE,
         SPACE_LOCATION,
         SPACE_TEL,
         SPACE_CAPACITY,
         USER_NO,
         SPACE_COUNT
         )
        VALUES
        (SEQ_SNO.NEXTVAL,
            '문학 카페',
            '파티룸/카페/회의실/강의실',
            '책과 문학을 즐기며 독서와 문학 행사에 참여하는 공간',
            '문학과 책을 즐기는 공간으로, 독서와 토론을 위한 분위기가 조성돼 있습니다.',
            '#문학 #카페 #독서',
            '1.도서관/2.독서 코너/3.문학 행사 공간',
            '1.예약시 주의사항/2.최대 2시간까지예약가능합니다./3.연속된 시간만 예약 가능/4.추가인원은 연락주시면 안내도와드리고 있습니다./5.지나친 소음은 삼가해주세요',
            '/resources/space_sample_img/img-liter1.jpg',
            '이미지',
            '서울 서초구 서초중앙로 156',
            '서초빌딩 1232호',
             1200,
             '서초구 2번출구 도보 3분거리 ',
             '010-1234-1234',
             10,
             10,
             23
);
commit;
--- RESERVATION 테이블-----------------

CREATE TABLE RESERVATION(
    RESERVATION_NO NUMBER PRIMARY KEY,
    HEADCOUNT  NUMBER,
    TOTAL_PRICE NUMBER DEFAULT 0 NOT NULL,
    USER_NO NUMBER,
    SPACE_NO NUMBER,
    CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
    
    FOREIGN KEY ( USER_NO) REFERENCES MEMBER( USER_NO) ON DELETE CASCADE,
    FOREIGN KEY (SPACE_NO) REFERENCES SPACE(SPACE_NO) ON DELETE CASCADE

);
CREATE SEQUENCE SEQ_RNO
NOCACHE;

INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,3,2000,SEQ_UNO.CURRVAL,SEQ_SNO.CURRVAL,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,3,2000,SEQ_UNO.CURRVAL,SEQ_SNO.CURRVAL,DEFAULT);

INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,3,2000,SEQ_UNO.CURRVAL,SEQ_SNO.CURRVAL,DEFAULT);

INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,3,8000,10,9,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,5,15000,9,9,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,4,7000,12,9,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,6,9000,11,5,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,2,4000,6,5,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,2,6000,6,4,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,2,7000,6,1,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,3,5000,3,8,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,5,2000,2,4,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,4,8000,2,8,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,6,10000,2,7,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,4,12000,5,1,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,5,7000,8,7,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,4,8000,7,2,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,1,4000,7,2,DEFAULT);

INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,5,7000,3,2,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,4,8000,3,6,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,6,12000,2,1,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,4,8000,5,5,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,5,5000,8,8,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,4,4000,7,6,DEFAULT);
INSERT INTO RESERVATION VALUES(SEQ_RNO.NEXTVAL,1,2000,7,8,DEFAULT);


SELECT *fROM RESERVATION;


---- 예약 날짜 관련---
CREATE TABLE RESERVATION_DATE(
    DATE_NO NUMBER PRIMARY KEY,
    RESERVATION_DATE DATE DEFAULT SYSDATE NOT NULL ,
    RESERVATION_TIME1 NUMBER DEFAULT 0 NOT NULL ,
    RESERVATION_TIME2 NUMBER DEFAULT 0 NOT NULL,
    RESERVATION_NO NUMBER UNIQUE,
    
    FOREIGN KEY (RESERVATION_NO) REFERENCES RESERVATION(RESERVATION_NO)
    ON DELETE CASCADE
    
);
CREATE SEQUENCE SEQ_RDNO
NOCACHE;
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,13,14,SEQ_RNO.CURRVAL);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,10,11,24);

INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,8,9,23);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,16,17,22);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,14,15,21);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,11,12,20);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,9,10,19);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,10,11,18);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,18,19,17);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,20,21,16);

INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,10,11,15);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,13,14,14);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,14,15,13);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,20,21,12);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,16,17,11);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,17,18,10);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,18,19,9);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,16,17,8);

INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,9,10,7);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,10,11,6);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,11,12,5);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,12,13,4);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,13,14,3);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,14,15,2);
INSERT INTO RESERVATION_DATE VALUES(SEQ_RDNO.NEXTVAL,DEFAULT,15,16,1);

--  GUESTCOMMENT--

CREATE TABLE GUESTCOMMENT(
    COMMENT_NO NUMBER PRIMARY KEY,
    CONTENT VARCHAR(100) NOT NULL,
    INSERT_DATE DATE DEFAULT SYSDATE NOT NULL,
    
    SPACE_NO NUMBER ,
    USER_NO NUMBER,
    
    FOREIGN KEY ( USER_NO) REFERENCES MEMBER( USER_NO) ON DELETE CASCADE,
    FOREIGN KEY (SPACE_NO) REFERENCES SPACE(SPACE_NO) ON DELETE CASCADE

);
CREATE SEQUENCE SEQ_GCNO
NOCACHE;
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,1,1); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,1,3 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,1,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,1,6 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,1,7 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,2,1 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,2,3 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,2,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,2,6); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,2,7 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,3,1); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,3,3 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,3,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,3,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,4,7 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,4,8 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,4,9 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,4,10); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,4,11 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,5,1 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,5,3 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,5,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,5,7 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,5,10 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,5,11 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,6,1 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,6,2 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,6,3 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,6,4 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,7,5); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,7,6 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,7,7 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,7,8 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,7,9 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,7,1 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,8,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,8,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,8,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,8,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,8,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,9,7 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,9,7 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,9,7 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,9,7 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,10,8 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,10,8 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,10,8); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,10,8); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,10,8); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,11,9); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,11,9); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,11,9); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,11,9); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,12,3); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,12,3); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,12,3); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,12,3); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,12,3); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,13,3); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,13,3);
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,13,3); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,13,3); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,13,3); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,14,3); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,14,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,14,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,14,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,15,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,15,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,15,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,15,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,15,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,16,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,16,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,16,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,16,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,16,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,16,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,16,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,16,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,16,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,16,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,16,2 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,17,2 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,17,2 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,17,2 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,18,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,18,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,18,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,18,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,18,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,19,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,19,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,20,2 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,20,2 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,21,2 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,21,2 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,21,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,22,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,23,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,24,5 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,25,6 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,27,6 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,27,6 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,27,6 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,28,7 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,28,7 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,28,7 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,28,8 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,29,8 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,29,8 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,29,8 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,29,9 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,29,9 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,29,9 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,29,8 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,28,7 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,28,7 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,28,7 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,27,8 ); 
INSERT INTO GUESTCOMMENT VALUES(SEQ_GCNO.NEXTVAL,'Q AND A 질문입니다.',DEFAULT,27,8 ); 


SELECT *fROM GUESTCOMMENT;


CREATE TABLE HOSTCOMMENT(
    HOSTCOMMENT_NO NUMBER PRIMARY KEY,
    CONTENT VARCHAR(100) NOT NULL,
    COMMENT_NO NUMBER UNIQUE,
    
    FOREIGN KEY (COMMENT_NO) REFERENCES  GUESTCOMMENT(COMMENT_NO) ON DELETE CASCADE
    
);
CREATE SEQUENCE SEQ_HCNO
NOCACHE;
--ALTER TABLE HOSTCOMMENT MODIFY CONTENT VARCHAR(100) DEFAULT '';


INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',115 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',113 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',112 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',110 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',109 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',108 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',107 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',106 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',105);
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',104 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',103 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',102 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',101 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',99 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',98 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',97 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',96 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',95 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',94 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',93 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',92 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',91 );
INSERT INTO HOSTCOMMENT VALUES(SEQ_HCNO.NEXTVAL,'HOSTCOMMENT입니다.',90 );



CREATE TABLE SPACE_OPTION(
    SPACE_OPTION_NO NUMBER PRIMARY KEY,
    SPACE_OPTION_NAME VARCHAR2(20) NOT NULL,
    SPACE_NO NUMBER NOT NULL,
    
    FOREIGN KEY (SPACE_NO) REFERENCES SPACE(SPACE_NO) ON DELETE CASCADE
);

CREATE SEQUENCE SEQ_SONO
NOCACHE;

INSERT INTO SPACE_OPTION VALUES(SEQ_SONO.NEXTVAL, 'COMPUTER', 1);
INSERT INTO SPACE_OPTION VALUES(SEQ_SONO.NEXTVAL, 'TV', 1); 
INSERT INTO SPACE_OPTION VALUES(SEQ_SONO.NEXTVAL, 'COFEPORT', 1); 

CREATE TABLE SPACE_CATEGORY(
    SPACE_CATEGORY_NUM NUMBER PRIMARY KEY,
    SPACE_CATEGORY_NAME VARCHAR2(20) NOT NULL,
    SPACE_NO NUMBER NOT NULL,
    
    FOREIGN KEY (SPACE_NO) REFERENCES SPACE(SPACE_NO) ON DELETE CASCADE
);

CREATE SEQUENCE SEQ_SCNO
NOCACHE;

INSERT INTO SPACE_CATEGORY VALUES(SEQ_SCNO.NEXTVAL, 'PARTY_ROOM', SEQ_SNO.CURRVAL);
INSERT INTO SPACE_CATEGORY VALUES(SEQ_SCNO.NEXTVAL, 'CAFE', SEQ_SNO.CURRVAL); 
INSERT INTO SPACE_CATEGORY VALUES(SEQ_SCNO.NEXTVAL, 'LECTURE', SEQ_SNO.CURRVAL);
INSERT INTO SPACE_CATEGORY VALUES(SEQ_SCNO.NEXTVAL, 'MEETING', SEQ_SNO.CURRVAL);
INSERT INTO SPACE_CATEGORY VALUES(SEQ_SCNO.NEXTVAL, 'SEMINAR', SEQ_SNO.CURRVAL);

CREATE TABLE PICKED(
    PICKED_NUM NUMBER PRIMARY KEY,
    PICKED_DATE DATE DEFAULT SYSDATE,
    USER_NO NUMBER NOT NULL,
    SPACE_NO NUMBER NOT NULL,
    
    FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE,
    FOREIGN KEY (SPACE_NO) REFERENCES SPACE(SPACE_NO) ON DELETE CASCADE
);

CREATE SEQUENCE SEQ_PNO
NOCACHE;

INSERT INTO PICKED VALUES(SEQ_PNO.NEXTVAL, DEFAULT, SEQ_UNO.CURRVAL, SEQ_SNO.CURRVAL);

CREATE TABLE NOTICE(
    NOTICE_NO NUMBER PRIMARY KEY,
    NOTICE_TITLE VARCHAR2(100) NOT NULL,
    NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
    NOTICE_WRITER NUMBER NOT NULL,
    COUNT NUMBER DEFAULT 0 NOT NULL,
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR(3) DEFAULT 'Y' CHECK(STATUS IN ('Y', 'N')),
    IMG VARCHAR2(2000), 
 
    FOREIGN KEY (NOTICE_WRITER) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE
);

CREATE SEQUENCE SEQ_NNO
NOCACHE;

INSERT INTO NOTICE VALUES(SEQ_NNO.NEXTVAL, '첫번째 공지사항입니다!', '첫번째 공지사항 내용', 1, DEFAULT, DEFAULT, DEFAULT, NULL);
INSERT INTO NOTICE VALUES(SEQ_NNO.NEXTVAL, '두번째 공지사항입니다!', '두번째 공지사항 내용', 1, DEFAULT, DEFAULT, DEFAULT, NULL);
INSERT INTO NOTICE VALUES(SEQ_NNO.NEXTVAL, '세번째 공지사항입니다!', '세번째 공지사항 내용', 1, DEFAULT, DEFAULT, DEFAULT, NULL);

CREATE TABLE BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_TITLE VARCHAR2(100) NOT NULL,
    BOARD_CONTENT VARCHAR2(4000) NOT NULL,
    BOARD_WRITER NUMBER NOT NULL,
    COUNT NUMBER DEFAULT 0 NOT NULL,
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR(3) DEFAULT 'Y' CHECK(STATUS IN ('Y', 'N')),
    IMG VARCHAR2(2000), 
    
    FOREIGN KEY (BOARD_WRITER) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE
);

CREATE SEQUENCE SEQ_BNO
NOCACHE;

INSERT INTO BOARD VALUES(SEQ_BNO.NEXTVAL, '첫번째 게시판입니다!', '첫번째 게시판 내용', SEQ_UNO.CURRVAL, DEFAULT, DEFAULT, DEFAULT, NULL);
INSERT INTO BOARD VALUES(SEQ_BNO.NEXTVAL, '두번째 게시판입니다!', '두번째 게시판 내용', SEQ_UNO.CURRVAL, DEFAULT, DEFAULT, DEFAULT, NULL);
INSERT INTO BOARD VALUES(SEQ_BNO.NEXTVAL, '세번째 게시판입니다!', '세번째 게시판 내용', SEQ_UNO.CURRVAL, DEFAULT, DEFAULT, DEFAULT, NULL);

CREATE TABLE NOTICE_REPLY(
    REPLY_NO NUMBER PRIMARY KEY,
    REPLY_CONTENT VARCHAR2(1000) NOT NULL,
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR(3) DEFAULT 'Y' CHECK(STATUS IN ('Y', 'N')),
    REF_NNO NUMBER NOT NULL,
    REPLY_WRITER NUMBER NOT NULL,
    
    FOREIGN KEY (REF_NNO) REFERENCES NOTICE(NOTICE_NO) ON DELETE CASCADE,
    FOREIGN KEY (REPLY_WRITER) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE
);

CREATE SEQUENCE SEQ_NRNO
NOCACHE;

INSERT INTO NOTICE_REPLY VALUES(SEQ_NRNO.NEXTVAL, '공지사항 더미댓글입니다.(1)', DEFAULT, DEFAULT, SEQ_NNO.CURRVAL, SEQ_UNO.CURRVAL);
INSERT INTO NOTICE_REPLY VALUES(SEQ_NRNO.NEXTVAL, '공지사항 더미댓글입니다.(2)', DEFAULT, DEFAULT, SEQ_NNO.CURRVAL, SEQ_UNO.CURRVAL);
INSERT INTO NOTICE_REPLY VALUES(SEQ_NRNO.NEXTVAL, '공지사항 더미댓글입니다.(3)', DEFAULT, DEFAULT, SEQ_NNO.CURRVAL, SEQ_UNO.CURRVAL);

CREATE TABLE BOARD_REPLY(
    REPLY_NO NUMBER PRIMARY KEY,
    REPLY_CONTENT VARCHAR2(1000) NOT NULL,
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR(3) DEFAULT 'Y' CHECK(STATUS IN ('Y', 'N')),
    REF_BNO NUMBER NOT NULL,
    REPLY_WRITER NUMBER NOT NULL,
    
    FOREIGN KEY (REF_BNO) REFERENCES BOARD(BOARD_NO) ON DELETE CASCADE,
    FOREIGN KEY (REPLY_WRITER) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE
);

CREATE SEQUENCE SEQ_BRNO
NOCACHE;

INSERT INTO BOARD_REPLY VALUES(SEQ_BRNO.NEXTVAL, '게시판 더미댓글입니다.(1)', DEFAULT, DEFAULT, SEQ_BNO.CURRVAL, SEQ_UNO.CURRVAL);
INSERT INTO BOARD_REPLY VALUES(SEQ_BRNO.NEXTVAL, '게시판 더미댓글입니다.(2)', DEFAULT, DEFAULT, SEQ_BNO.CURRVAL, SEQ_UNO.CURRVAL);
INSERT INTO BOARD_REPLY VALUES(SEQ_BRNO.NEXTVAL, '게시판 더미댓글입니다.(3)', DEFAULT, DEFAULT, SEQ_BNO.CURRVAL, SEQ_UNO.CURRVAL);



CREATE TABLE ATTACHMENT(
    FILE_NO NUMBER PRIMARY KEY,
    REF_SNO NUMBER NOT NULL,
    ORIGIN_NAME VARCHAR2(255) NOT NULL,
    CHANGE_NAME VARCHAR2(255) NOT NULL,
    FILE_PATH VARCHAR2(1000),
    UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
    FILE_LEVEL NUMBER,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    FOREIGN KEY (REF_SNO) REFERENCES SPACE(SPACE_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN ATTACHMENT.FILE_NO IS '파일번호';
COMMENT ON COLUMN ATTACHMENT.REF_SNO IS '참조스페이스번호';
COMMENT ON COLUMN ATTACHMENT.ORIGIN_NAME IS '파일원본명';
COMMENT ON COLUMN ATTACHMENT.CHANGE_NAME IS '파일수정명';
COMMENT ON COLUMN ATTACHMENT.FILE_PATH IS '저장폴더경로';
COMMENT ON COLUMN ATTACHMENT.UPLOAD_DATE IS '업로드일';
COMMENT ON COLUMN ATTACHMENT.FILE_LEVEL IS '파일레벨(1/2)';

CREATE SEQUENCE SEQ_ATNO
NOCACHE;




INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        1,
        '이름',
        'sample1.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        2,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        1,
        '이름',
        'sample2.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        3,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        1,
        '이름',
        'sample3.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        4,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        1,
        '이름',
        'sample4.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        5,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        2,
        '이름',
        'sample5.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        6,
        'Y'
     );
     
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        2,
        '이름',
        'sample1.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        2,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        2,
        '이름',
        'sample2.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        3,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        2,
        '이름',
        'sample3.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        4,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        2,
        '이름',
        'sample4.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        5,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        2,
        '이름',
        'sample5.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        6,
        'Y'
     );
    
INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        3,
        '이름',
        'sample1.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        2,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        3,
        '이름',
        'sample2.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        3,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        3,
        '이름',
        'sample3.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        4,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        3,
        '이름',
        'sample4.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        5,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        3,
        '이름',
        'sample5.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        6,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        4,
        '이름',
        'sample1.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        2,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        4,
        '이름',
        'sample2.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        3,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        4,
        '이름',
        'sample3.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        4,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        4,
        '이름',
        'sample4.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        5,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        4,
        '이름',
        'sample5.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        6,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        5,
        '이름',
        'sample1.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        2,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        5,
        '이름',
        'sample2.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        3,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        5,
        '이름',
        'sample3.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        4,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        5,
        '이름',
        'sample4.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        5,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        5,
        '이름',
        'sample5.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        6,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        6,
        '이름',
        'sample1.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        2,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        6,
        '이름',
        'sample2.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        3,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
       6,
        '이름',
        'sample3.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        4,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        6,
        '이름',
        'sample4.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        5,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        6,
        '이름',
        'sample5.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        6,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        7,
        '이름',
        'sample1.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        2,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        7,
        '이름',
        'sample2.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        3,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        7,
        '이름',
        'sample3.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        4,
        'Y'
     );
     INSERT INTO ATTACHMENT(
    FILE_NO,
    REF_SNO,
    ORIGIN_NAME,
    CHANGE_NAME,
    FILE_PATH,
    UPLOAD_DATE,
    FILE_LEVEL,
    STATUS)
    VALUES(
        SEQ_ATNO.NEXTVAL,
        7,
        '이름',
        'sample4.jpg',
        '/resources/space_sample_img/',
        SYSDATE,
        5,
        'Y'
     );
     INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,7,'이름', 'sample5.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,8,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,8,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,8,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,8,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,8,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,9,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,9,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,9,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,9,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,9,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,10,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,10,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,10,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,10,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,10,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,11,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,11,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,11,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,11,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,11,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,12,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,12,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,12,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,12,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,12,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 13,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 13,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 13,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 13,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 13,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 14,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 14,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,14,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,14,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL,14,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 15,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 15,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 15,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 15,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 15,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 16,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 16,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 16,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 16,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 16,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 17,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 17,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 17,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 17,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 17,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 18,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 18,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 18,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 18,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 18,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 19,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 19,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 19,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 19,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 19,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 20,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 20,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 20,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 20,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 20,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 21,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 21,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 21,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 21,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 21,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 22,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 22,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 22,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 22,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 22,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 23,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 23,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 23,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 23,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 23,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 24,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 24,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 24,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 24,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 24,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 25,'이름', 'work2.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 25,'이름', 'work3.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 25,'이름', 'work4.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 25,'이름', 'work2.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 25,'이름', 'work3.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');

    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 26,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 26,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 26,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 26,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 26,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 27,'이름', 'sample8.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 27,'이름', 'sample9.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 27,'이름', 'sample11.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 27,'이름', 'sample13.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 27,'이름', 'sample15.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 28,'이름', 'kid2.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 28,'이름', 'kid3.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 28,'이름', 'kid4.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 28,'이름', 'kid5.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 28,'이름', 'kid2.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
 

    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 29,'이름', 'nature1.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 29,'이름', 'nature2.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 29,'이름', 'nature3.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 29,'이름', 'nature4.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 29,'이름', 'nature5.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');


    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 30,'이름', 'img-liter1.jpg','/resources/space_sample_img/', SYSDATE, 2, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 30,'이름', 'img-liter2.jpg','/resources/space_sample_img/', SYSDATE, 3, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 30,'이름', 'img-liter3.jpg','/resources/space_sample_img/', SYSDATE, 4, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 30,'이름', 'img-liter4.jpg','/resources/space_sample_img/', SYSDATE, 5, 'Y');
    INSERT INTO ATTACHMENT(FILE_NO,REF_SNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS)
    VALUES(SEQ_ATNO.NEXTVAL, 30,'이름', 'img-liter5.jpg','/resources/space_sample_img/', SYSDATE, 6, 'Y');
    
    
    
    
    

CREATE TABLE REVIEW (
 REVIEW_NO NUMBER PRIMARY KEY,
 CONTENT VARCHAR(100) NOT NULL,
 INSERT_DATE DATE DEFAULT SYSDATE NOT NULL,
 REVIEW_STAR NUMBER  DEFAULT 1 NOT NULL,
 SPACE_NO NUMBER,
 USER_NO NUMBER,
 
 FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE,
 FOREIGN KEY (SPACE_NO) REFERENCES SPACE(SPACE_NO) ON DELETE CASCADE

);

CREATE SEQUENCE SEQ_RVNO
NOCACHE;

SELECT *FROM REVIEW;


INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'좋아요~~',DEFAULT,4,29,3);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'괜찮습니다~~',DEFAULT,3,28,3);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'굿~~',DEFAULT,4,27,3);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'만족합니다~~',DEFAULT,5,29,2);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'만족합니다~~',DEFAULT,5,29,2);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'만족합니다~~',DEFAULT,2,29,2);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'좋아요~~',DEFAULT,4,28,3);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'괜찮습니다~~',DEFAULT,3,28,3);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'굿~~',DEFAULT,4,28,3);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'만족합니다~~',DEFAULT,5,28,2);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'만족합니다~~',DEFAULT,5,27,2);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'만족합니다~~',DEFAULT,2,26,2);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'좋아요~~',DEFAULT,4,29,3);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'괜찮습니다~~',DEFAULT,3,28,3);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'굿~~',DEFAULT,4,27,3);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'만족합니다~~',DEFAULT,5,27,2);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'만족합니다~~',DEFAULT,5,26,2);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'만족합니다~~',DEFAULT,2,25,2);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'좋아요~~',DEFAULT,4,28,3);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'괜찮습니다~~',DEFAULT,3,28,3);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'굿~~',DEFAULT,4,27,3);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'만족합니다~~',DEFAULT,5,26,2);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'만족합니다~~',DEFAULT,5,26,2);
INSERT INTO REVIEW VALUES(SEQ_RVNO.NEXTVAL,'만족합니다~~',DEFAULT,2,26,2);

CREATE TABLE NOTICEATTACHMENT (
    FILE_NO NUMBER PRIMARY KEY,
    REF_NNO NUMBER NOT NULL,
    ORIGIN_NAME VARCHAR2(255) NOT NULL,
    CHANGE_NAME VARCHAR2(255) NOT NULL,
    FILE_PATH VARCHAR2(1000),
    UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
    FILE_LEVEL NUMBER,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    
    FOREIGN KEY (REF_NNO) REFERENCES NOTICE(NOTICE_NO)
);

COMMENT ON COLUMN NOTICEATTACHMENT.FILE_NO IS '파일번호';
COMMENT ON COLUMN NOTICEATTACHMENT.REF_NNO IS '참조공지사항번호';
COMMENT ON COLUMN NOTICEATTACHMENT.ORIGIN_NAME IS '파일원본명';
COMMENT ON COLUMN NOTICEATTACHMENT.CHANGE_NAME IS '파일수정명';
COMMENT ON COLUMN NOTICEATTACHMENT.FILE_PATH IS '저장폴더경로';
COMMENT ON COLUMN NOTICEATTACHMENT.UPLOAD_DATE IS '업로드일';
COMMENT ON COLUMN NOTICEATTACHMENT.FILE_LEVEL IS '파일레벨(1/2)';

CREATE SEQUENCE SEQ_NATNO
NOCACHE;

--INSERT INTO NOTICEATTACHMENT(
--    FILE_NO,
--    REF_NNO,
--    ORIGIN_NAME,
--    CHANGE_NAME,
--    FILE_PATH,
--    UPLOAD_DATE,
--    FILE_LEVEL,
--    STATUS)
--    VALUES(
--        SEQ_NATNO.NEXTVAL,
--        1,
--        '이름',
--        '변경이름',
--        '/resources/notice_sample_img/maxresdefault.jpg',
--        SYSDATE,
--        DEFAULT,
--        'Y'
--     );



CREATE TABLE BOARDATTACHMENT (
    FILE_NO NUMBER PRIMARY KEY,
    REF_BNO NUMBER NOT NULL,
    ORIGIN_NAME VARCHAR2(255) NOT NULL,
    CHANGE_NAME VARCHAR2(255) NOT NULL,
    FILE_PATH VARCHAR2(1000),
    UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
    FILE_LEVEL NUMBER,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    
    FOREIGN KEY (REF_BNO) REFERENCES BOARD(BOARD_NO)
);

COMMENT ON COLUMN BOARDATTACHMENT.FILE_NO IS '파일번호';
COMMENT ON COLUMN BOARDATTACHMENT.REF_BNO IS '참조일반게시판번호';
COMMENT ON COLUMN BOARDATTACHMENT.ORIGIN_NAME IS '파일원본명';
COMMENT ON COLUMN BOARDATTACHMENT.CHANGE_NAME IS '파일수정명';
COMMENT ON COLUMN BOARDATTACHMENT.FILE_PATH IS '저장폴더경로';
COMMENT ON COLUMN BOARDATTACHMENT.UPLOAD_DATE IS '업로드일';
COMMENT ON COLUMN BOARDATTACHMENT.FILE_LEVEL IS '파일레벨(1/2)';

CREATE SEQUENCE SEQ_BATNO
NOCACHE;

--INSERT INTO BOARDATTACHMENT(
--    FILE_NO,
--    REF_BNO,
--    ORIGIN_NAME,
--    CHANGE_NAME,
--    FILE_PATH,
--    UPLOAD_DATE,
--    FILE_LEVEL,
--    STATUS)
--    VALUES(
--        SEQ_BATNO.NEXTVAL,
--        2,
--        '이름',
--        '변경이름',
--        '/resources/board_sample_img/maxresdefault.jpg',
--        SYSDATE,
--        DEFAULT,
--        'Y'
--     );
commit;