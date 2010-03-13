/*==============================================================*/
/* DBMS name:      KingbaseES 6                                 */
/* Created on:     2009-9-17 16:41:54                           */
/*==============================================================*/


DROP INDEX FK__TB_BCSTSD33;

DROP INDEX FK__TB_BCSTSD__;

DROP TABLE TB_BCSTSDST;

DROP INDEX FK__TB_BLBADSC_;

DROP TABLE TB_BLBADSC;

DROP INDEX FK__TB_BRDMDSC_;

DROP TABLE TB_BRDMDSC;

DROP INDEX FK__TB_BSWPLPDS;

DROP TABLE TB_BSWPLPDS;

DROP INDEX FK__TB_BSWRDSC_;

DROP TABLE TB_BSWRDSC;

DROP INDEX FK__TB_BURDSC__;

DROP TABLE TB_BURDSC;

DROP INDEX FK__TB_CLPJPRWR;

DROP TABLE TB_CLPJPRWR;

DROP INDEX FK__TB_CLPJSCDN;

DROP TABLE TB_CLPJSCDN;

DROP TABLE TB_CNT;

DROP INDEX FK__TB_COWAPJ__;

DROP TABLE TB_COWAPJ;

DROP INDEX FK__TB_CRDSC__3;

DROP TABLE TB_CRDSC;

DROP INDEX FK__TB_CVDSC__3;

DROP TABLE TB_CVDSC;

DROP INDEX FK__TB_DKDNCS31;

DROP TABLE TB_DKDNCSTA1;

DROP INDEX FK__TB_DKDNCS__;

DROP TABLE TB_DKDNCSTA2;

DROP INDEX FK__TB_DKR__PJN;

DROP TABLE TB_DKR;

DROP INDEX FK__TB_DKSN4887;

DROP TABLE TB_DKSNWS;

DROP INDEX FK__TB_EDDWRDSC;

DROP TABLE TB_EDDWRDSC;

DROP TABLE TB_FPACTI;

DROP INDEX FK__TB_FPACTI_8;

DROP TABLE TB_FPACTI_M;

DROP TABLE TB_FXJB;

DROP INDEX FK__TB_FXJB_M_5;

DROP TABLE TB_FXJB_M;

DROP TABLE TB_GCLB;

DROP INDEX FK__TB_GTWRDSC_;

DROP TABLE TB_GTWRDSC;

DROP INDEX FK__TB_HBWRDSC_;

DROP TABLE TB_HBWRDSC;

DROP INDEX FK__TB_HOMLFDSC;

DROP TABLE TB_HOMLFDSC;

DROP TABLE TB_HS;

DROP TABLE TB_HS_M;

DROP TABLE TB_HYWDMS;

DROP TABLE TB_JZWFL;

DROP INDEX FK__TB_LKDSC__2;

DROP TABLE TB_LKDSC;

DROP TABLE TB_LYSX;

DROP TABLE TB_LYSX1;

DROP INDEX FK__TB_OVFLDSC_;

DROP TABLE TB_OVFLDSC;

DROP INDEX FK__TB_OVTUDSC_;

DROP TABLE TB_OVTUDSC;

DROP TABLE TB_PICKREC;

DROP INDEX FK__TB_PITDSC__;

DROP TABLE TB_PITDSC;

DROP INDEX FK__TB_PJ__CNTC;

DROP TABLE TB_PJ;

DROP INDEX FK__TB_PJRCN__P;

DROP INDEX FK__TB_PJRCN__G;

DROP TABLE TB_PJRCN;

DROP INDEX FK__TB_PJR_M__P;

DROP TABLE TB_PJR_M;

DROP INDEX FK__TB_PLUDSC__;

DROP TABLE TB_PLUDSC;

DROP INDEX FK__TB_PPDSC__3;

DROP TABLE TB_PPDSC;

DROP TABLE TB_QT;

DROP INDEX FK__TB_QT_M__RP;

DROP TABLE TB_QT_M;

DROP INDEX FK__TB_RDEST1__;

DROP TABLE TB_RDEST1;

DROP INDEX FK__TB_RDEST489;

DROP TABLE TB_RDEST2;

DROP INDEX FK__TB_RSR__PJN;

DROP TABLE TB_RSR;

DROP TABLE TB_SD;

DROP INDEX FK__TB_SD_M__12;

DROP TABLE TB_SD_M;

DROP TABLE TB_SEQUENCE;

DROP INDEX FK__TB_SLDSC__3;

DROP TABLE TB_SLDSC;

DROP INDEX FK__TB_SLIDSC__;

DROP TABLE TB_SLIDSC;

DROP INDEX FK__TB_SLUDSC__;

DROP TABLE TB_SLUDSC;

DROP INDEX FK__TB_SPDSC__4;

DROP TABLE TB_SPDSC;

DROP INDEX FK__TB_ST__PJNO;

DROP TABLE TB_ST;

DROP INDEX FK__TB_STDNC__X;

DROP INDEX FK__TB_STDNC__2;

DROP TABLE TB_STDNC;

DROP INDEX FK__TB_24927208;

DROP TABLE TB_STDNC_M;

DROP INDEX FK__TB_STOFLER_;

DROP TABLE TB_STOFLER;

DROP INDEX FK__TB_STREXDSC;

DROP TABLE TB_STREXDSC;

DROP INDEX FK__TB_UNDSC__3;

DROP TABLE TB_UNDSC;

DROP TABLE TB_USER;

DROP TABLE TB_VP;

DROP INDEX FK__TB_WDMPJ286;

DROP TABLE TB_WDMPJRHS;

DROP INDEX FK__TB_WDMPJS__;

DROP TABLE TB_WDMPJS;

DROP INDEX FK__TB_WDMPJ532;

DROP TABLE TB_WDMPJS1;

DROP INDEX FK__TB_WDMPJS_2;

DROP TABLE TB_WDMPJS2;

DROP INDEX FK__TB_WLR__PJN;

DROP TABLE TB_WLR;

DROP TABLE TB_WT;

DROP TABLE TB_XQFL;

DROP TABLE V_HOME;

/*==============================================================*/
/* Table: TB_BCSTSDST                                           */
/*==============================================================*/
CREATE TABLE TB_BCSTSDST (
RPJINCD              INT                  NOT NULL,
CNTCD                CHAR(6),
TB__CNTCD            CHAR(6),
STADT                DATE,
STAPTE               DATE,
FLNO                 INT,
BCNM                 CHAR(40),
SDTW                 INT,
SBMVLL               INT,
CLLRM                INT,
SBMBCAR              INT,
SBMPLOAR             INT,
CRSOPPL              INT,
DTHPPL               INT,
ARSOPPL              INT,
MVARRPPL             INT,
LCARRPPL             INT
);

COMMENT ON TABLE TB_BCSTSDST IS
'�ƺ�̲�������ͺ�������ͳ�Ʊ�';

COMMENT ON COLUMN TB_BCSTSDST.RPJINCD IS
'RPJINCD';

COMMENT ON COLUMN TB_BCSTSDST.CNTCD IS
'������������';

COMMENT ON COLUMN TB_BCSTSDST.TB__CNTCD IS
'������_������������';

COMMENT ON COLUMN TB_BCSTSDST.STADT IS
'ͳ������';

COMMENT ON COLUMN TB_BCSTSDST.STAPTE IS
'ͳ��ʱ��ֹ';

COMMENT ON COLUMN TB_BCSTSDST.FLNO IS
'��ˮ���';

COMMENT ON COLUMN TB_BCSTSDST.BCNM IS
'̲������';

COMMENT ON COLUMN TB_BCSTSDST.SDTW IS
'������';

COMMENT ON COLUMN TB_BCSTSDST.SBMVLL IS
'��ˮ��ˮΧ��ׯ';

COMMENT ON COLUMN TB_BCSTSDST.CLLRM IS
'��������';

COMMENT ON COLUMN TB_BCSTSDST.SBMBCAR IS
'��û̲�����';

COMMENT ON COLUMN TB_BCSTSDST.SBMPLOAR IS
'��û�������';

COMMENT ON COLUMN TB_BCSTSDST.CRSOPPL IS
'�ٺ������˿�';

COMMENT ON COLUMN TB_BCSTSDST.DTHPPL IS
'���������˿�';

COMMENT ON COLUMN TB_BCSTSDST.ARSOPPL IS
'���������˿�';

COMMENT ON COLUMN TB_BCSTSDST.MVARRPPL IS
'��ǣ�����˿�';

COMMENT ON COLUMN TB_BCSTSDST.LCARRPPL IS
'�͵ذ����˿�';

ALTER TABLE TB_BCSTSDST
   ADD CONSTRAINT PK_TB_BCSTSDST PRIMARY KEY (RPJINCD);

/*==============================================================*/
/* Index: FK__TB_BCSTSD__                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_BCSTSD__ ON TB_BCSTSDST (
TB__CNTCD
);

/*==============================================================*/
/* Index: FK__TB_BCSTSD33                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_BCSTSD33 ON TB_BCSTSDST (
CNTCD
);

/*==============================================================*/
/* Table: TB_BLBADSC                                            */
/*==============================================================*/
CREATE TABLE TB_BLBADSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
WDQ                  NUMERIC(12,2),
BLH                  NUMERIC(12,2),
WNS                  NUMERIC(12,2)
);

COMMENT ON TABLE TB_BLBADSC IS
'�˿�';

COMMENT ON COLUMN TB_BLBADSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_BLBADSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_BLBADSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_BLBADSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_BLBADSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_BLBADSC.WDQ IS
'�ӵ�����';

COMMENT ON COLUMN TB_BLBADSC.BLH IS
'�˸�';

COMMENT ON COLUMN TB_BLBADSC.WNS IS
'����';

ALTER TABLE TB_BLBADSC
   ADD CONSTRAINT PK_TB_BLBADSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_BLBADSC_                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_BLBADSC_ ON TB_BLBADSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_BRDMDSC                                            */
/*==============================================================*/
CREATE TABLE TB_BRDMDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
BRDMW                NUMERIC(12,2),
PJPS                 VARCHAR(255),
BRZDMCDI             NUMERIC(12,2),
BRV                  NUMERIC(12,2),
BRDMQ                NUMERIC(12,2),
BRDMLDGL             VARCHAR(255),
DSSPN                INT,
INPN                 INT,
DTHPN                INT,
WRHS                 INT,
CRPDSSAR             NUMERIC(12,2),
SCDMFMAR             NUMERIC(12,2),
DRCECLS              NUMERIC(12,2)
);

COMMENT ON TABLE TB_BRDMDSC IS
'����';

COMMENT ON COLUMN TB_BRDMDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_BRDMDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_BRDMDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_BRDMDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_BRDMDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_BRDMDSC.BRDMW IS
'���ӿ��';

COMMENT ON COLUMN TB_BRDMDSC.PJPS IS
'������״';

COMMENT ON COLUMN TB_BRDMDSC.BRZDMCDI IS
'��ˮλ��̶��߲�';

COMMENT ON COLUMN TB_BRDMDSC.BRV IS
'����ʱ����';

COMMENT ON COLUMN TB_BRDMDSC.BRDMQ IS
'��������';

COMMENT ON COLUMN TB_BRDMDSC.BRDMLDGL IS
'���Ӵ����Ρ���������';

COMMENT ON COLUMN TB_BRDMDSC.DSSPN IS
'�����˿�';

COMMENT ON COLUMN TB_BRDMDSC.INPN IS
'�����˿�';

COMMENT ON COLUMN TB_BRDMDSC.DTHPN IS
'�����˿�';

COMMENT ON COLUMN TB_BRDMDSC.WRHS IS
'��������';

COMMENT ON COLUMN TB_BRDMDSC.CRPDSSAR IS
'ũ�����������';

COMMENT ON COLUMN TB_BRDMDSC.SCDMFMAR IS
'�ٻ��������';

COMMENT ON COLUMN TB_BRDMDSC.DRCECLS IS
'ֱ�Ӿ�����ʧ';

ALTER TABLE TB_BRDMDSC
   ADD CONSTRAINT PK_TB_BRDMDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_BRDMDSC_                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_BRDMDSC_ ON TB_BRDMDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_BSWPLPDS                                           */
/*==============================================================*/
CREATE TABLE TB_BSWPLPDS (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
WPPLU                CHAR(50),
WPEQML               CHAR(50)
);

COMMENT ON TABLE TB_BSWPLPDS IS
'������ˮʧЧ';

COMMENT ON COLUMN TB_BSWPLPDS.DNCNO IS
'������';

COMMENT ON COLUMN TB_BSWPLPDS.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_BSWPLPDS.STTPCD IS
'���������';

COMMENT ON COLUMN TB_BSWPLPDS.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_BSWPLPDS.DNCNM IS
'��������';

COMMENT ON COLUMN TB_BSWPLPDS.WPPLU IS
'��ˮ�׶���';

COMMENT ON COLUMN TB_BSWPLPDS.WPEQML IS
'��ˮ�豸ʧ��';

ALTER TABLE TB_BSWPLPDS
   ADD CONSTRAINT PK_TB_BSWPLPDS PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_BSWPLPDS                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_BSWPLPDS ON TB_BSWPLPDS (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_BSWRDSC                                            */
/*==============================================================*/
CREATE TABLE TB_BSWRDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
GRNSPDSC             VARCHAR(255),
GRNUSB               NUMERIC(12,2),
GROVCHWR             VARCHAR(255)
);

COMMENT ON TABLE TB_BSWRDSC IS
'�����ƻ�';

COMMENT ON COLUMN TB_BSWRDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_BSWRDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_BSWRDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_BSWRDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_BSWRDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_BSWRDSC.GRNSPDSC IS
'������©����';

COMMENT ON COLUMN TB_BSWRDSC.GRNUSB IS
'���������ȳ���';

COMMENT ON COLUMN TB_BSWRDSC.GROVCHWR IS
'���������ƻ�';

ALTER TABLE TB_BSWRDSC
   ADD CONSTRAINT PK_TB_BSWRDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_BSWRDSC_                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_BSWRDSC_ ON TB_BSWRDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_BURDSC                                             */
/*==============================================================*/
CREATE TABLE TB_BURDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
BUW                  NUMERIC(12,2),
BUVL                 NUMERIC(12,2),
BUZDF                NUMERIC(12,2),
BUQ                  NUMERIC(12,2),
BURLDGL              VARCHAR(255),
DSSPN                INT,
INPN                 INT,
DTHPN                INT,
WRHS                 INT,
CRPDSSAR             NUMERIC(12,2),
SCDMFMAR             NUMERIC(12,2),
DRCECLS              NUMERIC(12,2)
);

COMMENT ON TABLE TB_BURDSC IS
'��������';

COMMENT ON COLUMN TB_BURDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_BURDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_BURDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_BURDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_BURDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_BURDSC.BUW IS
'���ڿ��';

COMMENT ON COLUMN TB_BURDSC.BUVL IS
'��������';

COMMENT ON COLUMN TB_BURDSC.BUZDF IS
'����ˮͷ��';

COMMENT ON COLUMN TB_BURDSC.BUQ IS
'��������';

COMMENT ON COLUMN TB_BURDSC.BURLDGL IS
'���ڴ����ε�������';

COMMENT ON COLUMN TB_BURDSC.DSSPN IS
'�����˿�';

COMMENT ON COLUMN TB_BURDSC.INPN IS
'�����˿�';

COMMENT ON COLUMN TB_BURDSC.DTHPN IS
'�����˿�';

COMMENT ON COLUMN TB_BURDSC.WRHS IS
'��������';

COMMENT ON COLUMN TB_BURDSC.CRPDSSAR IS
'ũ�����������';

COMMENT ON COLUMN TB_BURDSC.SCDMFMAR IS
'�ٻ��������';

COMMENT ON COLUMN TB_BURDSC.DRCECLS IS
'ֱ�Ӿ�����ʧ';

ALTER TABLE TB_BURDSC
   ADD CONSTRAINT PK_TB_BURDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_BURDSC__                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_BURDSC__ ON TB_BURDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_CLPJPRWR                                           */
/*==============================================================*/
CREATE TABLE TB_CLPJPRWR (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
WRAR                 NUMERIC(12,2),
WRD                  NUMERIC(12,2),
WRL                  NUMERIC(12,2),
WRGLCN               VARCHAR(255)
);

COMMENT ON TABLE TB_CLPJPRWR IS
'�ص����ֲ̾���';

COMMENT ON COLUMN TB_CLPJPRWR.DNCNO IS
'������';

COMMENT ON COLUMN TB_CLPJPRWR.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_CLPJPRWR.STTPCD IS
'���������';

COMMENT ON COLUMN TB_CLPJPRWR.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_CLPJPRWR.DNCNM IS
'��������';

COMMENT ON COLUMN TB_CLPJPRWR.WRAR IS
'�ƻ����';

COMMENT ON COLUMN TB_CLPJPRWR.WRD IS
'�ƻ����';

COMMENT ON COLUMN TB_CLPJPRWR.WRL IS
'�ƻ�����';

COMMENT ON COLUMN TB_CLPJPRWR.WRGLCN IS
'�ƻ����������';

ALTER TABLE TB_CLPJPRWR
   ADD CONSTRAINT PK_TB_CLPJPRWR PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_CLPJPRWR                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_CLPJPRWR ON TB_CLPJPRWR (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_CLPJSCDN                                           */
/*==============================================================*/
CREATE TABLE TB_CLPJSCDN (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
SCDMBU               INT,
SCDML                INT,
SCDMD                NUMERIC(12,2),
SCDMGLCN             VARCHAR(255)
);

COMMENT ON TABLE TB_CLPJSCDN IS
'�ص����̳��';

COMMENT ON COLUMN TB_CLPJSCDN.DNCNO IS
'������';

COMMENT ON COLUMN TB_CLPJSCDN.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_CLPJSCDN.STTPCD IS
'���������';

COMMENT ON COLUMN TB_CLPJSCDN.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_CLPJSCDN.DNCNM IS
'��������';

COMMENT ON COLUMN TB_CLPJSCDN.SCDMBU IS
'������';

COMMENT ON COLUMN TB_CLPJSCDN.SCDML IS
'��ٳ���';

COMMENT ON COLUMN TB_CLPJSCDN.SCDMD IS
'������';

COMMENT ON COLUMN TB_CLPJSCDN.SCDMGLCN IS
'��ٴ��������';

ALTER TABLE TB_CLPJSCDN
   ADD CONSTRAINT PK_TB_CLPJSCDN PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_CLPJSCDN                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_CLPJSCDN ON TB_CLPJSCDN (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_CNT                                                */
/*==============================================================*/
CREATE TABLE TB_CNT (
CNTCD                CHAR(6)              NOT NULL,
PROVNM               CHAR(40)
);

COMMENT ON TABLE TB_CNT IS
'��������';

COMMENT ON COLUMN TB_CNT.CNTCD IS
'������������';

COMMENT ON COLUMN TB_CNT.PROVNM IS
'ʡ���У�������';

ALTER TABLE TB_CNT
   ADD CONSTRAINT PK_TB_CNT PRIMARY KEY (CNTCD);

/*==============================================================*/
/* Table: TB_COWAPJ                                             */
/*==============================================================*/
CREATE TABLE TB_COWAPJ (
PJRNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
DTCDT                DATE                 NOT NULL,
PJNM                 CHAR(40)             NOT NULL,
BKOT                 CHAR(2),
FLCNDSC              VARCHAR(255),
WDCNDSC              VARCHAR(255),
PRCCLR               VARCHAR(255),
SPURDSC              VARCHAR(255),
BPPJCN               VARCHAR(255)
);

COMMENT ON TABLE TB_COWAPJ IS
'�κ�����';

COMMENT ON COLUMN TB_COWAPJ.PJRNO IS
'���б��';

COMMENT ON COLUMN TB_COWAPJ.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_COWAPJ.DTCDT IS
'���ʱ��';

COMMENT ON COLUMN TB_COWAPJ.PJNM IS
'��������';

COMMENT ON COLUMN TB_COWAPJ.BKOT IS
'���ڰ���';

COMMENT ON COLUMN TB_COWAPJ.FLCNDSC IS
'ˮ���������';

COMMENT ON COLUMN TB_COWAPJ.WDCNDSC IS
'�ӵ��������';

COMMENT ON COLUMN TB_COWAPJ.PRCCLR IS
'���ϵ���ʵ';

COMMENT ON COLUMN TB_COWAPJ.SPURDSC IS
'�ص���������';

COMMENT ON COLUMN TB_COWAPJ.BPPJCN IS
'�����������';

ALTER TABLE TB_COWAPJ
   ADD CONSTRAINT PK_TB_COWAPJ PRIMARY KEY (PJRNO);

/*==============================================================*/
/* Index: FK__TB_COWAPJ__                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_COWAPJ__ ON TB_COWAPJ (
PJNO
);

/*==============================================================*/
/* Table: TB_CRDSC                                              */
/*==============================================================*/
CREATE TABLE TB_CRDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
CRDR                 CHAR(40),
CRD                  NUMERIC(12,2),
CRL                  NUMERIC(12,2),
CRW                  NUMERIC(12,2)
);

COMMENT ON TABLE TB_CRDSC IS
'�ѷ�';

COMMENT ON COLUMN TB_CRDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_CRDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_CRDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_CRDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_CRDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_CRDSC.CRDR IS
'�ѷ췽��';

COMMENT ON COLUMN TB_CRDSC.CRD IS
'�ѷ����';

COMMENT ON COLUMN TB_CRDSC.CRL IS
'�ѷ쳤��';

COMMENT ON COLUMN TB_CRDSC.CRW IS
'�ѷ���';

ALTER TABLE TB_CRDSC
   ADD CONSTRAINT PK_TB_CRDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_CRDSC__3                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_CRDSC__3 ON TB_CRDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_CVDSC                                              */
/*==============================================================*/
CREATE TABLE TB_CVDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
TODFTDI              NUMERIC(12,2),
WDQ                  NUMERIC(12,2),
CVL                  NUMERIC(12,2),
CVBU                 INT,
RVH                  NUMERIC(12,2),
FLCNDSC              VARCHAR(255)
);

COMMENT ON TABLE TB_CVDSC IS
'����';

COMMENT ON COLUMN TB_CVDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_CVDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_CVDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_CVDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_CVDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_CVDSC.TODFTDI IS
'��̽ž���';

COMMENT ON COLUMN TB_CVDSC.WDQ IS
'�ӵ�����';

COMMENT ON COLUMN TB_CVDSC.CVL IS
'��������';

COMMENT ON COLUMN TB_CVDSC.CVBU IS
'�������';

COMMENT ON COLUMN TB_CVDSC.RVH IS
'�Ӱ��߶�';

COMMENT ON COLUMN TB_CVDSC.FLCNDSC IS
'ˮ���������';

ALTER TABLE TB_CVDSC
   ADD CONSTRAINT PK_TB_CVDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_CVDSC__3                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_CVDSC__3 ON TB_CVDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_DKDNCSTA1                                          */
/*==============================================================*/
CREATE TABLE TB_DKDNCSTA1 (
RPJINCD              INT                  NOT NULL,
CNTCD                CHAR(6),
STADT                DATE,
STAPTE               DATE,
FLNO                 INT,
LKQU                 INT,
LKNB                 INT,
PPQU                 INT,
PPMQU                NUMERIC(12,2),
PITQU                INT,
SLQU                 INT,
SLMQU                NUMERIC(12,2),
UNQU                 INT,
UNMQU                NUMERIC(12,2),
CRQU                 INT,
CRMQU                NUMERIC(12,2),
SPQU                 INT,
SPMQU                NUMERIC(12,2),
SLIQU                INT
);

COMMENT ON TABLE TB_DKDNCSTA1 IS
'TB_DKDNCSTA1';

COMMENT ON COLUMN TB_DKDNCSTA1.RPJINCD IS
'RPJINCD';

COMMENT ON COLUMN TB_DKDNCSTA1.CNTCD IS
'������������';

COMMENT ON COLUMN TB_DKDNCSTA1.STADT IS
'STADT';

COMMENT ON COLUMN TB_DKDNCSTA1.STAPTE IS
'STAPTE';

COMMENT ON COLUMN TB_DKDNCSTA1.FLNO IS
'FLNO';

COMMENT ON COLUMN TB_DKDNCSTA1.LKQU IS
'LKQU';

COMMENT ON COLUMN TB_DKDNCSTA1.LKNB IS
'LKNB';

COMMENT ON COLUMN TB_DKDNCSTA1.PPQU IS
'PPQU';

COMMENT ON COLUMN TB_DKDNCSTA1.PPMQU IS
'PPMQU';

COMMENT ON COLUMN TB_DKDNCSTA1.PITQU IS
'PITQU';

COMMENT ON COLUMN TB_DKDNCSTA1.SLQU IS
'SLQU';

COMMENT ON COLUMN TB_DKDNCSTA1.SLMQU IS
'SLMQU';

COMMENT ON COLUMN TB_DKDNCSTA1.UNQU IS
'UNQU';

COMMENT ON COLUMN TB_DKDNCSTA1.UNMQU IS
'UNMQU';

COMMENT ON COLUMN TB_DKDNCSTA1.CRQU IS
'CRQU';

COMMENT ON COLUMN TB_DKDNCSTA1.CRMQU IS
'CRMQU';

COMMENT ON COLUMN TB_DKDNCSTA1.SPQU IS
'SPQU';

COMMENT ON COLUMN TB_DKDNCSTA1.SPMQU IS
'SPMQU';

COMMENT ON COLUMN TB_DKDNCSTA1.SLIQU IS
'SLIQU';

ALTER TABLE TB_DKDNCSTA1
   ADD CONSTRAINT PK_TB_DKDNCSTA1 PRIMARY KEY (RPJINCD);

/*==============================================================*/
/* Index: FK__TB_DKDNCS31                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_DKDNCS31 ON TB_DKDNCSTA1 (
CNTCD
);

/*==============================================================*/
/* Table: TB_DKDNCSTA2                                          */
/*==============================================================*/
CREATE TABLE TB_DKDNCSTA2 (
RPJINCD              INT                  NOT NULL,
CNTCD                CHAR(6),
STADT                DATE,
STAPTE               DATE,
FLNO                 INT,
HJC                  INT,
HJBC                 INT,
XGXJC                INT,
XGXJBC               INT,
XGYBC                INT,
XGYBBC               INT,
XGJDC                INT,
XGJDBC               INT,
XGZDC                INT,
XGZDBC               INT,
KDXJC                INT,
KDXJBC               INT,
KDYBC                INT,
KDYBBC               INT,
KDJDC                INT,
KDJDBC               INT,
KDZDC                INT,
KDZDBC               INT
);

COMMENT ON TABLE TB_DKDNCSTA2 IS
'TB_DKDNCSTA2';

COMMENT ON COLUMN TB_DKDNCSTA2.RPJINCD IS
'RPJINCD';

COMMENT ON COLUMN TB_DKDNCSTA2.CNTCD IS
'������������';

COMMENT ON COLUMN TB_DKDNCSTA2.STADT IS
'STADT';

COMMENT ON COLUMN TB_DKDNCSTA2.STAPTE IS
'STAPTE';

COMMENT ON COLUMN TB_DKDNCSTA2.FLNO IS
'FLNO';

COMMENT ON COLUMN TB_DKDNCSTA2.HJC IS
'HJC';

COMMENT ON COLUMN TB_DKDNCSTA2.HJBC IS
'HJBC';

COMMENT ON COLUMN TB_DKDNCSTA2.XGXJC IS
'XGXJC';

COMMENT ON COLUMN TB_DKDNCSTA2.XGXJBC IS
'XGXJBC';

COMMENT ON COLUMN TB_DKDNCSTA2.XGYBC IS
'XGYBC';

COMMENT ON COLUMN TB_DKDNCSTA2.XGYBBC IS
'XGYBBC';

COMMENT ON COLUMN TB_DKDNCSTA2.XGJDC IS
'XGJDC';

COMMENT ON COLUMN TB_DKDNCSTA2.XGJDBC IS
'XGJDBC';

COMMENT ON COLUMN TB_DKDNCSTA2.XGZDC IS
'XGZDC';

COMMENT ON COLUMN TB_DKDNCSTA2.XGZDBC IS
'XGZDBC';

COMMENT ON COLUMN TB_DKDNCSTA2.KDXJC IS
'KDXJC';

COMMENT ON COLUMN TB_DKDNCSTA2.KDXJBC IS
'KDXJBC';

COMMENT ON COLUMN TB_DKDNCSTA2.KDYBC IS
'KDYBC';

COMMENT ON COLUMN TB_DKDNCSTA2.KDYBBC IS
'KDYBBC';

COMMENT ON COLUMN TB_DKDNCSTA2.KDJDC IS
'KDJDC';

COMMENT ON COLUMN TB_DKDNCSTA2.KDJDBC IS
'KDJDBC';

COMMENT ON COLUMN TB_DKDNCSTA2.KDZDC IS
'KDZDC';

COMMENT ON COLUMN TB_DKDNCSTA2.KDZDBC IS
'KDZDBC';

ALTER TABLE TB_DKDNCSTA2
   ADD CONSTRAINT PK_TB_DKDNCSTA2 PRIMARY KEY (RPJINCD);

/*==============================================================*/
/* Index: FK__TB_DKDNCS__                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_DKDNCS__ ON TB_DKDNCSTA2 (
CNTCD
);

/*==============================================================*/
/* Table: TB_DKR                                                */
/*==============================================================*/
CREATE TABLE TB_DKR (
PJRNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
DTCDT                DATE                 NOT NULL,
PJNM                 CHAR(40)             NOT NULL,
DKGR                 CHAR(1),
BKOT                 CHAR(2),
STECH                CHAR(40),
RZ                   NUMERIC(12,2),
RQ                   NUMERIC(12,2),
WSTODC               NUMERIC(12,2),
DKPFCN               VARCHAR(255),
TSCN                 VARCHAR(255),
BRBPPFCN             VARCHAR(255)
);

COMMENT ON TABLE TB_DKR IS
'�̷�����';

COMMENT ON COLUMN TB_DKR.PJRNO IS
'���б��';

COMMENT ON COLUMN TB_DKR.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_DKR.DTCDT IS
'���ʱ��';

COMMENT ON COLUMN TB_DKR.PJNM IS
'��������';

COMMENT ON COLUMN TB_DKR.DKGR IS
'�̷�����';

COMMENT ON COLUMN TB_DKR.BKOT IS
'���ڰ���';

COMMENT ON COLUMN TB_DKR.STECH IS
'��ֹ׮��';

COMMENT ON COLUMN TB_DKR.RZ IS
'��ǰˮλ';

COMMENT ON COLUMN TB_DKR.RQ IS
'��ǰ����';

COMMENT ON COLUMN TB_DKR.WSTODC IS
'ˮ���̶�����';

COMMENT ON COLUMN TB_DKR.DKPFCN IS
'�̷����״��';

COMMENT ON COLUMN TB_DKR.TSCN IS
'���̽�����״��';

COMMENT ON COLUMN TB_DKR.BRBPPFCN IS
'���»������״��';

ALTER TABLE TB_DKR
   ADD CONSTRAINT PK_TB_DKR PRIMARY KEY (PJRNO);

/*==============================================================*/
/* Index: FK__TB_DKR__PJN                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_DKR__PJN ON TB_DKR (
PJNO
);

/*==============================================================*/
/* Table: TB_DKSNWS                                             */
/*==============================================================*/
CREATE TABLE TB_DKSNWS (
RPJINCD              INT                  NOT NULL,
CNTCD                CHAR(6),
STADT                DATE,
STAPTE               DATE,
FLNO                 INT,
STPCH                CHAR(40),
TRPCH                CHAR(40),
DAGPJL               NUMERIC(12,2),
DAGPJD               NUMERIC(12,2),
BNL                  NUMERIC(12,2),
BND                  NUMERIC(12,2)
);

COMMENT ON TABLE TB_DKSNWS IS
'TB_DKSNWS';

COMMENT ON COLUMN TB_DKSNWS.RPJINCD IS
'RPJINCD';

COMMENT ON COLUMN TB_DKSNWS.CNTCD IS
'������������';

COMMENT ON COLUMN TB_DKSNWS.STADT IS
'STADT';

COMMENT ON COLUMN TB_DKSNWS.STAPTE IS
'STAPTE';

COMMENT ON COLUMN TB_DKSNWS.FLNO IS
'FLNO';

COMMENT ON COLUMN TB_DKSNWS.STPCH IS
'STPCH';

COMMENT ON COLUMN TB_DKSNWS.TRPCH IS
'TRPCH';

COMMENT ON COLUMN TB_DKSNWS.DAGPJL IS
'DAGPJL';

COMMENT ON COLUMN TB_DKSNWS.DAGPJD IS
'DAGPJD';

COMMENT ON COLUMN TB_DKSNWS.BNL IS
'BNL';

COMMENT ON COLUMN TB_DKSNWS.BND IS
'BND';

ALTER TABLE TB_DKSNWS
   ADD CONSTRAINT PK_TB_DKSNWS PRIMARY KEY (RPJINCD);

/*==============================================================*/
/* Index: FK__TB_DKSN4887                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_DKSN4887 ON TB_DKSNWS (
CNTCD
);

/*==============================================================*/
/* Table: TB_EDDWRDSC                                           */
/*==============================================================*/
CREATE TABLE TB_EDDWRDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
APWR                 VARCHAR(255),
WSTWR                VARCHAR(255)
);

COMMENT ON TABLE TB_EDDWRDSC IS
'���ܹ��ƻ�';

COMMENT ON COLUMN TB_EDDWRDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_EDDWRDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_EDDWRDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_EDDWRDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_EDDWRDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_EDDWRDSC.APWR IS
'�װ�����';

COMMENT ON COLUMN TB_EDDWRDSC.WSTWR IS
'ֹˮ�ƻ�';

ALTER TABLE TB_EDDWRDSC
   ADD CONSTRAINT PK_TB_EDDWRDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_EDDWRDSC                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_EDDWRDSC ON TB_EDDWRDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_FPACTI                                             */
/*==============================================================*/
CREATE TABLE TB_FPACTI (
RPJINCD              INT                  NOT NULL,
WTTT                 CHAR(40)             NOT NULL,
WTDT                 DATE                 NOT NULL,
ACTICO               VARCHAR(1),
WTDPCD               CHAR(40)             NOT NULL
);

COMMENT ON TABLE TB_FPACTI IS
'��Ѵ�ж�';

COMMENT ON COLUMN TB_FPACTI.RPJINCD IS
'�ж����';

COMMENT ON COLUMN TB_FPACTI.WTTT IS
'�����';

COMMENT ON COLUMN TB_FPACTI.WTDT IS
'�ʱ��';

COMMENT ON COLUMN TB_FPACTI.ACTICO IS
'�ж�����';

COMMENT ON COLUMN TB_FPACTI.WTDPCD IS
'���λ����';

ALTER TABLE TB_FPACTI
   ADD CONSTRAINT PK_TB_FPACTI PRIMARY KEY (RPJINCD);

/*==============================================================*/
/* Table: TB_FPACTI_M                                           */
/*==============================================================*/
CREATE TABLE TB_FPACTI_M (
ZLBM                 INT                  NOT NULL,
RPJINCD              INT,
DTCDT                DATE,
TITLE                CHAR(40),
WJGS                 CHAR(4),
NRMS                 VARCHAR(255),
LXZP                 VARCHAR(1)
);

COMMENT ON TABLE TB_FPACTI_M IS
'��Ѵ��ý������';

COMMENT ON COLUMN TB_FPACTI_M.ZLBM IS
'���ϱ���';

COMMENT ON COLUMN TB_FPACTI_M.RPJINCD IS
'�ж����';

COMMENT ON COLUMN TB_FPACTI_M.DTCDT IS
'�ɼ�ʱ��';

COMMENT ON COLUMN TB_FPACTI_M.TITLE IS
'����';

COMMENT ON COLUMN TB_FPACTI_M.WJGS IS
'�ļ���ʽ';

COMMENT ON COLUMN TB_FPACTI_M.NRMS IS
'��������';

COMMENT ON COLUMN TB_FPACTI_M.LXZP IS
'¼����Ƭ';

ALTER TABLE TB_FPACTI_M
   ADD CONSTRAINT PK_TB_FPACTI_M PRIMARY KEY (ZLBM);

/*==============================================================*/
/* Index: FK__TB_FPACTI_8                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_FPACTI_8 ON TB_FPACTI_M (
RPJINCD
);

/*==============================================================*/
/* Table: TB_FXJB                                               */
/*==============================================================*/
CREATE TABLE TB_FXJB (
RPJINCD              INT                  NOT NULL,
ISSUE                INT                  NOT NULL,
WTTT                 CHAR(255)            NOT NULL,
WTDT                 DATE                 NOT NULL,
ACTICO               VARCHAR(1),
NT1                  VARCHAR(1),
QF                   CHAR(8),
SH                   CHAR(8),
NG                   CHAR(8),
WTDPCD               CHAR(40)             NOT NULL
);

COMMENT ON TABLE TB_FXJB IS
'��Ѵ��';

COMMENT ON COLUMN TB_FXJB.RPJINCD IS
'�򱨱��';

COMMENT ON COLUMN TB_FXJB.ISSUE IS
'��';

COMMENT ON COLUMN TB_FXJB.WTTT IS
'����';

COMMENT ON COLUMN TB_FXJB.WTDT IS
'�����';

COMMENT ON COLUMN TB_FXJB.ACTICO IS
'����';

COMMENT ON COLUMN TB_FXJB.NT1 IS
'����';

COMMENT ON COLUMN TB_FXJB.QF IS
'ǩ����';

COMMENT ON COLUMN TB_FXJB.SH IS
'�����';

COMMENT ON COLUMN TB_FXJB.NG IS
'�����';

COMMENT ON COLUMN TB_FXJB.WTDPCD IS
'���λ';

ALTER TABLE TB_FXJB
   ADD CONSTRAINT PK_TB_FXJB PRIMARY KEY (RPJINCD);

/*==============================================================*/
/* Table: TB_FXJB_M                                             */
/*==============================================================*/
CREATE TABLE TB_FXJB_M (
ZLBM                 INT                  NOT NULL,
RPJINCD              INT,
DTCDT                DATE,
TITLE                CHAR(40),
WJGS                 CHAR(4),
NRMS                 VARCHAR(255),
LXZP                 VARCHAR(1)
);

COMMENT ON TABLE TB_FXJB_M IS
'��Ѵ�򱨸�����';

COMMENT ON COLUMN TB_FXJB_M.ZLBM IS
'���ϱ���';

COMMENT ON COLUMN TB_FXJB_M.RPJINCD IS
'�򱨱��';

COMMENT ON COLUMN TB_FXJB_M.DTCDT IS
'�ɼ�ʱ��';

COMMENT ON COLUMN TB_FXJB_M.TITLE IS
'����';

COMMENT ON COLUMN TB_FXJB_M.WJGS IS
'�ļ���ʽ';

COMMENT ON COLUMN TB_FXJB_M.NRMS IS
'��������';

COMMENT ON COLUMN TB_FXJB_M.LXZP IS
'¼����Ƭ';

ALTER TABLE TB_FXJB_M
   ADD CONSTRAINT PK_TB_FXJB_M PRIMARY KEY (ZLBM);

/*==============================================================*/
/* Index: FK__TB_FXJB_M_5                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_FXJB_M_5 ON TB_FXJB_M (
RPJINCD
);

/*==============================================================*/
/* Table: TB_GCLB                                               */
/*==============================================================*/
CREATE TABLE TB_GCLB (
GCFLDM               CHAR(1)              NOT NULL,
GCFLMC               CHAR(12)             NOT NULL,
TBNAME               CHAR(40)
);

COMMENT ON TABLE TB_GCLB IS
'�������';

COMMENT ON COLUMN TB_GCLB.GCFLDM IS
'���̷������';

COMMENT ON COLUMN TB_GCLB.GCFLMC IS
'���̷�������';

COMMENT ON COLUMN TB_GCLB.TBNAME IS
'���������';

ALTER TABLE TB_GCLB
   ADD CONSTRAINT PK_TB_GCLB PRIMARY KEY (GCFLDM);

/*==============================================================*/
/* Table: TB_GTWRDSC                                            */
/*==============================================================*/
CREATE TABLE TB_GTWRDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
WRDSC                VARCHAR(255),
WRQ                  NUMERIC(12,2)
);

COMMENT ON TABLE TB_GTWRDSC IS
'բ���ƻ�';

COMMENT ON COLUMN TB_GTWRDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_GTWRDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_GTWRDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_GTWRDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_GTWRDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_GTWRDSC.WRDSC IS
'�ƻ���ʽ';

COMMENT ON COLUMN TB_GTWRDSC.WRQ IS
'ʧ��ʱ����';

ALTER TABLE TB_GTWRDSC
   ADD CONSTRAINT PK_TB_GTWRDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_GTWRDSC_                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_GTWRDSC_ ON TB_GTWRDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_HBWRDSC                                            */
/*==============================================================*/
CREATE TABLE TB_HBWRDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
WRAR                 NUMERIC(12,2),
WRMS                 INT,
LNINF                VARCHAR(255),
HBGLCN               VARCHAR(255)
);

COMMENT ON TABLE TB_HBWRDSC IS
'�����ƻ�';

COMMENT ON COLUMN TB_HBWRDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_HBWRDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_HBWRDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_HBWRDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_HBWRDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_HBWRDSC.WRAR IS
'�ƻ����';

COMMENT ON COLUMN TB_HBWRDSC.WRMS IS
'�ƻ�����';

COMMENT ON COLUMN TB_HBWRDSC.LNINF IS
'�Գ�����ɵ�Ӱ��';

COMMENT ON COLUMN TB_HBWRDSC.HBGLCN IS
'����������';

ALTER TABLE TB_HBWRDSC
   ADD CONSTRAINT PK_TB_HBWRDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_HBWRDSC_                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_HBWRDSC_ ON TB_HBWRDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_HOMLFDSC                                           */
/*==============================================================*/
CREATE TABLE TB_HOMLFDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
POWCUT               VARCHAR(255),
HOMLF                VARCHAR(255),
GSDST                VARCHAR(255),
MLFCN                VARCHAR(255)
);

COMMENT ON TABLE TB_HOMLFDSC IS
'����ʧ��';

COMMENT ON COLUMN TB_HOMLFDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_HOMLFDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_HOMLFDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_HOMLFDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_HOMLFDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_HOMLFDSC.POWCUT IS
'ͣ��';

COMMENT ON COLUMN TB_HOMLFDSC.HOMLF IS
'���ջ�ʧ��';

COMMENT ON COLUMN TB_HOMLFDSC.GSDST IS
'բ�ž�����';

COMMENT ON COLUMN TB_HOMLFDSC.MLFCN IS
'ʧ��ʱ����״��';

ALTER TABLE TB_HOMLFDSC
   ADD CONSTRAINT PK_TB_HOMLFDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_HOMLFDSC                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_HOMLFDSC ON TB_HOMLFDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_HS                                                 */
/*==============================================================*/
CREATE TABLE TB_HS (
BH                   INT,
TYPE                 INT,
TABLENAME            CHAR(12)
);

COMMENT ON TABLE TB_HS IS
'����';

COMMENT ON COLUMN TB_HS.BH IS
'��ѡ���¼������';

COMMENT ON COLUMN TB_HS.TYPE IS
'�������';

COMMENT ON COLUMN TB_HS.TABLENAME IS
'��ϸ��Ϣ���ڱ���';

/*==============================================================*/
/* Table: TB_HS_M                                               */
/*==============================================================*/
CREATE TABLE TB_HS_M (
BH                   INT                  NOT NULL,
TYPE                 INT,
ZLBM                 INT
);

COMMENT ON TABLE TB_HS_M IS
'���̶�ý������';

COMMENT ON COLUMN TB_HS_M.BH IS
'��ѡ���¼������';

COMMENT ON COLUMN TB_HS_M.TYPE IS
'�������';

COMMENT ON COLUMN TB_HS_M.ZLBM IS
'��ý���¼���';

/*==============================================================*/
/* Table: TB_HYWDMS                                             */
/*==============================================================*/
CREATE TABLE TB_HYWDMS (
RPJINCD              INT                  NOT NULL,
STADT                DATE,
STAPTE               DATE,
FLNO                 INT,
CTCD                 CHAR(12),
HYSNM                CHAR(40),
LSSR                 NUMERIC(12,2),
LSARCB               NUMERIC(12,2),
LSSRB                NUMERIC(12,2),
LSTEINS              NUMERIC(12,2),
LSCMLNEQ             NUMERIC(12,2),
LSOBROWL             NUMERIC(12,2),
LSTNT                NUMERIC(12,2)
);

COMMENT ON TABLE TB_HYWDMS IS
'TB_HYWDMS';

COMMENT ON COLUMN TB_HYWDMS.RPJINCD IS
'RPJINCD';

COMMENT ON COLUMN TB_HYWDMS.STADT IS
'STADT';

COMMENT ON COLUMN TB_HYWDMS.STAPTE IS
'STAPTE';

COMMENT ON COLUMN TB_HYWDMS.FLNO IS
'FLNO';

COMMENT ON COLUMN TB_HYWDMS.CTCD IS
'CTCD';

COMMENT ON COLUMN TB_HYWDMS.HYSNM IS
'HYSNM';

COMMENT ON COLUMN TB_HYWDMS.LSSR IS
'LSSR';

COMMENT ON COLUMN TB_HYWDMS.LSARCB IS
'LSARCB';

COMMENT ON COLUMN TB_HYWDMS.LSSRB IS
'LSSRB';

COMMENT ON COLUMN TB_HYWDMS.LSTEINS IS
'LSTEINS';

COMMENT ON COLUMN TB_HYWDMS.LSCMLNEQ IS
'LSCMLNEQ';

COMMENT ON COLUMN TB_HYWDMS.LSOBROWL IS
'LSOBROWL';

COMMENT ON COLUMN TB_HYWDMS.LSTNT IS
'LSTNT';

ALTER TABLE TB_HYWDMS
   ADD CONSTRAINT PK_TB_HYWDMS PRIMARY KEY (RPJINCD);

/*==============================================================*/
/* Table: TB_JZWFL                                              */
/*==============================================================*/
CREATE TABLE TB_JZWFL (
JZWFLDM              CHAR(4)              NOT NULL,
JZWFLMC              CHAR(12)
);

COMMENT ON TABLE TB_JZWFL IS
'���������';

COMMENT ON COLUMN TB_JZWFL.JZWFLDM IS
'������������';

COMMENT ON COLUMN TB_JZWFL.JZWFLMC IS
'�������������';

ALTER TABLE TB_JZWFL
   ADD CONSTRAINT PK_TB_JZWFL PRIMARY KEY (JZWFLDM);

/*==============================================================*/
/* Table: TB_LKDSC                                              */
/*==============================================================*/
CREATE TABLE TB_LKDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
TODFTDI              NUMERIC(12,2),
LKDMT                NUMERIC(12,2),
LKQ                  NUMERIC(12,2),
LKWTLH               NUMERIC(12,2),
LKGTU                CHAR(8),
LKSAR                NUMERIC(12,2)
);

COMMENT ON TABLE TB_LKDSC IS
'©��';

COMMENT ON COLUMN TB_LKDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_LKDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_LKDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_LKDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_LKDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_LKDSC.TODFTDI IS
'��̶��߲�';

COMMENT ON COLUMN TB_LKDSC.LKDMT IS
'���©��ֱ��';

COMMENT ON COLUMN TB_LKDSC.LKQ IS
'©������';

COMMENT ON COLUMN TB_LKDSC.LKWTLH IS
'©��ˮ����';

COMMENT ON COLUMN TB_LKDSC.LKGTU IS
'©ˮ����';

COMMENT ON COLUMN TB_LKDSC.LKSAR IS
'���γ�©��Ⱥ���';

ALTER TABLE TB_LKDSC
   ADD CONSTRAINT PK_TB_LKDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_LKDSC__2                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_LKDSC__2 ON TB_LKDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_LYSX                                               */
/*==============================================================*/
CREATE TABLE TB_LYSX (
CTNM                 CHAR(40)             NOT NULL,
CTCD                 CHAR(8)              NOT NULL,
NT                   VARCHAR(50)
);

COMMENT ON TABLE TB_LYSX IS
'����ˮϵ�����';

COMMENT ON COLUMN TB_LYSX.CTNM IS
'��������';

COMMENT ON COLUMN TB_LYSX.CTCD IS
'��������';

COMMENT ON COLUMN TB_LYSX.NT IS
'����';

ALTER TABLE TB_LYSX
   ADD CONSTRAINT PK_TB_LYSX PRIMARY KEY (CTCD);

/*==============================================================*/
/* Table: TB_LYSX1                                              */
/*==============================================================*/
CREATE TABLE TB_LYSX1 (
CTNM                 CHAR(40),
CTCD                 CHAR(8)              NOT NULL,
NT                   VARCHAR(50)
);

COMMENT ON TABLE TB_LYSX1 IS
'���򼶱�';

COMMENT ON COLUMN TB_LYSX1.CTNM IS
'��������';

COMMENT ON COLUMN TB_LYSX1.CTCD IS
'�������';

COMMENT ON COLUMN TB_LYSX1.NT IS
'NT';

ALTER TABLE TB_LYSX1
   ADD CONSTRAINT PK_TB_LYSX1 PRIMARY KEY (CTCD);

/*==============================================================*/
/* Table: TB_OVFLDSC                                            */
/*==============================================================*/
CREATE TABLE TB_OVFLDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
OVFLL                NUMERIC(12,2),
OVFLZ                NUMERIC(12,2),
DSQ                  NUMERIC(12,2)
);

COMMENT ON TABLE TB_OVFLDSC IS
'����';

COMMENT ON COLUMN TB_OVFLDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_OVFLDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_OVFLDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_OVFLDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_OVFLDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_OVFLDSC.OVFLL IS
'���糤��';

COMMENT ON COLUMN TB_OVFLDSC.OVFLZ IS
'����ˮλ';

COMMENT ON COLUMN TB_OVFLDSC.DSQ IS
'��к����';

ALTER TABLE TB_OVFLDSC
   ADD CONSTRAINT PK_TB_OVFLDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_OVFLDSC_                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_OVFLDSC_ ON TB_OVFLDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_OVTUDSC                                            */
/*==============================================================*/
CREATE TABLE TB_OVTUDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
OVTUDR               CHAR(40),
OVTUAG               NUMERIC(12,2)
);

COMMENT ON TABLE TB_OVTUDSC IS
'�㸲';

COMMENT ON COLUMN TB_OVTUDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_OVTUDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_OVTUDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_OVTUDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_OVTUDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_OVTUDSC.OVTUDR IS
'�㸲����';

COMMENT ON COLUMN TB_OVTUDSC.OVTUAG IS
'�㸲�Ƕ�';

ALTER TABLE TB_OVTUDSC
   ADD CONSTRAINT PK_TB_OVTUDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_OVTUDSC_                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_OVTUDSC_ ON TB_OVTUDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_PICKREC                                            */
/*==============================================================*/
CREATE TABLE TB_PICKREC (
ZLBM                 INT,
WTDPCD               CHAR(40),
FENLEI               CHAR(8),
MEDIASIZE            NUMERIC(12,2),
NUM                  INT
);

COMMENT ON TABLE TB_PICKREC IS
'��ѡ���¼��';

COMMENT ON COLUMN TB_PICKREC.ZLBM IS
'��¼����';

COMMENT ON COLUMN TB_PICKREC.WTDPCD IS
'����ѡ��¼�����λ';

COMMENT ON COLUMN TB_PICKREC.FENLEI IS
'����ѡ��¼�����';

COMMENT ON COLUMN TB_PICKREC.MEDIASIZE IS
'����ѡͼƬ�Ĵ�С';

COMMENT ON COLUMN TB_PICKREC.NUM IS
'����ѡ��¼�ı��';

/*==============================================================*/
/* Table: TB_PITDSC                                             */
/*==============================================================*/
CREATE TABLE TB_PITDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
SBDSP                NUMERIC(12,2),
SBAR                 NUMERIC(12,2)
);

COMMENT ON TABLE TB_PITDSC IS
'�ݿ�';

COMMENT ON COLUMN TB_PITDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_PITDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_PITDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_PITDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_PITDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_PITDSC.SBDSP IS
'�ݿ����';

COMMENT ON COLUMN TB_PITDSC.SBAR IS
'�ݿ����';

ALTER TABLE TB_PITDSC
   ADD CONSTRAINT PK_TB_PITDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_PITDSC__                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_PITDSC__ ON TB_PITDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_PJ                                                 */
/*==============================================================*/
CREATE TABLE TB_PJ (
PJNO                 INT                  NOT NULL,
CNTCD                CHAR(6),
PJNMCD               CHAR(12),
PJNM                 CHAR(40)             NOT NULL,
FPDUTY               CHAR(8),
FPDUTYPH             CHAR(28)
);

COMMENT ON TABLE TB_PJ IS
'���̴����';

COMMENT ON COLUMN TB_PJ.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_PJ.CNTCD IS
'������������';

COMMENT ON COLUMN TB_PJ.PJNMCD IS
'PJNMCD';

COMMENT ON COLUMN TB_PJ.PJNM IS
'PJNM';

COMMENT ON COLUMN TB_PJ.FPDUTY IS
'FPDUTY';

COMMENT ON COLUMN TB_PJ.FPDUTYPH IS
'FPDUTYPH';

ALTER TABLE TB_PJ
   ADD CONSTRAINT PK_TB_PJ PRIMARY KEY (PJNO);

/*==============================================================*/
/* Index: FK__TB_PJ__CNTC                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_PJ__CNTC ON TB_PJ (
CNTCD
);

/*==============================================================*/
/* Table: TB_PJRCN                                              */
/*==============================================================*/
CREATE TABLE TB_PJRCN (
PJRNO                INT                  NOT NULL,
GCFLDM               CHAR(1),
PJNO                 INT,
DTCDT                DATE                 NOT NULL,
PJNM                 CHAR(40)             NOT NULL,
DNCFC                VARCHAR(255),
RDERESCN             VARCHAR(255),
WTDPCD               CHAR(40)             NOT NULL,
WTDPDT               DATE                 NOT NULL,
NT                   VARCHAR(255)
);

COMMENT ON TABLE TB_PJRCN IS
'��������';

COMMENT ON COLUMN TB_PJRCN.PJRNO IS
'���б��';

COMMENT ON COLUMN TB_PJRCN.GCFLDM IS
'���̷������';

COMMENT ON COLUMN TB_PJRCN.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_PJRCN.DTCDT IS
'���ʱ��';

COMMENT ON COLUMN TB_PJRCN.PJNM IS
'��������';

COMMENT ON COLUMN TB_PJRCN.DNCFC IS
'����Ԥ��';

COMMENT ON COLUMN TB_PJRCN.RDERESCN IS
'������Դ�䱸';

COMMENT ON COLUMN TB_PJRCN.WTDPCD IS
'���λ����';

COMMENT ON COLUMN TB_PJRCN.WTDPDT IS
'�ʱ��';

COMMENT ON COLUMN TB_PJRCN.NT IS
'����';

ALTER TABLE TB_PJRCN
   ADD CONSTRAINT PK_TB_PJRCN PRIMARY KEY (PJRNO);

/*==============================================================*/
/* Index: FK__TB_PJRCN__G                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_PJRCN__G ON TB_PJRCN (
GCFLDM
);

/*==============================================================*/
/* Index: FK__TB_PJRCN__P                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_PJRCN__P ON TB_PJRCN (
PJNO
);

/*==============================================================*/
/* Table: TB_PJR_M                                              */
/*==============================================================*/
CREATE TABLE TB_PJR_M (
ZLBM                 INT                  NOT NULL,
PJRNO                INT,
DTCDT                DATE,
TITLE                CHAR(40),
WJGS                 CHAR(4),
NRMS                 VARCHAR(255),
LXZP                 VARCHAR(1)
);

COMMENT ON TABLE TB_PJR_M IS
'���ж�ý������';

COMMENT ON COLUMN TB_PJR_M.ZLBM IS
'���ϱ���';

COMMENT ON COLUMN TB_PJR_M.PJRNO IS
'���б��';

COMMENT ON COLUMN TB_PJR_M.DTCDT IS
'�ɼ�ʱ��';

COMMENT ON COLUMN TB_PJR_M.TITLE IS
'����';

COMMENT ON COLUMN TB_PJR_M.WJGS IS
'�ļ���ʽ';

COMMENT ON COLUMN TB_PJR_M.NRMS IS
'��������';

COMMENT ON COLUMN TB_PJR_M.LXZP IS
'¼����Ƭ';

ALTER TABLE TB_PJR_M
   ADD CONSTRAINT PK_TB_PJR_M PRIMARY KEY (ZLBM);

/*==============================================================*/
/* Index: FK__TB_PJR_M__P                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_PJR_M__P ON TB_PJR_M (
PJRNO
);

/*==============================================================*/
/* Table: TB_PLUDSC                                             */
/*==============================================================*/
CREATE TABLE TB_PLUDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
PLTNM                VARCHAR(255),
PLTBU                INT
);

COMMENT ON TABLE TB_PLUDSC IS
'����';

COMMENT ON COLUMN TB_PLUDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_PLUDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_PLUDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_PLUDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_PLUDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_PLUDSC.PLTNM IS
'����������';

COMMENT ON COLUMN TB_PLUDSC.PLTBU IS
'���������';

ALTER TABLE TB_PLUDSC
   ADD CONSTRAINT PK_TB_PLUDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_PLUDSC__                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_PLUDSC__ ON TB_PLUDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_PPDSC                                              */
/*==============================================================*/
CREATE TABLE TB_PPDSC (
������                 INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
TODFTDI              NUMERIC(12,2),
PPQ                  NUMERIC(12,2),
WTLH                 NUMERIC(12,2),
LKGTU                CHAR(8),
PPSAR                NUMERIC(12,2)
);

COMMENT ON TABLE TB_PPDSC IS
'��ӿ';

COMMENT ON COLUMN TB_PPDSC.������ IS
'������';

COMMENT ON COLUMN TB_PPDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_PPDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_PPDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_PPDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_PPDSC.TODFTDI IS
'��̽ž���';

COMMENT ON COLUMN TB_PPDSC.PPQ IS
'��ӿ����';

COMMENT ON COLUMN TB_PPDSC.WTLH IS
'ˮ����';

COMMENT ON COLUMN TB_PPDSC.LKGTU IS
'©ˮ����';

COMMENT ON COLUMN TB_PPDSC.PPSAR IS
'���γɹ�ӿȺ���';

ALTER TABLE TB_PPDSC
   ADD CONSTRAINT PK_TB_PPDSC PRIMARY KEY (������);

/*==============================================================*/
/* Index: FK__TB_PPDSC__3                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_PPDSC__3 ON TB_PPDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_QT                                                 */
/*==============================================================*/
CREATE TABLE TB_QT (
RPJINCD              INT                  NOT NULL,
WTTT                 CHAR(40)             NOT NULL,
WTDT                 DATE                 NOT NULL,
ACTICO               VARCHAR(1),
WTDPCD               CHAR(40)             NOT NULL
);

COMMENT ON TABLE TB_QT IS
'������Ϣ';

COMMENT ON COLUMN TB_QT.RPJINCD IS
'�ж����';

COMMENT ON COLUMN TB_QT.WTTT IS
'�����';

COMMENT ON COLUMN TB_QT.WTDT IS
'�ʱ��';

COMMENT ON COLUMN TB_QT.ACTICO IS
'�ж�����';

COMMENT ON COLUMN TB_QT.WTDPCD IS
'���λ����';

ALTER TABLE TB_QT
   ADD CONSTRAINT PK_TB_QT PRIMARY KEY (RPJINCD);

/*==============================================================*/
/* Table: TB_QT_M                                               */
/*==============================================================*/
CREATE TABLE TB_QT_M (
ZLBM                 INT                  NOT NULL,
RPJINCD              INT,
DTCDT                DATE,
TITLE                CHAR(40),
WJGS                 CHAR(4),
NRMS                 VARCHAR(255),
LXZP                 VARCHAR(1)
);

COMMENT ON TABLE TB_QT_M IS
'������Ϣ��ý������';

COMMENT ON COLUMN TB_QT_M.ZLBM IS
'���ϱ���';

COMMENT ON COLUMN TB_QT_M.RPJINCD IS
'�ж����';

COMMENT ON COLUMN TB_QT_M.DTCDT IS
'�ɼ�ʱ��';

COMMENT ON COLUMN TB_QT_M.TITLE IS
'����';

COMMENT ON COLUMN TB_QT_M.WJGS IS
'�ļ���ʽ';

COMMENT ON COLUMN TB_QT_M.NRMS IS
'��������';

COMMENT ON COLUMN TB_QT_M.LXZP IS
'¼����Ƭ';

ALTER TABLE TB_QT_M
   ADD CONSTRAINT PK_TB_QT_M PRIMARY KEY (ZLBM);

/*==============================================================*/
/* Index: FK__TB_QT_M__RP                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_QT_M__RP ON TB_QT_M (
RPJINCD
);

/*==============================================================*/
/* Table: TB_RDEST1                                             */
/*==============================================================*/
CREATE TABLE TB_RDEST1 (
RPJINCD              INT                  NOT NULL,
CNTCD                CHAR(6),
STADT                DATE,
STAPTE               DATE,
FLNO                 INT,
SPCTRPUT             NUMERIC(12,2),
VENB1                NUMERIC(12,2),
VENB2                NUMERIC(12,2),
PJMC1                NUMERIC(12,2),
PJMC2                NUMERIC(12,2),
PUTER                NUMERIC(12,2),
PUTRCR               NUMERIC(12,2),
USGW                 NUMERIC(12,2),
USBG                 NUMERIC(12,2),
USWLT                NUMERIC(12,2),
INV                  NUMERIC(12,2)
);

COMMENT ON TABLE TB_RDEST1 IS
'TB_RDEST1';

COMMENT ON COLUMN TB_RDEST1.RPJINCD IS
'RPJINCD';

COMMENT ON COLUMN TB_RDEST1.CNTCD IS
'������������';

COMMENT ON COLUMN TB_RDEST1.STADT IS
'STADT';

COMMENT ON COLUMN TB_RDEST1.STAPTE IS
'STAPTE';

COMMENT ON COLUMN TB_RDEST1.FLNO IS
'FLNO';

COMMENT ON COLUMN TB_RDEST1.SPCTRPUT IS
'SPCTRPUT';

COMMENT ON COLUMN TB_RDEST1.VENB1 IS
'VENB1';

COMMENT ON COLUMN TB_RDEST1.VENB2 IS
'VENB2';

COMMENT ON COLUMN TB_RDEST1.PJMC1 IS
'PJMC1';

COMMENT ON COLUMN TB_RDEST1.PJMC2 IS
'PJMC2';

COMMENT ON COLUMN TB_RDEST1.PUTER IS
'PUTER';

COMMENT ON COLUMN TB_RDEST1.PUTRCR IS
'PUTRCR';

COMMENT ON COLUMN TB_RDEST1.USGW IS
'USGW';

COMMENT ON COLUMN TB_RDEST1.USBG IS
'USBG';

COMMENT ON COLUMN TB_RDEST1.USWLT IS
'USWLT';

COMMENT ON COLUMN TB_RDEST1.INV IS
'INV';

ALTER TABLE TB_RDEST1
   ADD CONSTRAINT PK_TB_RDEST1 PRIMARY KEY (RPJINCD);

/*==============================================================*/
/* Index: FK__TB_RDEST1__                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_RDEST1__ ON TB_RDEST1 (
CNTCD
);

/*==============================================================*/
/* Table: TB_RDEST2                                             */
/*==============================================================*/
CREATE TABLE TB_RDEST2 (
RPJINCD              INT                  NOT NULL,
CNTCD                CHAR(6),
STADT                DATE,
STAPTE               DATE,
FLNO                 INT,
ARMPUT               NUMERIC(12,2),
MSSPUT               NUMERIC(12,2),
VENB                 NUMERIC(12,2),
PJMC                 NUMERIC(12,2),
PUTER                NUMERIC(12,2),
PUTRCR               NUMERIC(12,2),
USGW                 NUMERIC(12,2),
USBG                 NUMERIC(12,2),
USWLT                NUMERIC(12,2),
INV                  NUMERIC(12,2)
);

COMMENT ON TABLE TB_RDEST2 IS
'TB_RDEST2';

COMMENT ON COLUMN TB_RDEST2.RPJINCD IS
'RPJINCD';

COMMENT ON COLUMN TB_RDEST2.CNTCD IS
'������������';

COMMENT ON COLUMN TB_RDEST2.STADT IS
'STADT';

COMMENT ON COLUMN TB_RDEST2.STAPTE IS
'STAPTE';

COMMENT ON COLUMN TB_RDEST2.FLNO IS
'FLNO';

COMMENT ON COLUMN TB_RDEST2.ARMPUT IS
'ARMPUT';

COMMENT ON COLUMN TB_RDEST2.MSSPUT IS
'MSSPUT';

COMMENT ON COLUMN TB_RDEST2.VENB IS
'VENB';

COMMENT ON COLUMN TB_RDEST2.PJMC IS
'PJMC';

COMMENT ON COLUMN TB_RDEST2.PUTER IS
'PUTER';

COMMENT ON COLUMN TB_RDEST2.PUTRCR IS
'PUTRCR';

COMMENT ON COLUMN TB_RDEST2.USGW IS
'USGW';

COMMENT ON COLUMN TB_RDEST2.USBG IS
'USBG';

COMMENT ON COLUMN TB_RDEST2.USWLT IS
'USWLT';

COMMENT ON COLUMN TB_RDEST2.INV IS
'INV';

ALTER TABLE TB_RDEST2
   ADD CONSTRAINT PK_TB_RDEST2 PRIMARY KEY (RPJINCD);

/*==============================================================*/
/* Index: FK__TB_RDEST489                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_RDEST489 ON TB_RDEST2 (
CNTCD
);

/*==============================================================*/
/* Table: TB_RSR                                                */
/*==============================================================*/
CREATE TABLE TB_RSR (
PJRNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
DTCDT                DATE                 NOT NULL,
PJNM                 CHAR(40)             NOT NULL,
RSCLS                CHAR(6),
RV                   NUMERIC(12,2),
RZ                   NUMERIC(12,2),
RQ                   NUMERIC(12,2),
DFPFCN               VARCHAR(255),
DBSTBCN              VARCHAR(255),
BRBPPFCN             VARCHAR(255),
ESPFCN               VARCHAR(255),
EDDPFCN              VARCHAR(255),
GTHOPFCN             VARCHAR(255),
COMMCN               VARCHAR(255)
);

COMMENT ON TABLE TB_RSR IS
'ˮ������';

COMMENT ON COLUMN TB_RSR.PJRNO IS
'���б��';

COMMENT ON COLUMN TB_RSR.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_RSR.DTCDT IS
'���ʱ��';

COMMENT ON COLUMN TB_RSR.PJNM IS
'��������';

COMMENT ON COLUMN TB_RSR.RSCLS IS
'ˮ�����';

COMMENT ON COLUMN TB_RSR.RV IS
'��ǰ����';

COMMENT ON COLUMN TB_RSR.RZ IS
'��ǰ����ˮλ';

COMMENT ON COLUMN TB_RSR.RQ IS
'��ǰк��';

COMMENT ON COLUMN TB_RSR.DFPFCN IS
'�ӻ����״��';

COMMENT ON COLUMN TB_RSR.DBSTBCN IS
'�����ȶ����';

COMMENT ON COLUMN TB_RSR.BRBPPFCN IS
'���»����ȶ����';

COMMENT ON COLUMN TB_RSR.ESPFCN IS
'йˮ���������״��';

COMMENT ON COLUMN TB_RSR.EDDPFCN IS
'���ܹ����״��';

COMMENT ON COLUMN TB_RSR.GTHOPFCN IS
'բ�š����ջ����״��';

COMMENT ON COLUMN TB_RSR.COMMCN IS
'ͨѶ�ֶμ�״��';

ALTER TABLE TB_RSR
   ADD CONSTRAINT PK_TB_RSR PRIMARY KEY (PJRNO);

/*==============================================================*/
/* Index: FK__TB_RSR__PJN                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_RSR__PJN ON TB_RSR (
PJNO
);

/*==============================================================*/
/* Table: TB_SD                                                 */
/*==============================================================*/
CREATE TABLE TB_SD (
RPJINCD              INT                  NOT NULL,
WTTT                 CHAR(40)             NOT NULL,
WTDT                 DATE                 NOT NULL,
SDDSC                VARCHAR(1),
DISCU                VARCHAR(1),
WTDPCD               CHAR(40)             NOT NULL
);

COMMENT ON TABLE TB_SD IS
'����';

COMMENT ON COLUMN TB_SD.RPJINCD IS
'������';

COMMENT ON COLUMN TB_SD.WTTT IS
'�����';

COMMENT ON COLUMN TB_SD.WTDT IS
'�ʱ��';

COMMENT ON COLUMN TB_SD.SDDSC IS
'��������';

COMMENT ON COLUMN TB_SD.DISCU IS
'�ֺ�����';

COMMENT ON COLUMN TB_SD.WTDPCD IS
'���λ����';

ALTER TABLE TB_SD
   ADD CONSTRAINT PK_TB_SD PRIMARY KEY (RPJINCD);

/*==============================================================*/
/* Table: TB_SD_M                                               */
/*==============================================================*/
CREATE TABLE TB_SD_M (
ZLBM                 INT                  NOT NULL,
RPJINCD              INT,
DTCDT                DATE,
TITLE                CHAR(40),
WJGS                 CHAR(4),
NRMS                 VARCHAR(255),
LXZP                 VARCHAR(1)
);

COMMENT ON TABLE TB_SD_M IS
'�����ý������';

COMMENT ON COLUMN TB_SD_M.ZLBM IS
'���ϱ���';

COMMENT ON COLUMN TB_SD_M.RPJINCD IS
'������';

COMMENT ON COLUMN TB_SD_M.DTCDT IS
'�ɼ�ʱ��';

COMMENT ON COLUMN TB_SD_M.TITLE IS
'����';

COMMENT ON COLUMN TB_SD_M.WJGS IS
'�ļ���ʽ';

COMMENT ON COLUMN TB_SD_M.NRMS IS
'��������';

COMMENT ON COLUMN TB_SD_M.LXZP IS
'¼����Ƭ';

ALTER TABLE TB_SD_M
   ADD CONSTRAINT PK_TB_SD_M PRIMARY KEY (ZLBM);

/*==============================================================*/
/* Index: FK__TB_SD_M__12                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_SD_M__12 ON TB_SD_M (
RPJINCD
);

/*==============================================================*/
/* Table: TB_SEQUENCE                                           */
/*==============================================================*/
CREATE TABLE TB_SEQUENCE (
TABLENAME            CHAR(40)             NOT NULL,
NEXTVALUE            INT                  NOT NULL
);

COMMENT ON TABLE TB_SEQUENCE IS
'��������ÿ����Ĺؼ��ֶ����кš�';

COMMENT ON COLUMN TB_SEQUENCE.TABLENAME IS
'����';

COMMENT ON COLUMN TB_SEQUENCE.NEXTVALUE IS
'��ʹ�õ����';

/*==============================================================*/
/* Table: TB_SLDSC                                              */
/*==============================================================*/
CREATE TABLE TB_SLDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
SLBU                 INT,
SLUPAG               NUMERIC(12,2)
);

COMMENT ON TABLE TB_SLDSC IS
'����';

COMMENT ON COLUMN TB_SLDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_SLDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_SLDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_SLDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_SLDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_SLDSC.SLBU IS
'�������';

COMMENT ON COLUMN TB_SLDSC.SLUPAG IS
'������Ƕ�';

ALTER TABLE TB_SLDSC
   ADD CONSTRAINT PK_TB_SLDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_SLDSC__3                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_SLDSC__3 ON TB_SLDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_SLIDSC                                             */
/*==============================================================*/
CREATE TABLE TB_SLIDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
SLIAR                NUMERIC(12,2),
SLIMS                NUMERIC(12,2)
);

COMMENT ON TABLE TB_SLIDSC IS
'̮��';

COMMENT ON COLUMN TB_SLIDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_SLIDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_SLIDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_SLIDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_SLIDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_SLIDSC.SLIAR IS
'̮�����';

COMMENT ON COLUMN TB_SLIDSC.SLIMS IS
'̮������';

ALTER TABLE TB_SLIDSC
   ADD CONSTRAINT PK_TB_SLIDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_SLIDSC__                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_SLIDSC__ ON TB_SLIDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_SLUDSC                                             */
/*==============================================================*/
CREATE TABLE TB_SLUDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
SLUPAG               NUMERIC(12,2),
SLUDSP               NUMERIC(12,2),
SLUTP                VARCHAR(255),
SLUGLCN              VARCHAR(255)
);

COMMENT ON TABLE TB_SLUDSC IS
'����';

COMMENT ON COLUMN TB_SLUDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_SLUDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_SLUDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_SLUDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_SLUDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_SLUDSC.SLUPAG IS
'������Ƕ�';

COMMENT ON COLUMN TB_SLUDSC.SLUDSP IS
'����λ��';

COMMENT ON COLUMN TB_SLUDSC.SLUTP IS
'��������';

COMMENT ON COLUMN TB_SLUDSC.SLUGLCN IS
'������������';

ALTER TABLE TB_SLUDSC
   ADD CONSTRAINT PK_TB_SLUDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_SLUDSC__                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_SLUDSC__ ON TB_SLUDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_SPDSC                                              */
/*==============================================================*/
CREATE TABLE TB_SPDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
SPAR                 NUMERIC(12,2),
SPQ                  NUMERIC(12,2)
);

COMMENT ON TABLE TB_SPDSC IS
'��ˮ';

COMMENT ON COLUMN TB_SPDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_SPDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_SPDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_SPDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_SPDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_SPDSC.SPAR IS
'��ˮ���';

COMMENT ON COLUMN TB_SPDSC.SPQ IS
'��͸����';

ALTER TABLE TB_SPDSC
   ADD CONSTRAINT PK_TB_SPDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_SPDSC__4                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_SPDSC__4 ON TB_SPDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_ST                                                 */
/*==============================================================*/
CREATE TABLE TB_ST (
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
STNM                 CHAR(40)
);

COMMENT ON TABLE TB_ST IS
'������';

COMMENT ON COLUMN TB_ST.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_ST.STTPCD IS
'���������';

COMMENT ON COLUMN TB_ST.STNM IS
'����������';

ALTER TABLE TB_ST
   ADD CONSTRAINT PK_TB_ST PRIMARY KEY (PJNO, STTPCD);

/*==============================================================*/
/* Index: FK__TB_ST__PJNO                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_ST__PJNO ON TB_ST (
PJNO
);

/*==============================================================*/
/* Table: TB_STDNC                                              */
/*==============================================================*/
CREATE TABLE TB_STDNC (
DNCNO                INT                  NOT NULL,
XQFLDM               CHAR(4),
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40)             NOT NULL,
DNCGR                CHAR(8),
DAGPLCCH             VARCHAR(255),
DAGLO                VARCHAR(255),
RDEPL                VARCHAR(255),
RDERESCN             VARCHAR(255),
TPN                  INT,
PLAPN                INT,
PLIPN                INT,
RDECNRL              VARCHAR(255),
DNCCUAN              VARCHAR(255),
DNCESTDV             VARCHAR(255),
DNCPBNFZ             VARCHAR(255),
RZ                   NUMERIC(12,2),
WTHCN                VARCHAR(255),
FHYWTHCN             VARCHAR(255),
DNCADDSC             VARCHAR(255),
WTDPCD               CHAR(40)             NOT NULL,
WTDPDT               DATE                 NOT NULL
);

COMMENT ON TABLE TB_STDNC IS
'����';

COMMENT ON COLUMN TB_STDNC.DNCNO IS
'������';

COMMENT ON COLUMN TB_STDNC.XQFLDM IS
'����������';

COMMENT ON COLUMN TB_STDNC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_STDNC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_STDNC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_STDNC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_STDNC.DNCGR IS
'���鼶��';

COMMENT ON COLUMN TB_STDNC.DAGPLCCH IS
'���յص�׮��';

COMMENT ON COLUMN TB_STDNC.DAGLO IS
'���ղ�λ';

COMMENT ON COLUMN TB_STDNC.RDEPL IS
'���շ���';

COMMENT ON COLUMN TB_STDNC.RDERESCN IS
'������Դ�䱸';

COMMENT ON COLUMN TB_STDNC.TPN IS
'Ⱥ��Ͷ��';

COMMENT ON COLUMN TB_STDNC.PLAPN IS
'��ž�Ͷ��';

COMMENT ON COLUMN TB_STDNC.PLIPN IS
'�侯Ͷ��';

COMMENT ON COLUMN TB_STDNC.RDECNRL IS
'��չ�����';

COMMENT ON COLUMN TB_STDNC.DNCCUAN IS
'����ԭ�����';

COMMENT ON COLUMN TB_STDNC.DNCESTDV IS
'���鷢չ����';

COMMENT ON COLUMN TB_STDNC.DNCPBNFZ IS
'����Ӱ�췶Χ';

COMMENT ON COLUMN TB_STDNC.RZ IS
'��ǰ����ˮλ';

COMMENT ON COLUMN TB_STDNC.WTHCN IS
'����ʱ�������';

COMMENT ON COLUMN TB_STDNC.FHYWTHCN IS
'δ��ˮ���������';

COMMENT ON COLUMN TB_STDNC.DNCADDSC IS
'��������';

COMMENT ON COLUMN TB_STDNC.WTDPCD IS
'���λ����';

COMMENT ON COLUMN TB_STDNC.WTDPDT IS
'�ʱ��';

ALTER TABLE TB_STDNC
   ADD CONSTRAINT PK_TB_STDNC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_STDNC__2                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_STDNC__2 ON TB_STDNC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Index: FK__TB_STDNC__X                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_STDNC__X ON TB_STDNC (
XQFLDM
);

/*==============================================================*/
/* Table: TB_STDNC_M                                            */
/*==============================================================*/
CREATE TABLE TB_STDNC_M (
ZLBM                 INT                  NOT NULL,
DNCNO                INT,
DTCDT                DATE,
TITLE                CHAR(40),
WJGS                 CHAR(4),
NRMS                 VARCHAR(255),
LXZP                 VARCHAR(1)
);

COMMENT ON TABLE TB_STDNC_M IS
'�����ý������';

COMMENT ON COLUMN TB_STDNC_M.ZLBM IS
'���ϱ���';

COMMENT ON COLUMN TB_STDNC_M.DNCNO IS
'������';

COMMENT ON COLUMN TB_STDNC_M.DTCDT IS
'�ɼ�ʱ��';

COMMENT ON COLUMN TB_STDNC_M.TITLE IS
'����';

COMMENT ON COLUMN TB_STDNC_M.WJGS IS
'�ļ���ʽ';

COMMENT ON COLUMN TB_STDNC_M.NRMS IS
'��������';

COMMENT ON COLUMN TB_STDNC_M.LXZP IS
'¼����Ƭ';

ALTER TABLE TB_STDNC_M
   ADD CONSTRAINT PK_TB_STDNC_M PRIMARY KEY (ZLBM);

/*==============================================================*/
/* Index: FK__TB_24927208                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_24927208 ON TB_STDNC_M (
DNCNO
);

/*==============================================================*/
/* Table: TB_STOFLER                                            */
/*==============================================================*/
CREATE TABLE TB_STOFLER (
PJRNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
DTCDT                DATE                 NOT NULL,
PJNM                 CHAR(40)             NOT NULL,
BKOT                 CHAR(2),
DSFLWZ               NUMERIC(12,2),
DSFLW                NUMERIC(12,2),
TRFCN                VARCHAR(255),
DKCN                 VARCHAR(255),
CWFCCN               VARCHAR(255),
SFSRCN               VARCHAR(255),
FLFADSC              VARCHAR(255),
IDSTCN               VARCHAR(255)
);

COMMENT ON TABLE TB_STOFLER IS
'��ͣ��к�������';

COMMENT ON COLUMN TB_STOFLER.PJRNO IS
'���б��';

COMMENT ON COLUMN TB_STOFLER.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_STOFLER.DTCDT IS
'���ʱ��';

COMMENT ON COLUMN TB_STOFLER.PJNM IS
'��������';

COMMENT ON COLUMN TB_STOFLER.BKOT IS
'���ڰ���';

COMMENT ON COLUMN TB_STOFLER.DSFLWZ IS
'�����(��)��ˮλ';

COMMENT ON COLUMN TB_STOFLER.DSFLW IS
'�����(��)����';

COMMENT ON COLUMN TB_STOFLER.TRFCN IS
'��ͨ״��';

COMMENT ON COLUMN TB_STOFLER.DKCN IS
'�׵�״��';

COMMENT ON COLUMN TB_STOFLER.CWFCCN IS
'ͨѶԤ����ʩ״��';

COMMENT ON COLUMN TB_STOFLER.SFSRCN IS
'��ˮ������ʩ״��';

COMMENT ON COLUMN TB_STOFLER.FLFADSC IS
'�ֺ���ʩ״��';

COMMENT ON COLUMN TB_STOFLER.IDSTCN IS
'��ˮվ״��';

ALTER TABLE TB_STOFLER
   ADD CONSTRAINT PK_TB_STOFLER PRIMARY KEY (PJRNO);

/*==============================================================*/
/* Index: FK__TB_STOFLER_                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_STOFLER_ ON TB_STOFLER (
PJNO
);

/*==============================================================*/
/* Table: TB_STREXDSC                                           */
/*==============================================================*/
CREATE TABLE TB_STREXDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
MXTNST               NUMERIC(12,2),
MXCMST               NUMERIC(12,2),
CONGR                CHAR(10),
ASTR                 NUMERIC(12,2)
);

COMMENT ON TABLE TB_STREXDSC IS
'Ӧ������';

COMMENT ON COLUMN TB_STREXDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_STREXDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_STREXDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_STREXDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_STREXDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_STREXDSC.MXTNST IS
'�����Ӧ��';

COMMENT ON COLUMN TB_STREXDSC.MXCMST IS
'���ѹӦ��';

COMMENT ON COLUMN TB_STREXDSC.CONGR IS
'���������';

COMMENT ON COLUMN TB_STREXDSC.ASTR IS
'����Ӧ��ֵ';

ALTER TABLE TB_STREXDSC
   ADD CONSTRAINT PK_TB_STREXDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_STREXDSC                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_STREXDSC ON TB_STREXDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_UNDSC                                              */
/*==============================================================*/
CREATE TABLE TB_UNDSC (
DNCNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
STTPCD               INT                  NOT NULL,
DAGTM                DATE                 NOT NULL,
DNCNM                CHAR(40),
TODFTDI              NUMERIC(12,2),
UNDAR                NUMERIC(12,2),
UNDD                 NUMERIC(12,2),
UNDL                 NUMERIC(12,2)
);

COMMENT ON TABLE TB_UNDSC IS
'��ˢ';

COMMENT ON COLUMN TB_UNDSC.DNCNO IS
'������';

COMMENT ON COLUMN TB_UNDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_UNDSC.STTPCD IS
'���������';

COMMENT ON COLUMN TB_UNDSC.DAGTM IS
'����ʱ��';

COMMENT ON COLUMN TB_UNDSC.DNCNM IS
'��������';

COMMENT ON COLUMN TB_UNDSC.TODFTDI IS
'��̽ž���	';

COMMENT ON COLUMN TB_UNDSC.UNDAR IS
'��ˢ���';

COMMENT ON COLUMN TB_UNDSC.UNDD IS
'��ˢ���';

COMMENT ON COLUMN TB_UNDSC.UNDL IS
'��ˢ����';

ALTER TABLE TB_UNDSC
   ADD CONSTRAINT PK_TB_UNDSC PRIMARY KEY (DNCNO);

/*==============================================================*/
/* Index: FK__TB_UNDSC__3                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_UNDSC__3 ON TB_UNDSC (
PJNO,
STTPCD
);

/*==============================================================*/
/* Table: TB_USER                                               */
/*==============================================================*/
CREATE TABLE TB_USER (
NAME                 CHAR(8)              NOT NULL,
AUTH                 CHAR(1),
PASS                 CHAR(8),
NT                   VARCHAR(50)
);

COMMENT ON TABLE TB_USER IS
'�û��Ǽ�';

COMMENT ON COLUMN TB_USER.NAME IS
'�û�����';

COMMENT ON COLUMN TB_USER.AUTH IS
'�û�Ȩ��';

COMMENT ON COLUMN TB_USER.PASS IS
'����';

COMMENT ON COLUMN TB_USER.NT IS
'˵��';

ALTER TABLE TB_USER
   ADD CONSTRAINT PK_TB_USER PRIMARY KEY (NAME);

/*==============================================================*/
/* Table: TB_VP                                                 */
/*==============================================================*/
CREATE TABLE TB_VP (
LYDM                 CHAR(1)              NOT NULL,
LYMC                 CHAR(40)             NOT NULL,
SFDM                 CHAR(6)              NOT NULL,
SFMC                 CHAR(40)             NOT NULL
);

COMMENT ON TABLE TB_VP IS
'����ʡ�ݶ��ձ�';

COMMENT ON COLUMN TB_VP.LYDM IS
'�������';

COMMENT ON COLUMN TB_VP.LYMC IS
'��������';

COMMENT ON COLUMN TB_VP.SFDM IS
'ʡ�ݴ���';

COMMENT ON COLUMN TB_VP.SFMC IS
'ʡ������';

/*==============================================================*/
/* Table: TB_WDMPJRHS                                           */
/*==============================================================*/
CREATE TABLE TB_WDMPJRHS (
RPJINCD              INT                  NOT NULL,
CNTCD                CHAR(6),
STADT                DATE,
STAPTE               DATE,
CTCD                 CHAR(12),
DKL                  NUMERIC(12,2),
BPL                  NUMERIC(12,2),
BT                   INT,
CLVGT                INT,
VALL                 INT,
RSL                  INT,
RSM                  INT,
RSS                  INT,
NTSTA                INT,
CMERMS               NUMERIC(12,2),
TERPER               NUMERIC(12,2),
CMRCKMS              NUMERIC(12,2),
TRCKPER              NUMERIC(12,2),
CMCONMS              NUMERIC(12,2),
TCONPER              NUMERIC(12,2),
CMFU                 NUMERIC(12,2),
TFUPER               NUMERIC(12,2)
);

COMMENT ON TABLE TB_WDMPJRHS IS
'ˮ�ٹ����޸�����ͳ��';

COMMENT ON COLUMN TB_WDMPJRHS.RPJINCD IS
'RPJINCD';

COMMENT ON COLUMN TB_WDMPJRHS.CNTCD IS
'������������';

COMMENT ON COLUMN TB_WDMPJRHS.STADT IS
'ͳ������';

COMMENT ON COLUMN TB_WDMPJRHS.STAPTE IS
'ͳ��ʱ��ֹ';

COMMENT ON COLUMN TB_WDMPJRHS.CTCD IS
'�������';

COMMENT ON COLUMN TB_WDMPJRHS.DKL IS
'�̷�����';

COMMENT ON COLUMN TB_WDMPJRHS.BPL IS
'��������';

COMMENT ON COLUMN TB_WDMPJRHS.BT IS
'���';

COMMENT ON COLUMN TB_WDMPJRHS.CLVGT IS
'��բ';

COMMENT ON COLUMN TB_WDMPJRHS.VALL IS
'����';

COMMENT ON COLUMN TB_WDMPJRHS.RSL IS
'����ˮ��';

COMMENT ON COLUMN TB_WDMPJRHS.RSM IS
'����ˮ��';

COMMENT ON COLUMN TB_WDMPJRHS.RSS IS
'С��ˮ��';

COMMENT ON COLUMN TB_WDMPJRHS.NTSTA IS
'�������͹���';

COMMENT ON COLUMN TB_WDMPJRHS.CMERMS IS
'�ƻ��������';

COMMENT ON COLUMN TB_WDMPJRHS.TERPER IS
'��������ٷ���';

COMMENT ON COLUMN TB_WDMPJRHS.CMRCKMS IS
'�ƻ����ʯ��';

COMMENT ON COLUMN TB_WDMPJRHS.TRCKPER IS
'���ʯ���ٷ���';

COMMENT ON COLUMN TB_WDMPJRHS.CMCONMS IS
'�ƻ���ɻ���������';

COMMENT ON COLUMN TB_WDMPJRHS.TCONPER IS
'��ɻ��������ٷ���';

COMMENT ON COLUMN TB_WDMPJRHS.CMFU IS
'�ƻ����ʽ�';

COMMENT ON COLUMN TB_WDMPJRHS.TFUPER IS
'��ʹ���ʽ�ٷ���';

ALTER TABLE TB_WDMPJRHS
   ADD CONSTRAINT PK_TB_WDMPJRHS PRIMARY KEY (RPJINCD);

/*==============================================================*/
/* Index: FK__TB_WDMPJ286                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_WDMPJ286 ON TB_WDMPJRHS (
CNTCD
);

/*==============================================================*/
/* Table: TB_WDMPJS                                             */
/*==============================================================*/
CREATE TABLE TB_WDMPJS (
RPJINCD              INT                  NOT NULL,
CNTCD                CHAR(6),
STADT                DATE,
STAPTE               DATE,
CTCD                 CHAR(12),
DKL                  NUMERIC(12,2),
BPL                  NUMERIC(12,2),
BT                   INT,
CLVGT                INT,
VALL                 INT,
RSL                  INT,
RSM                  INT,
RSS                  INT,
NTSTA                INT,
ECLS                 NUMERIC(12,2)
);

COMMENT ON TABLE TB_WDMPJS IS
'TB_WDMPJS';

COMMENT ON COLUMN TB_WDMPJS.RPJINCD IS
'RPJINCD';

COMMENT ON COLUMN TB_WDMPJS.CNTCD IS
'������������';

COMMENT ON COLUMN TB_WDMPJS.STADT IS
'STADT';

COMMENT ON COLUMN TB_WDMPJS.STAPTE IS
'STAPTE';

COMMENT ON COLUMN TB_WDMPJS.CTCD IS
'CTCD';

COMMENT ON COLUMN TB_WDMPJS.DKL IS
'DKL';

COMMENT ON COLUMN TB_WDMPJS.BPL IS
'BPL';

COMMENT ON COLUMN TB_WDMPJS.BT IS
'BT';

COMMENT ON COLUMN TB_WDMPJS.CLVGT IS
'CLVGT';

COMMENT ON COLUMN TB_WDMPJS.VALL IS
'VALL';

COMMENT ON COLUMN TB_WDMPJS.RSL IS
'RSL';

COMMENT ON COLUMN TB_WDMPJS.RSM IS
'RSM';

COMMENT ON COLUMN TB_WDMPJS.RSS IS
'RSS';

COMMENT ON COLUMN TB_WDMPJS.NTSTA IS
'NTSTA';

COMMENT ON COLUMN TB_WDMPJS.ECLS IS
'ECLS';

ALTER TABLE TB_WDMPJS
   ADD CONSTRAINT PK_TB_WDMPJS PRIMARY KEY (RPJINCD);

/*==============================================================*/
/* Index: FK__TB_WDMPJS__                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_WDMPJS__ ON TB_WDMPJS (
CNTCD
);

/*==============================================================*/
/* Table: TB_WDMPJS1                                            */
/*==============================================================*/
CREATE TABLE TB_WDMPJS1 (
RPJINCD              INT                  NOT NULL,
CNTCD                CHAR(6),
STADT                DATE,
STAPTE               DATE,
FLNO                 INT,
PJNM                 CHAR(40),
WDNER                NUMERIC(12,2),
WDNRCK               NUMERIC(12,2),
LSINV                NUMERIC(12,2),
NT                   CHAR(40)
);

COMMENT ON TABLE TB_WDMPJS1 IS
'TB_WDMPJS1';

COMMENT ON COLUMN TB_WDMPJS1.RPJINCD IS
'RPJINCD';

COMMENT ON COLUMN TB_WDMPJS1.CNTCD IS
'������������';

COMMENT ON COLUMN TB_WDMPJS1.STADT IS
'STADT';

COMMENT ON COLUMN TB_WDMPJS1.STAPTE IS
'STAPTE';

COMMENT ON COLUMN TB_WDMPJS1.FLNO IS
'FLNO';

COMMENT ON COLUMN TB_WDMPJS1.PJNM IS
'PJNM';

COMMENT ON COLUMN TB_WDMPJS1.WDNER IS
'WDNER';

COMMENT ON COLUMN TB_WDMPJS1.WDNRCK IS
'WDNRCK';

COMMENT ON COLUMN TB_WDMPJS1.LSINV IS
'LSINV';

COMMENT ON COLUMN TB_WDMPJS1.NT IS
'NT';

ALTER TABLE TB_WDMPJS1
   ADD CONSTRAINT PK_TB_WDMPJS1 PRIMARY KEY (RPJINCD);

/*==============================================================*/
/* Index: FK__TB_WDMPJ532                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_WDMPJ532 ON TB_WDMPJS1 (
CNTCD
);

/*==============================================================*/
/* Table: TB_WDMPJS2                                            */
/*==============================================================*/
CREATE TABLE TB_WDMPJS2 (
RPJINCD              INT                  NOT NULL,
CNTCD                CHAR(6),
STADT                DATE,
STAPTE               DATE,
FLNO                 INT,
LSCMEQQU             NUMERIC(12,2),
LSCMEQIN             NUMERIC(12,2),
LSGNR                NUMERIC(12,2),
LSTRT                NUMERIC(12,2),
LSWRP                NUMERIC(12,2),
LSCB                 NUMERIC(12,2),
LSYW                 NUMERIC(12,2),
LSINV                NUMERIC(12,2)
);

COMMENT ON TABLE TB_WDMPJS2 IS
'TB_WDMPJS2';

COMMENT ON COLUMN TB_WDMPJS2.RPJINCD IS
'RPJINCD';

COMMENT ON COLUMN TB_WDMPJS2.CNTCD IS
'������������';

COMMENT ON COLUMN TB_WDMPJS2.STADT IS
'STADT';

COMMENT ON COLUMN TB_WDMPJS2.STAPTE IS
'STAPTE';

COMMENT ON COLUMN TB_WDMPJS2.FLNO IS
'FLNO';

COMMENT ON COLUMN TB_WDMPJS2.LSCMEQQU IS
'LSCMEQQU';

COMMENT ON COLUMN TB_WDMPJS2.LSCMEQIN IS
'LSCMEQIN';

COMMENT ON COLUMN TB_WDMPJS2.LSGNR IS
'LSGNR';

COMMENT ON COLUMN TB_WDMPJS2.LSTRT IS
'LSTRT';

COMMENT ON COLUMN TB_WDMPJS2.LSWRP IS
'LSWRP';

COMMENT ON COLUMN TB_WDMPJS2.LSCB IS
'LSCB';

COMMENT ON COLUMN TB_WDMPJS2.LSYW IS
'LSYW';

COMMENT ON COLUMN TB_WDMPJS2.LSINV IS
'LSINV';

ALTER TABLE TB_WDMPJS2
   ADD CONSTRAINT PK_TB_WDMPJS2 PRIMARY KEY (RPJINCD);

/*==============================================================*/
/* Index: FK__TB_WDMPJS_2                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_WDMPJS_2 ON TB_WDMPJS2 (
CNTCD
);

/*==============================================================*/
/* Table: TB_WLR                                                */
/*==============================================================*/
CREATE TABLE TB_WLR (
PJRNO                INT                  NOT NULL,
PJNO                 INT                  NOT NULL,
DTCDT                DATE                 NOT NULL,
PJNM                 CHAR(40)             NOT NULL,
WLGR                 CHAR(2),
RUPGZ                NUMERIC(12,2),
RDWGZ                NUMERIC(12,2),
RQO                  NUMERIC(12,2),
RWSTOWLT             NUMERIC(12,2),
GFPFCN               VARCHAR(255),
STPFCN               VARCHAR(255),
EDDPFCN              VARCHAR(255),
GTHOPFCN             VARCHAR(255),
COMMCN               VARCHAR(255)
);

COMMENT ON TABLE TB_WLR IS
'ˮբ����';

COMMENT ON COLUMN TB_WLR.PJRNO IS
'���б��';

COMMENT ON COLUMN TB_WLR.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_WLR.DTCDT IS
'���ʱ��';

COMMENT ON COLUMN TB_WLR.PJNM IS
'��������';

COMMENT ON COLUMN TB_WLR.WLGR IS
'ˮբ�ȱ�';

COMMENT ON COLUMN TB_WLR.RUPGZ IS
'��ǰբ��ˮλ';

COMMENT ON COLUMN TB_WLR.RDWGZ IS
'��ǰբ��ˮλ';

COMMENT ON COLUMN TB_WLR.RQO IS
'��ǰ��բ����';

COMMENT ON COLUMN TB_WLR.RWSTOWLT IS
'��ǰˮ���բ������';

COMMENT ON COLUMN TB_WLR.GFPFCN IS
'�ӻ����״��';

COMMENT ON COLUMN TB_WLR.STPFCN IS
'���������״��';

COMMENT ON COLUMN TB_WLR.EDDPFCN IS
'���ܹ����״��';

COMMENT ON COLUMN TB_WLR.GTHOPFCN IS
'բ�š����ջ����״��';

COMMENT ON COLUMN TB_WLR.COMMCN IS
'ͨѶ�ֶμ�״��';

ALTER TABLE TB_WLR
   ADD CONSTRAINT PK_TB_WLR PRIMARY KEY (PJRNO);

/*==============================================================*/
/* Index: FK__TB_WLR__PJN                                       */
/*==============================================================*/
CREATE  INDEX FK__TB_WLR__PJN ON TB_WLR (
PJNO
);

/*==============================================================*/
/* Table: TB_WT                                                 */
/*==============================================================*/
CREATE TABLE TB_WT (
WTDPCD               CHAR(40)             NOT NULL,
WTDPNM               CHAR(40),
WTDPTY               CHAR(8),
WT                   CHAR(8),
REPH                 CHAR(14)
);

COMMENT ON TABLE TB_WT IS
'���λ';

COMMENT ON COLUMN TB_WT.WTDPCD IS
'���λ����';

COMMENT ON COLUMN TB_WT.WTDPNM IS
'���λ����';

COMMENT ON COLUMN TB_WT.WTDPTY IS
'���λ������';

COMMENT ON COLUMN TB_WT.WT IS
'���';

COMMENT ON COLUMN TB_WT.REPH IS
'��ϵ�绰';

ALTER TABLE TB_WT
   ADD CONSTRAINT PK_TB_WT PRIMARY KEY (WTDPCD);

/*==============================================================*/
/* Table: TB_XQFL                                               */
/*==============================================================*/
CREATE TABLE TB_XQFL (
XQFLDM               CHAR(4)              NOT NULL,
XQFLMC               CHAR(40),
TBNAME               CHAR(40)
);

COMMENT ON TABLE TB_XQFL IS
'�������';

COMMENT ON COLUMN TB_XQFL.XQFLDM IS
'����������';

COMMENT ON COLUMN TB_XQFL.XQFLMC IS
'�����������';

COMMENT ON COLUMN TB_XQFL.TBNAME IS
'TBNAME';

ALTER TABLE TB_XQFL
   ADD CONSTRAINT PK_TB_XQFL PRIMARY KEY (XQFLDM);

/*==============================================================*/
/* Table: V_HOME                                                */
/*==============================================================*/
CREATE TABLE V_HOME (
TITLE                CHAR(40)             NOT NULL,
WTDPDT               DATE                 NOT NULL,
WTDPCD               CHAR(40)             NOT NULL,
FENLEI               CHAR(8)              NOT NULL,
FENLEI1              CHAR(8),
NUM                  INT                  NOT NULL,
TBNAME               CHAR(10)             NOT NULL
);

COMMENT ON TABLE V_HOME IS
'���¹�����ͼ';

COMMENT ON COLUMN V_HOME.TITLE IS
'TITLE';

COMMENT ON COLUMN V_HOME.WTDPDT IS
'WTDPDT';

COMMENT ON COLUMN V_HOME.WTDPCD IS
'WTDPCD';

COMMENT ON COLUMN V_HOME.FENLEI IS
'FENLEI';

COMMENT ON COLUMN V_HOME.FENLEI1 IS
'FENLEI1';

COMMENT ON COLUMN V_HOME.NUM IS
'NUM';

COMMENT ON COLUMN V_HOME.TBNAME IS
'TBNAME';

CREATE TABLE TB_TORRENTS(
	DNCNO INT NOT NULL,	--������
	PJNO INT NOT NULL,	--���̱��
	STTPCD INT NOT NULL,	--���������
	DAGTM DATE,	--����ʱ��
	DNCNM CHAR(40),	--��������
	DSSPN INT,	--�����˿�(��)
	DSSAREA NUMERIC(12,2),	--�������
	DTHPN INT,	--�����˿�
	WRHS INT,	--��������
	DRCECLS NUMERIC(12,2),	--������ʧ
	DAYDP NUMERIC(12,2),	--���������
	TDP NUMERIC(12,2),	--ʱ���������
	DSSTP CHAR(40)	--�ֺ�����
);

ALTER TABLE TB_BCSTSDST
   ADD CONSTRAINT FK_TB_BCSTS_FK_ FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_BCSTSDST
   ADD CONSTRAINT FK_TB_BCSTS_FK2 FOREIGN KEY (TB__CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_BLBADSC
   ADD CONSTRAINT FK_TB_BLBAD_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_BRDMDSC
   ADD CONSTRAINT FK_TB_BRDMD_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_BSWPLPDS
   ADD CONSTRAINT FK_TB_BSWPL_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_BSWRDSC
   ADD CONSTRAINT FK_TB_BSWRD_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_BURDSC
   ADD CONSTRAINT FK_TB_BURDS_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_CLPJPRWR
   ADD CONSTRAINT FK_TB_CLPJP_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_CLPJSCDN
   ADD CONSTRAINT FK_TB_CLPJS_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_COWAPJ
   ADD CONSTRAINT FK_TB_COWAP_FK_ FOREIGN KEY (PJNO)
      REFERENCES TB_PJ (PJNO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_CRDSC
   ADD CONSTRAINT FK_TB_CRDSC_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_CVDSC
   ADD CONSTRAINT FK_TB_CVDSC_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_DKDNCSTA1
   ADD CONSTRAINT FK_TB_DKDNC_FK2 FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_DKDNCSTA2
   ADD CONSTRAINT FK_TB_DKDNC_FK_ FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_DKR
   ADD CONSTRAINT FK_TB_DKR_FK__T FOREIGN KEY (PJNO)
      REFERENCES TB_PJ (PJNO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_DKSNWS
   ADD CONSTRAINT FK_TB_DKSNW_FK_ FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_EDDWRDSC
   ADD CONSTRAINT FK_TB_EDDWR_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_FPACTI_M
   ADD CONSTRAINT FK_TB_FPACT_FK_ FOREIGN KEY (RPJINCD)
      REFERENCES TB_FPACTI (RPJINCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_FXJB_M
   ADD CONSTRAINT FK_TB_FXJB__FK_ FOREIGN KEY (RPJINCD)
      REFERENCES TB_FXJB (RPJINCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_GTWRDSC
   ADD CONSTRAINT FK_TB_GTWRD_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_HBWRDSC
   ADD CONSTRAINT FK_TB_HBWRD_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_HOMLFDSC
   ADD CONSTRAINT FK_TB_HOMLF_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_LKDSC
   ADD CONSTRAINT FK_TB_LKDSC_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_OVFLDSC
   ADD CONSTRAINT FK_TB_OVFLD_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_OVTUDSC
   ADD CONSTRAINT FK_TB_OVTUD_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_PITDSC
   ADD CONSTRAINT FK_TB_PITDS_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_PJ
   ADD CONSTRAINT FK_TB_PJ_FK__TB FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_PJRCN
   ADD CONSTRAINT FK_TB_PJRCN_FK_ FOREIGN KEY (GCFLDM)
      REFERENCES TB_GCLB (GCFLDM)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_PJRCN
   ADD CONSTRAINT FK_TB_PJRCN_FK2 FOREIGN KEY (PJNO)
      REFERENCES TB_PJ (PJNO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_PJR_M
   ADD CONSTRAINT FK_TB_PJR_M_FK_ FOREIGN KEY (PJRNO)
      REFERENCES TB_PJRCN (PJRNO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_PLUDSC
   ADD CONSTRAINT FK_TB_PLUDS_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_PPDSC
   ADD CONSTRAINT FK_TB_PPDSC_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_QT_M
   ADD CONSTRAINT FK_TB_QT_M_FK__ FOREIGN KEY (RPJINCD)
      REFERENCES TB_QT (RPJINCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_RDEST1
   ADD CONSTRAINT FK_TB_RDEST_FK2 FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_RDEST2
   ADD CONSTRAINT FK_TB_RDEST_FK_ FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_RSR
   ADD CONSTRAINT FK_TB_RSR_FK__T FOREIGN KEY (PJNO)
      REFERENCES TB_PJ (PJNO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_SD_M
   ADD CONSTRAINT FK_TB_SD_M_FK__ FOREIGN KEY (RPJINCD)
      REFERENCES TB_SD (RPJINCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_SLDSC
   ADD CONSTRAINT FK_TB_SLDSC_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_SLIDSC
   ADD CONSTRAINT FK_TB_SLIDS_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_SLUDSC
   ADD CONSTRAINT FK_TB_SLUDS_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_SPDSC
   ADD CONSTRAINT FK_TB_SPDSC_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_ST
   ADD CONSTRAINT FK_TB_ST_FK__TB FOREIGN KEY (PJNO)
      REFERENCES TB_PJ (PJNO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_STDNC
   ADD CONSTRAINT FK_TB_STDNC_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_STDNC
   ADD CONSTRAINT FK_TB_STDNC_FK2 FOREIGN KEY (XQFLDM)
      REFERENCES TB_XQFL (XQFLDM)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_STDNC_M
   ADD CONSTRAINT FK_TB_STDNC_FK3 FOREIGN KEY (DNCNO)
      REFERENCES TB_STDNC (DNCNO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_STOFLER
   ADD CONSTRAINT FK_TB_STOFL_FK_ FOREIGN KEY (PJNO)
      REFERENCES TB_PJ (PJNO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_STREXDSC
   ADD CONSTRAINT FK_TB_STREX_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_UNDSC
   ADD CONSTRAINT FK_TB_UNDSC_FK_ FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_WDMPJRHS
   ADD CONSTRAINT FK_TB_WDMPJ_FK2 FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_WDMPJS
   ADD CONSTRAINT FK_TB_WDMPJ_FK3 FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_WDMPJS1
   ADD CONSTRAINT FK_TB_WDMPJ_FK4 FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_WDMPJS2
   ADD CONSTRAINT FK_TB_WDMPJ_FK_ FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TB_WLR
   ADD CONSTRAINT FK_TB_WLR_FK__T FOREIGN KEY (PJNO)
      REFERENCES TB_PJ (PJNO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

