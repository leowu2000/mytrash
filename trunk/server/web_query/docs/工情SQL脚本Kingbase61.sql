/*==============================================================*/
/* DBMS name:      KingbaseES 6                                 */
/* Created on:     2009-9-19 16:50:28                           */
/*==============================================================*/


DROP TABLE TB_BCSTSDST;

DROP TABLE TB_BLBADSC;

DROP TABLE TB_BRDMDSC;

DROP TABLE TB_BSWPLPDS;

DROP TABLE TB_BSWRDSC;

DROP TABLE TB_BURDSC;

DROP TABLE TB_CLPJPRWR;

DROP TABLE TB_CLPJSCDN;

DROP TABLE TB_CNT;

DROP TABLE TB_COWAPJ;

DROP TABLE TB_CRDSC;

DROP TABLE TB_CVDSC;

DROP TABLE TB_DKDNCSTA1;

DROP TABLE TB_DKDNCSTA2;

DROP TABLE TB_DKR;

DROP TABLE TB_DKSNWS;

DROP TABLE TB_EDDWRDSC;

DROP TABLE TB_FPACTI;

DROP TABLE TB_FPACTI_M;

DROP TABLE TB_FXJB;

DROP TABLE TB_FXJB_M;

DROP TABLE TB_GCLB;

DROP TABLE TB_GTWRDSC;

DROP TABLE TB_HBWRDSC;

DROP TABLE TB_HOMLFDSC;

DROP TABLE TB_HS;

DROP TABLE TB_HS_M;

DROP TABLE TB_HYWDMS;

DROP TABLE TB_JZWFL;

DROP TABLE TB_LKDSC;

DROP TABLE TB_LYSX;

DROP TABLE TB_LYSX1;

DROP TABLE TB_OVFLDSC;

DROP TABLE TB_OVTUDSC;

DROP TABLE TB_PICKREC;

DROP TABLE TB_PITDSC;

DROP TABLE TB_PJ;

DROP TABLE TB_PJRCN;

DROP TABLE TB_PJR_M;

DROP TABLE TB_PLUDSC;

DROP TABLE TB_PPDSC;

DROP TABLE TB_QT;

DROP TABLE TB_QT_M;

DROP TABLE TB_RDEST1;

DROP TABLE TB_RDEST2;

DROP TABLE TB_RSR;

DROP TABLE TB_SD;

DROP TABLE TB_SD_M;

DROP TABLE TB_SEQUENCE;

DROP TABLE TB_SLDSC;

DROP TABLE TB_SLIDSC;

DROP TABLE TB_SLUDSC;

DROP TABLE TB_SPDSC;

DROP TABLE TB_ST;

DROP TABLE TB_STDNC;

DROP TABLE TB_STDNC_M;

DROP TABLE TB_STOFLER;

DROP TABLE TB_STREXDSC;

DROP TABLE TB_UNDSC;

DROP TABLE TB_USER;

DROP TABLE TB_VP;

DROP TABLE TB_WDMPJRHS;

DROP TABLE TB_WDMPJS;

DROP TABLE TB_WDMPJS1;

DROP TABLE TB_WDMPJS2;

DROP TABLE TB_WLR;

DROP TABLE TB_WT;

DROP TABLE TB_XQFL;

/*==============================================================*/
/* Table: TB_BCSTSDST                                           */
/*==============================================================*/
CREATE TABLE TB_BCSTSDST (
RPJINCD              INT                  not null,
STADT                TIMESTAMP,
STAPTE               TIMESTAMP,
FLNO                 INT,
DSTCT                CHAR(6),
CNTCD                CHAR(6),
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
LCARRPPL             INT,
CONSTRAINT PK__TB_BCSTSDST__1F98B2C1 PRIMARY KEY (RPJINCD)
);

/*==============================================================*/
/* Table: TB_BLBADSC                                            */
/*==============================================================*/
CREATE TABLE TB_BLBADSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
WDQ                  DECIMAL(12,2),
BLH                  DECIMAL(12,2),
WNS                  DECIMAL(12,2),
CONSTRAINT PK__TB_BLBADSC__4316F928 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_BRDMDSC                                            */
/*==============================================================*/
CREATE TABLE TB_BRDMDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
BRDMW                DECIMAL(12,2),
PJPS                 VARCHAR(255),
BRZDMCDI             DECIMAL(12,2),
BRV                  DECIMAL(12,2),
BRDMQ                DECIMAL(12,2),
BRDMLDGL             VARCHAR(255),
DSSPN                INT,
INPN                 INT,
DTHPN                INT,
WRHS                 INT,
CRPDSSAR             DECIMAL(12,2),
SCDMFMAR             DECIMAL(12,2),
DRCECLS              DECIMAL(12,2),
CONSTRAINT PK__TB_BRDMDSC__4E88ABD4 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_BSWPLPDS                                           */
/*==============================================================*/
CREATE TABLE TB_BSWPLPDS (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
WPPLU                CHAR(50),
WPEQML               CHAR(50),
CONSTRAINT PK__TB_BSWPLPDS__628FA481 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_BSWRDSC                                            */
/*==============================================================*/
CREATE TABLE TB_BSWRDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
GRNSPDSC             VARCHAR(255),
GRNUSB               DECIMAL(12,2),
GROVCHWR             VARCHAR(255),
CONSTRAINT PK__TB_BSWRDSC__5CD6CB2B PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_BURDSC                                             */
/*==============================================================*/
CREATE TABLE TB_BURDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
BUW                  DECIMAL(12,2),
BUVL                 DECIMAL(12,2),
BUZDF                DECIMAL(12,2),
BUQ                  DECIMAL(12,2),
BURLDGL              VARCHAR(255),
DSSPN                INT,
INPN                 INT,
DTHPN                INT,
WRHS                 INT,
CRPDSSAR             DECIMAL(12,2),
SCDMFMAR             DECIMAL(12,2),
DRCECLS              DECIMAL(12,2),
CONSTRAINT PK__TB_BURDSC__267ABA7A PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_CLPJPRWR                                           */
/*==============================================================*/
CREATE TABLE TB_CLPJPRWR (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
WRAR                 DECIMAL(12,2),
WRD                  DECIMAL(12,2),
WRL                  DECIMAL(12,2),
WRGLCN               VARCHAR(255),
CONSTRAINT PK__TB_CLPJPRWR__68487DD7 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_CLPJSCDN                                           */
/*==============================================================*/
CREATE TABLE TB_CLPJSCDN (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
SCDMBU               INT,
SCDML                INT,
SCDMD                DECIMAL(12,2),
SCDMGLCN             VARCHAR(255),
CONSTRAINT PK__TB_CLPJSCDN__6B24EA82 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_CNT                                                */
/*==============================================================*/
CREATE TABLE TB_CNT (
CNTCD                CHAR(6)              not null,
PROVNM               CHAR(40),
CONSTRAINT PK__TB_CNT__03317E3D PRIMARY KEY (CNTCD)
);

/*==============================================================*/
/* Table: TB_COWAPJ                                             */
/*==============================================================*/
CREATE TABLE TB_COWAPJ (
PJRNO                INT                  not null,
PJNO                 INT                  not null,
DTCDT                TIMESTAMP            not null,
PJNM                 CHAR(40)             not null,
BKOT                 CHAR(2),
FLCNDSC              VARCHAR(255),
WDCNDSC              VARCHAR(255),
PRCCLR               VARCHAR(255),
SPURDSC              VARCHAR(255),
BPPJCN               VARCHAR(255),
CONSTRAINT PK__TB_COWAPJ__173876EA PRIMARY KEY (PJRNO)
);

/*==============================================================*/
/* Table: TB_CRDSC                                              */
/*==============================================================*/
CREATE TABLE TB_CRDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
CRDR                 CHAR(40),
CRD                  DECIMAL(12,2),
CRL                  DECIMAL(12,2),
CRW                  DECIMAL(12,2),
CONSTRAINT PK__TB_CRDSC__3A81B327 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_CVDSC                                              */
/*==============================================================*/
CREATE TABLE TB_CVDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
TODFTDI              DECIMAL(12,2),
WDQ                  DECIMAL(12,2),
CVL                  DECIMAL(12,2),
CVBU                 INT,
RVH                  DECIMAL(12,2),
FLCNDSC              VARCHAR(255),
CONSTRAINT PK__TB_CVDSC__3D5E1FD2 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_DKDNCSTA1                                          */
/*==============================================================*/
CREATE TABLE TB_DKDNCSTA1 (
RPJINCD              INT                  not null,
STADT                TIMESTAMP,
STAPTE               TIMESTAMP,
CNTCD                CHAR(6),
FLNO                 INT,
LKQU                 INT,
LKNB                 INT,
PPQU                 INT,
PPMQU                DECIMAL(12,2),
PITQU                INT,
SLQU                 INT,
SLMQU                DECIMAL(12,2),
UNQU                 INT,
UNMQU                DECIMAL(12,2),
CRQU                 INT,
CRMQU                DECIMAL(12,2),
SPQU                 INT,
SPMQU                DECIMAL(12,2),
SLIQU                INT,
CONSTRAINT PK__TB_DKDNCSTA1__0F624AF8 PRIMARY KEY (RPJINCD)
);

/*==============================================================*/
/* Table: TB_DKDNCSTA2                                          */
/*==============================================================*/
CREATE TABLE TB_DKDNCSTA2 (
RPJINCD              INT                  not null,
STADT                TIMESTAMP,
STAPTE               TIMESTAMP,
CNTCD                CHAR(6),
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
KDZDBC               INT,
CONSTRAINT PK__TB_DKDNCSTA2__123EB7A3 PRIMARY KEY (RPJINCD)
);

/*==============================================================*/
/* Table: TB_DKR                                                */
/*==============================================================*/
CREATE TABLE TB_DKR (
PJRNO                INT                  not null,
PJNO                 INT                  not null,
DTCDT                TIMESTAMP            not null,
PJNM                 CHAR(40)             not null,
DKGR                 CHAR(1),
BKOT                 CHAR(2),
STECH                CHAR(40),
RZ                   DECIMAL(12,2),
RQ                   DECIMAL(12,2),
WSTODC               DECIMAL(12,2),
DKPFCN               VARCHAR(255),
TSCN                 VARCHAR(255),
BRBPPFCN             VARCHAR(255),
CONSTRAINT PK__TB_DKR__0EA330E9 PRIMARY KEY (PJRNO)
);

/*==============================================================*/
/* Table: TB_DKSNWS                                             */
/*==============================================================*/
CREATE TABLE TB_DKSNWS (
RPJINCD              INT                  not null,
STADT                TIMESTAMP,
STAPTE               TIMESTAMP,
FLNO                 INT,
CNTCD                CHAR(6),
STPCH                CHAR(40),
TRPCH                CHAR(40),
DAGPJL               DECIMAL(12,2),
DAGPJD               DECIMAL(12,2),
BNL                  DECIMAL(12,2),
BND                  DECIMAL(12,2),
CONSTRAINT PK__TB_DKSNWS__151B244E PRIMARY KEY (RPJINCD)
);

/*==============================================================*/
/* Table: TB_EDDWRDSC                                           */
/*==============================================================*/
CREATE TABLE TB_EDDWRDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
APWR                 VARCHAR(255),
WSTWR                VARCHAR(255),
CONSTRAINT PK__TB_EDDWRDSC__5FB337D6 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_FPACTI                                             */
/*==============================================================*/
CREATE TABLE TB_FPACTI (
RPJINCD              INT                  not null,
WTTT                 CHAR(40)             not null,
WTDT                 TIMESTAMP            not null,
ACTICO               TEXT,
WTDPCD               CHAR(40)             not null,
CONSTRAINT PK__TB_FPACTI__6E01572D PRIMARY KEY (RPJINCD)
);

/*==============================================================*/
/* Table: TB_FPACTI_M                                           */
/*==============================================================*/
CREATE TABLE TB_FPACTI_M (
ZLBM                 INT                  not null,
RPJINCD              INT,
DTCDT                TIMESTAMP,
TITLE                CHAR(40),
WJGS                 CHAR(4),
NRMS                 VARCHAR(255),
LXZP                 BLOB,
CONSTRAINT PK__TB_FPACTI_M__6FE99F9F PRIMARY KEY (ZLBM)
);

/*==============================================================*/
/* Table: TB_FXJB                                               */
/*==============================================================*/
CREATE TABLE TB_FXJB (
RPJINCD              INT                  not null,
ISSUE                INT                  not null,
WTTT                 CHAR(255)            not null,
WTDT                 TIMESTAMP            not null,
ACTICO               TEXT,
NT1                  TEXT,
QF                   CHAR(8),
SH                   CHAR(8),
NG                   CHAR(8),
WTDPCD               CHAR(40)             not null,
CONSTRAINT PK__TB_FXJB__72C60C4A PRIMARY KEY (RPJINCD)
);

/*==============================================================*/
/* Table: TB_FXJB_M                                             */
/*==============================================================*/
CREATE TABLE TB_FXJB_M (
ZLBM                 INT                  not null,
RPJINCD              INT,
DTCDT                TIMESTAMP,
TITLE                CHAR(40),
WJGS                 CHAR(4),
NRMS                 VARCHAR(255),
LXZP                 BLOB,
CONSTRAINT PK__TB_FXJB_M__74AE54BC PRIMARY KEY (ZLBM)
);

/*==============================================================*/
/* Table: TB_GCLB                                               */
/*==============================================================*/
CREATE TABLE TB_GCLB (
GCFLDM               CHAR(1)              not null,
GCFLMC               CHAR(12)             not null,
TBNAME               CHAR(40),
CONSTRAINT PK__TB_GCLB__7B905C75 PRIMARY KEY (GCFLDM)
);

/*==============================================================*/
/* Table: TB_GTWRDSC                                            */
/*==============================================================*/
CREATE TABLE TB_GTWRDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
WRDSC                VARCHAR(255),
WRQ                  DECIMAL(12,2),
CONSTRAINT PK__TB_GTWRDSC__4BAC3F29 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_HBWRDSC                                            */
/*==============================================================*/
CREATE TABLE TB_HBWRDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
WRAR                 DECIMAL(12,2),
WRMS                 INT,
LNINF                VARCHAR(255),
HBGLCN               VARCHAR(255),
CONSTRAINT PK__TB_HBWRDSC__656C112C PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_HOMLFDSC                                           */
/*==============================================================*/
CREATE TABLE TB_HOMLFDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
POWCUT               VARCHAR(255),
HOMLF                VARCHAR(255),
GSDST                VARCHAR(255),
MLFCN                VARCHAR(255),
CONSTRAINT PK__TB_HOMLFDSC__48CFD27E PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_HS                                                 */
/*==============================================================*/
CREATE TABLE TB_HS (
BH                   INT,
TYPE                 INT,
TABLENAME            CHAR(12)
);

/*==============================================================*/
/* Table: TB_HS_M                                               */
/*==============================================================*/
CREATE TABLE TB_HS_M (
BH                   INT                  not null,
TYPE                 INT,
ZLBM                 INT
);

/*==============================================================*/
/* Table: TB_HYWDMS                                             */
/*==============================================================*/
CREATE TABLE TB_HYWDMS (
RPJINCD              INT                  not null,
STADT                TIMESTAMP,
STAPTE               TIMESTAMP,
FLNO                 INT,
CTCD                 CHAR(12),
HYSNM                CHAR(40),
LSSR                 DECIMAL(12,2),
LSARCB               DECIMAL(12,2),
LSSRB                DECIMAL(12,2),
LSTEINS              DECIMAL(12,2),
LSCMLNEQ             DECIMAL(12,2),
LSOBROWL             DECIMAL(12,2),
LSTNT                DECIMAL(12,2),
CONSTRAINT PK__TB_HYWDMS__1DB06A4F PRIMARY KEY (RPJINCD)
);

/*==============================================================*/
/* Table: TB_JZWFL                                              */
/*==============================================================*/
CREATE TABLE TB_JZWFL (
JZWFLDM              CHAR(4)              not null,
JZWFLMC              CHAR(12),
CONSTRAINT PK__TB_JZWFL__7D78A4E7 PRIMARY KEY (JZWFLDM)
);

/*==============================================================*/
/* Table: TB_LKDSC                                              */
/*==============================================================*/
CREATE TABLE TB_LKDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
TODFTDI              DECIMAL(12,2),
LKDMT                DECIMAL(12,2),
LKQ                  DECIMAL(12,2),
LKWTLH               DECIMAL(12,2),
LKGTU                CHAR(8),
LKSAR                DECIMAL(12,2),
CONSTRAINT PK__TB_LKDSC__2C3393D0 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_LYSX                                               */
/*==============================================================*/
CREATE TABLE TB_LYSX (
CTNM                 CHAR(40)             not null,
CTCD                 CHAR(8)              not null,
NT                   VARCHAR(50),
CONSTRAINT PK__TB_LYSX__76CBA758 PRIMARY KEY (CTCD)
);

/*==============================================================*/
/* Table: TB_LYSX1                                              */
/*==============================================================*/
CREATE TABLE TB_LYSX1 (
CTNM                 CHAR(40),
CTCD                 CHAR(8)              not null,
NT                   VARCHAR(50),
CONSTRAINT PK__TB_LYSX1__78B3EFCA PRIMARY KEY (CTCD)
);

/*==============================================================*/
/* Table: TB_OVFLDSC                                            */
/*==============================================================*/
CREATE TABLE TB_OVFLDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
OVFLL                DECIMAL(12,2),
OVFLZ                DECIMAL(12,2),
DSQ                  DECIMAL(12,2),
CONSTRAINT PK__TB_OVFLDSC__29572725 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_OVTUDSC                                            */
/*==============================================================*/
CREATE TABLE TB_OVTUDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
OVTUDR               CHAR(40),
OVTUAG               DECIMAL(12,2),
CONSTRAINT PK__TB_OVTUDSC__5165187F PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_PICKREC                                            */
/*==============================================================*/
CREATE TABLE TB_PICKREC (
ZLBM                 INT,
WTDPCD               CHAR(40),
FENLEI               CHAR(8),
MEDIASIZE            DECIMAL(12,2),
NUM                  INT
);

/*==============================================================*/
/* Table: TB_PITDSC                                             */
/*==============================================================*/
CREATE TABLE TB_PITDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
SBDSP                DECIMAL(12,2),
SBAR                 DECIMAL(12,2),
CONSTRAINT PK__TB_PITDSC__31EC6D26 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_PJ                                                 */
/*==============================================================*/
CREATE TABLE TB_PJ (
PJNO                 INT                  not null,
PJNMCD               CHAR(12),
PJNM                 CHAR(40)             not null,
CNTCD                CHAR(6),
FPDUTY               CHAR(8),
FPDUTYPH             CHAR(28),
CONSTRAINT PK__TB_PJ__0519C6AF PRIMARY KEY (PJNO)
);

/*==============================================================*/
/* Table: TB_PJRCN                                              */
/*==============================================================*/
CREATE TABLE TB_PJRCN (
PJRNO                INT                  not null,
PJNO                 INT,
DTCDT                TIMESTAMP            not null,
PJNM                 CHAR(40)             not null,
GCFLDM               CHAR(1),
DNCFC                VARCHAR(255),
RDERESCN             VARCHAR(255),
WTDPCD               CHAR(40)             not null,
WTDPDT               TIMESTAMP            not null,
NT                   VARCHAR(255),
CONSTRAINT PK__TB_PJRCN__07F6335A PRIMARY KEY (PJRNO)
);

/*==============================================================*/
/* Table: TB_PJR_M                                              */
/*==============================================================*/
CREATE TABLE TB_PJR_M (
ZLBM                 INT                  not null,
PJRNO                INT,
DTCDT                TIMESTAMP,
TITLE                CHAR(40),
WJGS                 CHAR(4),
NRMS                 VARCHAR(255),
LXZP                 BLOB,
CONSTRAINT PK__TB_PJR_M__0BC6C43E PRIMARY KEY (ZLBM)
);

/*==============================================================*/
/* Table: TB_PLUDSC                                             */
/*==============================================================*/
CREATE TABLE TB_PLUDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
PLTNM                VARCHAR(255),
PLTBU                INT,
CONSTRAINT PK__TB_PLUDSC__59FA5E80 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_PPDSC                                              */
/*==============================================================*/
CREATE TABLE TB_PPDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
TODFTDI              DECIMAL(12,2),
PPQ                  DECIMAL(12,2),
WTLH                 DECIMAL(12,2),
LKGTU                CHAR(8),
PPSAR                DECIMAL(12,2),
CONSTRAINT PK__TB_PPDSC__2F10007B PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_QT                                                 */
/*==============================================================*/
CREATE TABLE TB_QT (
RPJINCD              INT                  not null,
WTTT                 CHAR(40)             not null,
WTDT                 TIMESTAMP            not null,
ACTICO               TEXT,
WTDPCD               CHAR(40)             not null,
CONSTRAINT PK__TB_QT__7C4F7684 PRIMARY KEY (RPJINCD)
);

/*==============================================================*/
/* Table: TB_QT_M                                               */
/*==============================================================*/
CREATE TABLE TB_QT_M (
ZLBM                 INT                  not null,
RPJINCD              INT,
DTCDT                TIMESTAMP,
TITLE                CHAR(40),
WJGS                 CHAR(4),
NRMS                 VARCHAR(255),
LXZP                 BLOB,
CONSTRAINT PK__TB_QT_M__7E37BEF6 PRIMARY KEY (ZLBM)
);

/*==============================================================*/
/* Table: TB_RDEST1                                             */
/*==============================================================*/
CREATE TABLE TB_RDEST1 (
RPJINCD              INT                  not null,
STADT                TIMESTAMP,
STAPTE               TIMESTAMP,
FLNO                 INT,
CNTCD                CHAR(6),
SPCTRPUT             DECIMAL(12,2),
VENB1                DECIMAL(12,2),
VENB2                DECIMAL(12,2),
PJMC1                DECIMAL(12,2),
PJMC2                DECIMAL(12,2),
PUTER                DECIMAL(12,2),
PUTRCR               DECIMAL(12,2),
USGW                 DECIMAL(12,2),
USBG                 DECIMAL(12,2),
USWLT                DECIMAL(12,2),
INV                  DECIMAL(12,2),
CONSTRAINT PK__TB_RDEST1__236943A5 PRIMARY KEY (RPJINCD)
);

/*==============================================================*/
/* Table: TB_RDEST2                                             */
/*==============================================================*/
CREATE TABLE TB_RDEST2 (
RPJINCD              INT                  not null,
STADT                TIMESTAMP,
STAPTE               TIMESTAMP,
FLNO                 INT,
CNTCD                CHAR(6),
ARMPUT               DECIMAL(12,2),
MSSPUT               DECIMAL(12,2),
VENB                 DECIMAL(12,2),
PJMC                 DECIMAL(12,2),
PUTER                DECIMAL(12,2),
PUTRCR               DECIMAL(12,2),
USGW                 DECIMAL(12,2),
USBG                 DECIMAL(12,2),
USWLT                DECIMAL(12,2),
INV                  DECIMAL(12,2),
CONSTRAINT PK__TB_RDEST2__2645B050 PRIMARY KEY (RPJINCD)
);

/*==============================================================*/
/* Table: TB_RSR                                                */
/*==============================================================*/
CREATE TABLE TB_RSR (
PJRNO                INT                  not null,
PJNO                 INT                  not null,
DTCDT                TIMESTAMP            not null,
PJNM                 CHAR(40)             not null,
RSCLS                CHAR(6),
RV                   DECIMAL(12,2),
RZ                   DECIMAL(12,2),
RQ                   DECIMAL(12,2),
DFPFCN               VARCHAR(255),
DBSTBCN              VARCHAR(255),
BRBPPFCN             VARCHAR(255),
ESPFCN               VARCHAR(255),
EDDPFCN              VARCHAR(255),
GTHOPFCN             VARCHAR(255),
COMMCN               VARCHAR(255),
CONSTRAINT PK__TB_RSR__117F9D94 PRIMARY KEY (PJRNO)
);

/*==============================================================*/
/* Table: TB_SD                                                 */
/*==============================================================*/
CREATE TABLE TB_SD (
RPJINCD              INT                  not null,
WTTT                 CHAR(40)             not null,
WTDT                 TIMESTAMP            not null,
SDDSC                TEXT,
DISCU                TEXT,
WTDPCD               CHAR(40)             not null,
CONSTRAINT PK__TB_SD__778AC167 PRIMARY KEY (RPJINCD)
);

/*==============================================================*/
/* Table: TB_SD_M                                               */
/*==============================================================*/
CREATE TABLE TB_SD_M (
ZLBM                 INT                  not null,
RPJINCD              INT,
DTCDT                TIMESTAMP,
TITLE                CHAR(40),
WJGS                 CHAR(4),
NRMS                 VARCHAR(255),
LXZP                 BLOB,
CONSTRAINT PK__TB_SD_M__797309D9 PRIMARY KEY (ZLBM)
);

/*==============================================================*/
/* Table: TB_SEQUENCE                                           */
/*==============================================================*/
CREATE TABLE TB_SEQUENCE (
TABLENAME            CHAR(40)             not null,
NEXTVALUE            INT                  not null
);

/*==============================================================*/
/* Table: TB_SLDSC                                              */
/*==============================================================*/
CREATE TABLE TB_SLDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
SLBU                 INT,
SLUPAG               DECIMAL(12,2),
CONSTRAINT PK__TB_SLDSC__34C8D9D1 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_SLIDSC                                             */
/*==============================================================*/
CREATE TABLE TB_SLIDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
SLIAR                DECIMAL(12,2),
SLIMS                DECIMAL(12,2),
CONSTRAINT PK__TB_SLIDSC__571DF1D5 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_SLUDSC                                             */
/*==============================================================*/
CREATE TABLE TB_SLUDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
SLUPAG               DECIMAL(12,2),
SLUDSP               DECIMAL(12,2),
SLUTP                VARCHAR(255),
SLUGLCN              VARCHAR(255),
CONSTRAINT PK__TB_SLUDSC__45F365D3 PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_SPDSC                                              */
/*==============================================================*/
CREATE TABLE TB_SPDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
SPAR                 DECIMAL(12,2),
SPQ                  DECIMAL(12,2),
CONSTRAINT PK__TB_SPDSC__403A8C7D PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_ST                                                 */
/*==============================================================*/
CREATE TABLE TB_ST (
STTPCD               INT                  not null,
PJNO                 INT                  not null,
STNM                 CHAR(40),
CONSTRAINT PK__TB_ST__1CF15040 PRIMARY KEY (PJNO, STTPCD)
);

/*==============================================================*/
/* Table: TB_STDNC                                              */
/*==============================================================*/
CREATE TABLE TB_STDNC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40)             not null,
XQFLDM               CHAR(4),
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
RZ                   DECIMAL(12,2),
WTHCN                VARCHAR(255),
FHYWTHCN             VARCHAR(255),
DNCADDSC             VARCHAR(255),
WTDPCD               CHAR(40)             not null,
WTDPDT               TIMESTAMP            not null,
CONSTRAINT PK__TB_STDNC__1FCDBCEB PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_STDNC_M                                            */
/*==============================================================*/
CREATE TABLE TB_STDNC_M (
ZLBM                 INT                  not null,
DNCNO                INT,
DTCDT                TIMESTAMP,
TITLE                CHAR(40),
WJGS                 CHAR(4),
NRMS                 VARCHAR(255),
LXZP                 BLOB,
CONSTRAINT PK__TB_STDNC_M__239E4DCF PRIMARY KEY (ZLBM)
);

/*==============================================================*/
/* Table: TB_STOFLER                                            */
/*==============================================================*/
CREATE TABLE TB_STOFLER (
PJRNO                INT                  not null,
PJNO                 INT                  not null,
DTCDT                TIMESTAMP            not null,
PJNM                 CHAR(40)             not null,
BKOT                 CHAR(2),
DSFLWZ               DECIMAL(12,2),
DSFLW                DECIMAL(12,2),
TRFCN                VARCHAR(255),
DKCN                 VARCHAR(255),
CWFCCN               VARCHAR(255),
SFSRCN               VARCHAR(255),
FLFADSC              VARCHAR(255),
IDSTCN               VARCHAR(255),
CONSTRAINT PK__TB_STOFLER__1A14E395 PRIMARY KEY (PJRNO)
);

/*==============================================================*/
/* Table: TB_STREXDSC                                           */
/*==============================================================*/
CREATE TABLE TB_STREXDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
MXTNST               DECIMAL(12,2),
MXCMST               DECIMAL(12,2),
CONGR                CHAR(10),
ASTR                 DECIMAL(12,2),
CONSTRAINT PK__TB_STREXDSC__5441852A PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_UNDSC                                              */
/*==============================================================*/
CREATE TABLE TB_UNDSC (
DNCNO                INT                  not null,
PJNO                 INT                  not null,
STTPCD               INT                  not null,
DAGTM                TIMESTAMP            not null,
DNCNM                CHAR(40),
TODFTDI              DECIMAL(12,2),
UNDAR                DECIMAL(12,2),
UNDD                 DECIMAL(12,2),
UNDL                 DECIMAL(12,2),
CONSTRAINT PK__TB_UNDSC__37A5467C PRIMARY KEY (DNCNO)
);

/*==============================================================*/
/* Table: TB_USER                                               */
/*==============================================================*/
CREATE TABLE TB_USER (
NAME                 CHAR(8)              not null,
AUTH                 CHAR(1),
PASS                 CHAR(8),
NT                   VARCHAR(50),
CONSTRAINT PK__TB_USER__06CD04F7 PRIMARY KEY (NAME)
);

/*==============================================================*/
/* Table: TB_VP                                                 */
/*==============================================================*/
CREATE TABLE TB_VP (
LYDM                 CHAR(1)              not null,
LYMC                 CHAR(40)             not null,
SFDM                 CHAR(6)              not null,
SFMC                 CHAR(40)             not null
);

/*==============================================================*/
/* Table: TB_WDMPJRHS                                           */
/*==============================================================*/
CREATE TABLE TB_WDMPJRHS (
RPJINCD              INT                  not null,
STADT                TIMESTAMP,
STAPTE               TIMESTAMP,
CTCD                 CHAR(12),
CNTCD                CHAR(6),
DKL                  DECIMAL(12,2),
BPL                  DECIMAL(12,2),
BT                   INT,
CLVGT                INT,
VALL                 INT,
RSL                  INT,
RSM                  INT,
RSS                  INT,
NTSTA                INT,
CMERMS               DECIMAL(12,2),
TERPER               DECIMAL(12,2),
CMRCKMS              DECIMAL(12,2),
TRCKPER              DECIMAL(12,2),
CMCONMS              DECIMAL(12,2),
TCONPER              DECIMAL(12,2),
CMFU                 DECIMAL(12,2),
TFUPER               DECIMAL(12,2),
CONSTRAINT PK__TB_WDMPJRHS__0C85DE4D PRIMARY KEY (RPJINCD)
);

/*==============================================================*/
/* Table: TB_WDMPJS                                             */
/*==============================================================*/
CREATE TABLE TB_WDMPJS (
RPJINCD              INT                  not null,
STADT                TIMESTAMP,
STAPTE               TIMESTAMP,
CTCD                 CHAR(12),
CNTCD                CHAR(6),
DKL                  DECIMAL(12,2),
BPL                  DECIMAL(12,2),
BT                   INT,
CLVGT                INT,
VALL                 INT,
RSL                  INT,
RSM                  INT,
RSS                  INT,
NTSTA                INT,
ECLS                 DECIMAL(12,2),
CONSTRAINT PK__TB_WDMPJS__09A971A2 PRIMARY KEY (RPJINCD)
);

/*==============================================================*/
/* Table: TB_WDMPJS1                                            */
/*==============================================================*/
CREATE TABLE TB_WDMPJS1 (
RPJINCD              INT                  not null,
STADT                TIMESTAMP,
STAPTE               TIMESTAMP,
FLNO                 INT,
CNTCD                CHAR(6),
PJNM                 CHAR(40),
WDNER                DECIMAL(12,2),
WDNRCK               DECIMAL(12,2),
LSINV                DECIMAL(12,2),
NT                   CHAR(40),
CONSTRAINT PK__TB_WDMPJS1__17F790F9 PRIMARY KEY (RPJINCD)
);

/*==============================================================*/
/* Table: TB_WDMPJS2                                            */
/*==============================================================*/
CREATE TABLE TB_WDMPJS2 (
RPJINCD              INT                  not null,
STADT                TIMESTAMP,
STAPTE               TIMESTAMP,
FLNO                 INT,
CNTCD                CHAR(6),
LSCMEQQU             DECIMAL(12,2),
LSCMEQIN             DECIMAL(12,2),
LSGNR                DECIMAL(12,2),
LSTRT                DECIMAL(12,2),
LSWRP                DECIMAL(12,2),
LSCB                 DECIMAL(12,2),
LSYW                 DECIMAL(12,2),
LSINV                DECIMAL(12,2),
CONSTRAINT PK__TB_WDMPJS2__1AD3FDA4 PRIMARY KEY (RPJINCD)
);

/*==============================================================*/
/* Table: TB_WLR                                                */
/*==============================================================*/
CREATE TABLE TB_WLR (
PJRNO                INT                  not null,
PJNO                 INT                  not null,
DTCDT                TIMESTAMP            not null,
PJNM                 CHAR(40)             not null,
WLGR                 CHAR(2),
RUPGZ                DECIMAL(12,2),
RDWGZ                DECIMAL(12,2),
RQO                  DECIMAL(12,2),
RWSTOWLT             DECIMAL(12,2),
GFPFCN               VARCHAR(255),
STPFCN               VARCHAR(255),
EDDPFCN              VARCHAR(255),
GTHOPFCN             VARCHAR(255),
COMMCN               VARCHAR(255),
CONSTRAINT PK__TB_WLR__145C0A3F PRIMARY KEY (PJRNO)
);

/*==============================================================*/
/* Table: TB_WT                                                 */
/*==============================================================*/
CREATE TABLE TB_WT (
WTDPCD               CHAR(40)             not null,
WTDPNM               CHAR(40),
WTDPTY               CHAR(8),
WT                   CHAR(8),
REPH                 CHAR(14),
CONSTRAINT PK__TB_WT__014935CB PRIMARY KEY (WTDPCD)
);

/*==============================================================*/
/* Table: TB_XQFL                                               */
/*==============================================================*/
CREATE TABLE TB_XQFL (
XQFLDM               CHAR(4)              not null,
XQFLMC               CHAR(40),
TBNAME               CHAR(40),
CONSTRAINT PK__TB_XQFL__7F60ED59 PRIMARY KEY (XQFLDM)
);

CREATE TABLE TB_TORRENTS(
	DNCNO INT NOT NULL,	--险情编号
	PJNO INT NOT NULL,	--工程编号
	STTPCD INT NOT NULL,	--建筑物编码
	DAGTM DATE,	--出险时间
	DNCNM CHAR(40),	--险情名称
	DSSPN INT,	--受灾人口(人)
	DSSAREA NUMERIC(12,2),	--受灾面积
	DTHPN INT,	--死亡人口
	WRHS INT,	--倒塌房屋
	DRCECLS NUMERIC(12,2),	--经济损失
	DAYDP NUMERIC(12,2),	--日最大降雨量
	TDP NUMERIC(12,2),	--时段最大降雨量
	DSSTP CHAR(40)	--灾害类型
);

ALTER TABLE TB_BCSTSDST
   ADD CONSTRAINT FK__TB_BCSTSD__CNTCD__2180FB33 FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_BCSTSDST
   ADD CONSTRAINT FK__TB_BCSTSD__DSTCT__208CD6FA FOREIGN KEY (DSTCT)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_BLBADSC
   ADD CONSTRAINT FK__TB_BLBADSC__440B1D61 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_BRDMDSC
   ADD CONSTRAINT FK__TB_BRDMDSC__4F7CD00D FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_BSWPLPDS
   ADD CONSTRAINT FK__TB_BSWPLPDS__6383C8BA FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_BSWRDSC
   ADD CONSTRAINT FK__TB_BSWRDSC__5DCAEF64 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_BURDSC
   ADD CONSTRAINT FK__TB_BURDSC__276EDEB3 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_CLPJPRWR
   ADD CONSTRAINT FK__TB_CLPJPRWR__693CA210 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_CLPJSCDN
   ADD CONSTRAINT FK__TB_CLPJSCDN__6C190EBB FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_COWAPJ
   ADD CONSTRAINT FK__TB_COWAPJ__PJNO__182C9B23 FOREIGN KEY (PJNO)
      REFERENCES TB_PJ (PJNO)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_CRDSC
   ADD CONSTRAINT FK__TB_CRDSC__3B75D760 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_CVDSC
   ADD CONSTRAINT FK__TB_CVDSC__3E52440B FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_DKDNCSTA1
   ADD CONSTRAINT FK__TB_DKDNCS__CNTCD__10566F31 FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_DKDNCSTA2
   ADD CONSTRAINT FK__TB_DKDNCS__CNTCD__1332DBDC FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_DKR
   ADD CONSTRAINT FK__TB_DKR__PJNO__0F975522 FOREIGN KEY (PJNO)
      REFERENCES TB_PJ (PJNO)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_DKSNWS
   ADD CONSTRAINT FK__TB_DKSNWS__CNTCD__160F4887 FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_EDDWRDSC
   ADD CONSTRAINT FK__TB_EDDWRDSC__60A75C0F FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_FPACTI_M
   ADD CONSTRAINT FK__TB_FPACTI__RPJIN__70DDC3D8 FOREIGN KEY (RPJINCD)
      REFERENCES TB_FPACTI (RPJINCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_FXJB_M
   ADD CONSTRAINT FK__TB_FXJB_M__RPJIN__75A278F5 FOREIGN KEY (RPJINCD)
      REFERENCES TB_FXJB (RPJINCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_GTWRDSC
   ADD CONSTRAINT FK__TB_GTWRDSC__4CA06362 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_HBWRDSC
   ADD CONSTRAINT FK__TB_HBWRDSC__66603565 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_HOMLFDSC
   ADD CONSTRAINT FK__TB_HOMLFDSC__49C3F6B7 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_LKDSC
   ADD CONSTRAINT FK__TB_LKDSC__2D27B809 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_OVFLDSC
   ADD CONSTRAINT FK__TB_OVFLDSC__2A4B4B5E FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_OVTUDSC
   ADD CONSTRAINT FK__TB_OVTUDSC__52593CB8 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_PITDSC
   ADD CONSTRAINT FK__TB_PITDSC__32E0915F FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_PJ
   ADD CONSTRAINT FK__TB_PJ__CNTCD__060DEAE8 FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_PJRCN
   ADD CONSTRAINT FK__TB_PJRCN__GCFLDM__09DE7BCC FOREIGN KEY (GCFLDM)
      REFERENCES TB_GCLB (GCFLDM)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_PJRCN
   ADD CONSTRAINT FK__TB_PJRCN__PJNO__08EA5793 FOREIGN KEY (PJNO)
      REFERENCES TB_PJ (PJNO)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_PJR_M
   ADD CONSTRAINT FK__TB_PJR_M__PJRNO__0CBAE877 FOREIGN KEY (PJRNO)
      REFERENCES TB_PJRCN (PJRNO)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_PLUDSC
   ADD CONSTRAINT FK__TB_PLUDSC__5AEE82B9 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_PPDSC
   ADD CONSTRAINT FK__TB_PPDSC__300424B4 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_QT_M
   ADD CONSTRAINT FK__TB_QT_M__RPJINCD__7F2BE32F FOREIGN KEY (RPJINCD)
      REFERENCES TB_QT (RPJINCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_RDEST1
   ADD CONSTRAINT FK__TB_RDEST1__CNTCD__245D67DE FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_RDEST2
   ADD CONSTRAINT FK__TB_RDEST2__CNTCD__2739D489 FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_RSR
   ADD CONSTRAINT FK__TB_RSR__PJNO__1273C1CD FOREIGN KEY (PJNO)
      REFERENCES TB_PJ (PJNO)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_SD_M
   ADD CONSTRAINT FK__TB_SD_M__RPJINCD__7A672E12 FOREIGN KEY (RPJINCD)
      REFERENCES TB_SD (RPJINCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_SLDSC
   ADD CONSTRAINT FK__TB_SLDSC__35BCFE0A FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_SLIDSC
   ADD CONSTRAINT FK__TB_SLIDSC__5812160E FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_SLUDSC
   ADD CONSTRAINT FK__TB_SLUDSC__46E78A0C FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_SPDSC
   ADD CONSTRAINT FK__TB_SPDSC__412EB0B6 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_ST
   ADD CONSTRAINT FK__TB_ST__PJNO__1DE57479 FOREIGN KEY (PJNO)
      REFERENCES TB_PJ (PJNO)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_STDNC
   ADD CONSTRAINT FK__TB_STDNC__20C1E124 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_STDNC
   ADD CONSTRAINT FK__TB_STDNC__XQFLDM__21B6055D FOREIGN KEY (XQFLDM)
      REFERENCES TB_XQFL (XQFLDM)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_STDNC_M
   ADD CONSTRAINT FK__TB_STDNC___DNCNO__24927208 FOREIGN KEY (DNCNO)
      REFERENCES TB_STDNC (DNCNO)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_STOFLER
   ADD CONSTRAINT FK__TB_STOFLER__PJNO__1B0907CE FOREIGN KEY (PJNO)
      REFERENCES TB_PJ (PJNO)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_STREXDSC
   ADD CONSTRAINT FK__TB_STREXDSC__5535A963 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_UNDSC
   ADD CONSTRAINT FK__TB_UNDSC__38996AB5 FOREIGN KEY (PJNO, STTPCD)
      REFERENCES TB_ST (PJNO, STTPCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_WDMPJRHS
   ADD CONSTRAINT FK__TB_WDMPJR__CNTCD__0D7A0286 FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_WDMPJS
   ADD CONSTRAINT FK__TB_WDMPJS__CNTCD__0A9D95DB FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_WDMPJS1
   ADD CONSTRAINT FK__TB_WDMPJS__CNTCD__18EBB532 FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_WDMPJS2
   ADD CONSTRAINT FK__TB_WDMPJS__CNTCD__1BC821DD FOREIGN KEY (CNTCD)
      REFERENCES TB_CNT (CNTCD)
      ON DELETE restrict ON UPDATE restrict;

ALTER TABLE TB_WLR
   ADD CONSTRAINT FK__TB_WLR__PJNO__15502E78 FOREIGN KEY (PJNO)
      REFERENCES TB_PJ (PJNO)
      ON DELETE restrict ON UPDATE restrict;

