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
'黄河滩区、分滞洪区灾情统计表';

COMMENT ON COLUMN TB_BCSTSDST.RPJINCD IS
'RPJINCD';

COMMENT ON COLUMN TB_BCSTSDST.CNTCD IS
'行政区划代码';

COMMENT ON COLUMN TB_BCSTSDST.TB__CNTCD IS
'行政区_行政区划代码';

COMMENT ON COLUMN TB_BCSTSDST.STADT IS
'统计日期';

COMMENT ON COLUMN TB_BCSTSDST.STAPTE IS
'统计时段止';

COMMENT ON COLUMN TB_BCSTSDST.FLNO IS
'洪水编次';

COMMENT ON COLUMN TB_BCSTSDST.BCNM IS
'滩区名称';

COMMENT ON COLUMN TB_BCSTSDST.SDTW IS
'受灾乡';

COMMENT ON COLUMN TB_BCSTSDST.SBMVLL IS
'进水或水围村庄';

COMMENT ON COLUMN TB_BCSTSDST.CLLRM IS
'倒塌房屋';

COMMENT ON COLUMN TB_BCSTSDST.SBMBCAR IS
'淹没滩区面积';

COMMENT ON COLUMN TB_BCSTSDST.SBMPLOAR IS
'淹没耕地面积';

COMMENT ON COLUMN TB_BCSTSDST.CRSOPPL IS
'临河受灾人口';

COMMENT ON COLUMN TB_BCSTSDST.DTHPPL IS
'背河受灾人口';

COMMENT ON COLUMN TB_BCSTSDST.ARSOPPL IS
'其中死亡人口';

COMMENT ON COLUMN TB_BCSTSDST.MVARRPPL IS
'外牵安置人口';

COMMENT ON COLUMN TB_BCSTSDST.LCARRPPL IS
'就地安置人口';

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
'浪坎';

COMMENT ON COLUMN TB_BLBADSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_BLBADSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_BLBADSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_BLBADSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_BLBADSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_BLBADSC.WDQ IS
'河道流量';

COMMENT ON COLUMN TB_BLBADSC.BLH IS
'浪高';

COMMENT ON COLUMN TB_BLBADSC.WNS IS
'风力';

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
'溃坝';

COMMENT ON COLUMN TB_BRDMDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_BRDMDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_BRDMDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_BRDMDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_BRDMDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_BRDMDSC.BRDMW IS
'溃坝宽度';

COMMENT ON COLUMN TB_BRDMDSC.PJPS IS
'工程现状';

COMMENT ON COLUMN TB_BRDMDSC.BRZDMCDI IS
'库水位距堤顶高差';

COMMENT ON COLUMN TB_BRDMDSC.BRV IS
'溃坝时库容';

COMMENT ON COLUMN TB_BRDMDSC.BRDMQ IS
'溃坝流量';

COMMENT ON COLUMN TB_BRDMDSC.BRDMLDGL IS
'溃坝处地形、地质条件';

COMMENT ON COLUMN TB_BRDMDSC.DSSPN IS
'受灾人口';

COMMENT ON COLUMN TB_BRDMDSC.INPN IS
'受伤人口';

COMMENT ON COLUMN TB_BRDMDSC.DTHPN IS
'死亡人口';

COMMENT ON COLUMN TB_BRDMDSC.WRHS IS
'倒塌房屋';

COMMENT ON COLUMN TB_BRDMDSC.CRPDSSAR IS
'农作物受灾面积';

COMMENT ON COLUMN TB_BRDMDSC.SCDMFMAR IS
'毁坏耕地面积';

COMMENT ON COLUMN TB_BRDMDSC.DRCECLS IS
'直接经济损失';

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
'基础排水失效';

COMMENT ON COLUMN TB_BSWPLPDS.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_BSWPLPDS.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_BSWPLPDS.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_BSWPLPDS.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_BSWPLPDS.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_BSWPLPDS.WPPLU IS
'排水孔堵塞';

COMMENT ON COLUMN TB_BSWPLPDS.WPEQML IS
'排水设备失灵';

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
'基础破坏';

COMMENT ON COLUMN TB_BSWRDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_BSWRDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_BSWRDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_BSWRDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_BSWRDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_BSWRDSC.GRNSPDSC IS
'基础渗漏描述';

COMMENT ON COLUMN TB_BSWRDSC.GRNUSB IS
'基础不均匀沉降';

COMMENT ON COLUMN TB_BSWRDSC.GROVCHWR IS
'基础超载破坏';

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
'决口描述';

COMMENT ON COLUMN TB_BURDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_BURDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_BURDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_BURDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_BURDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_BURDSC.BUW IS
'决口宽度';

COMMENT ON COLUMN TB_BURDSC.BUVL IS
'决口流速';

COMMENT ON COLUMN TB_BURDSC.BUZDF IS
'决口水头差';

COMMENT ON COLUMN TB_BURDSC.BUQ IS
'决口流量';

COMMENT ON COLUMN TB_BURDSC.BURLDGL IS
'决口处地形地质条件';

COMMENT ON COLUMN TB_BURDSC.DSSPN IS
'受灾人口';

COMMENT ON COLUMN TB_BURDSC.INPN IS
'受伤人口';

COMMENT ON COLUMN TB_BURDSC.DTHPN IS
'死亡人口';

COMMENT ON COLUMN TB_BURDSC.WRHS IS
'倒塌房屋';

COMMENT ON COLUMN TB_BURDSC.CRPDSSAR IS
'农作物受灾面积';

COMMENT ON COLUMN TB_BURDSC.SCDMFMAR IS
'毁坏耕地面积';

COMMENT ON COLUMN TB_BURDSC.DRCECLS IS
'直接经济损失';

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
'控导工程局部损坏';

COMMENT ON COLUMN TB_CLPJPRWR.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_CLPJPRWR.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_CLPJPRWR.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_CLPJPRWR.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_CLPJPRWR.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_CLPJPRWR.WRAR IS
'破坏面积';

COMMENT ON COLUMN TB_CLPJPRWR.WRD IS
'破坏深度';

COMMENT ON COLUMN TB_CLPJPRWR.WRL IS
'破坏长度';

COMMENT ON COLUMN TB_CLPJPRWR.WRGLCN IS
'破坏处地质情况';

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
'控导工程冲毁';

COMMENT ON COLUMN TB_CLPJSCDN.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_CLPJSCDN.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_CLPJSCDN.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_CLPJSCDN.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_CLPJSCDN.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_CLPJSCDN.SCDMBU IS
'冲毁体积';

COMMENT ON COLUMN TB_CLPJSCDN.SCDML IS
'冲毁长度';

COMMENT ON COLUMN TB_CLPJSCDN.SCDMD IS
'冲毁深度';

COMMENT ON COLUMN TB_CLPJSCDN.SCDMGLCN IS
'冲毁处地质情况';

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
'行政区划';

COMMENT ON COLUMN TB_CNT.CNTCD IS
'行政区划代码';

COMMENT ON COLUMN TB_CNT.PROVNM IS
'省（市）县名称';

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
'治河运行';

COMMENT ON COLUMN TB_COWAPJ.PJRNO IS
'运行编号';

COMMENT ON COLUMN TB_COWAPJ.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_COWAPJ.DTCDT IS
'检测时间';

COMMENT ON COLUMN TB_COWAPJ.PJNM IS
'工程名称';

COMMENT ON COLUMN TB_COWAPJ.BKOT IS
'所在岸别';

COMMENT ON COLUMN TB_COWAPJ.FLCNDSC IS
'水流情况描述';

COMMENT ON COLUMN TB_COWAPJ.WDCNDSC IS
'河道情况描述';

COMMENT ON COLUMN TB_COWAPJ.PRCCLR IS
'清障的落实';

COMMENT ON COLUMN TB_COWAPJ.SPURDSC IS
'控导工程描述';

COMMENT ON COLUMN TB_COWAPJ.BPPJCN IS
'护岸工程情况';

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
'裂缝';

COMMENT ON COLUMN TB_CRDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_CRDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_CRDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_CRDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_CRDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_CRDSC.CRDR IS
'裂缝方向';

COMMENT ON COLUMN TB_CRDSC.CRD IS
'裂缝深度';

COMMENT ON COLUMN TB_CRDSC.CRL IS
'裂缝长度';

COMMENT ON COLUMN TB_CRDSC.CRW IS
'裂缝宽度';

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
'崩岸';

COMMENT ON COLUMN TB_CVDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_CVDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_CVDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_CVDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_CVDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_CVDSC.TODFTDI IS
'距堤脚距离';

COMMENT ON COLUMN TB_CVDSC.WDQ IS
'河道流量';

COMMENT ON COLUMN TB_CVDSC.CVL IS
'崩塌长度';

COMMENT ON COLUMN TB_CVDSC.CVBU IS
'崩塌体积';

COMMENT ON COLUMN TB_CVDSC.RVH IS
'河岸高度';

COMMENT ON COLUMN TB_CVDSC.FLCNDSC IS
'水流情况描述';

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
'行政区划代码';

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
'行政区划代码';

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
'堤防运行';

COMMENT ON COLUMN TB_DKR.PJRNO IS
'运行编号';

COMMENT ON COLUMN TB_DKR.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_DKR.DTCDT IS
'检测时间';

COMMENT ON COLUMN TB_DKR.PJNM IS
'工程名称';

COMMENT ON COLUMN TB_DKR.DKGR IS
'堤防级别';

COMMENT ON COLUMN TB_DKR.BKOT IS
'所在岸别';

COMMENT ON COLUMN TB_DKR.STECH IS
'起止桩号';

COMMENT ON COLUMN TB_DKR.RZ IS
'当前水位';

COMMENT ON COLUMN TB_DKR.RQ IS
'当前流量';

COMMENT ON COLUMN TB_DKR.WSTODC IS
'水面距堤顶距离';

COMMENT ON COLUMN TB_DKR.DKPFCN IS
'堤防完好状况';

COMMENT ON COLUMN TB_DKR.TSCN IS
'穿堤建筑物状况';

COMMENT ON COLUMN TB_DKR.BRBPPFCN IS
'护坡护岸完好状况';

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
'行政区划代码';

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
'消能工破坏';

COMMENT ON COLUMN TB_EDDWRDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_EDDWRDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_EDDWRDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_EDDWRDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_EDDWRDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_EDDWRDSC.APWR IS
'底板掀起';

COMMENT ON COLUMN TB_EDDWRDSC.WSTWR IS
'止水破坏';

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
'防汛行动';

COMMENT ON COLUMN TB_FPACTI.RPJINCD IS
'行动编号';

COMMENT ON COLUMN TB_FPACTI.WTTT IS
'填报标题';

COMMENT ON COLUMN TB_FPACTI.WTDT IS
'填报时间';

COMMENT ON COLUMN TB_FPACTI.ACTICO IS
'行动内容';

COMMENT ON COLUMN TB_FPACTI.WTDPCD IS
'填报单位名称';

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
'防汛多媒体资料';

COMMENT ON COLUMN TB_FPACTI_M.ZLBM IS
'资料编码';

COMMENT ON COLUMN TB_FPACTI_M.RPJINCD IS
'行动编号';

COMMENT ON COLUMN TB_FPACTI_M.DTCDT IS
'采集时间';

COMMENT ON COLUMN TB_FPACTI_M.TITLE IS
'标题';

COMMENT ON COLUMN TB_FPACTI_M.WJGS IS
'文件格式';

COMMENT ON COLUMN TB_FPACTI_M.NRMS IS
'内容描述';

COMMENT ON COLUMN TB_FPACTI_M.LXZP IS
'录像照片';

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
'防汛简报';

COMMENT ON COLUMN TB_FXJB.RPJINCD IS
'简报编号';

COMMENT ON COLUMN TB_FXJB.ISSUE IS
'期';

COMMENT ON COLUMN TB_FXJB.WTTT IS
'标题';

COMMENT ON COLUMN TB_FXJB.WTDT IS
'填报日期';

COMMENT ON COLUMN TB_FXJB.ACTICO IS
'正文';

COMMENT ON COLUMN TB_FXJB.NT1 IS
'抄报';

COMMENT ON COLUMN TB_FXJB.QF IS
'签发人';

COMMENT ON COLUMN TB_FXJB.SH IS
'审核人';

COMMENT ON COLUMN TB_FXJB.NG IS
'拟稿人';

COMMENT ON COLUMN TB_FXJB.WTDPCD IS
'填报单位';

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
'防汛简报附件表';

COMMENT ON COLUMN TB_FXJB_M.ZLBM IS
'资料编码';

COMMENT ON COLUMN TB_FXJB_M.RPJINCD IS
'简报编号';

COMMENT ON COLUMN TB_FXJB_M.DTCDT IS
'采集时间';

COMMENT ON COLUMN TB_FXJB_M.TITLE IS
'标题';

COMMENT ON COLUMN TB_FXJB_M.WJGS IS
'文件格式';

COMMENT ON COLUMN TB_FXJB_M.NRMS IS
'内容描述';

COMMENT ON COLUMN TB_FXJB_M.LXZP IS
'录像照片';

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
'工程类别';

COMMENT ON COLUMN TB_GCLB.GCFLDM IS
'工程分类代码';

COMMENT ON COLUMN TB_GCLB.GCFLMC IS
'工程分类名称';

COMMENT ON COLUMN TB_GCLB.TBNAME IS
'工情表名称';

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
'闸门破坏';

COMMENT ON COLUMN TB_GTWRDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_GTWRDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_GTWRDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_GTWRDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_GTWRDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_GTWRDSC.WRDSC IS
'破坏形式';

COMMENT ON COLUMN TB_GTWRDSC.WRQ IS
'失事时流量';

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
'洞身破坏';

COMMENT ON COLUMN TB_HBWRDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_HBWRDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_HBWRDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_HBWRDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_HBWRDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_HBWRDSC.WRAR IS
'破坏面积';

COMMENT ON COLUMN TB_HBWRDSC.WRMS IS
'破坏方向';

COMMENT ON COLUMN TB_HBWRDSC.LNINF IS
'对衬砌造成的影响';

COMMENT ON COLUMN TB_HBWRDSC.HBGLCN IS
'洞身地质情况';

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
'启闭失灵';

COMMENT ON COLUMN TB_HOMLFDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_HOMLFDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_HOMLFDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_HOMLFDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_HOMLFDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_HOMLFDSC.POWCUT IS
'停电';

COMMENT ON COLUMN TB_HOMLFDSC.HOMLF IS
'启闭机失灵';

COMMENT ON COLUMN TB_HOMLFDSC.GSDST IS
'闸门井变形';

COMMENT ON COLUMN TB_HOMLFDSC.MLFCN IS
'失灵时开启状况';

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
'会商';

COMMENT ON COLUMN TB_HS.BH IS
'被选择记录的主码';

COMMENT ON COLUMN TB_HS.TYPE IS
'工情分类';

COMMENT ON COLUMN TB_HS.TABLENAME IS
'详细信息所在表名';

/*==============================================================*/
/* Table: TB_HS_M                                               */
/*==============================================================*/
CREATE TABLE TB_HS_M (
BH                   INT                  NOT NULL,
TYPE                 INT,
ZLBM                 INT
);

COMMENT ON TABLE TB_HS_M IS
'会商多媒体资料';

COMMENT ON COLUMN TB_HS_M.BH IS
'被选择记录的主码';

COMMENT ON COLUMN TB_HS_M.TYPE IS
'工情分类';

COMMENT ON COLUMN TB_HS_M.ZLBM IS
'多媒体记录编号';

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
'建筑物分类';

COMMENT ON COLUMN TB_JZWFL.JZWFLDM IS
'建筑物分类代码';

COMMENT ON COLUMN TB_JZWFL.JZWFLMC IS
'建筑物分类名称';

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
'漏洞';

COMMENT ON COLUMN TB_LKDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_LKDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_LKDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_LKDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_LKDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_LKDSC.TODFTDI IS
'距堤顶高差';

COMMENT ON COLUMN TB_LKDSC.LKDMT IS
'最大漏洞直径';

COMMENT ON COLUMN TB_LKDSC.LKQ IS
'漏洞流量';

COMMENT ON COLUMN TB_LKDSC.LKWTLH IS
'漏洞水柱高';

COMMENT ON COLUMN TB_LKDSC.LKGTU IS
'漏水混清';

COMMENT ON COLUMN TB_LKDSC.LKSAR IS
'已形成漏洞群面积';

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
'流域水系级别表';

COMMENT ON COLUMN TB_LYSX.CTNM IS
'河流名称';

COMMENT ON COLUMN TB_LYSX.CTCD IS
'河流代码';

COMMENT ON COLUMN TB_LYSX.NT IS
'其它';

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
'流域级别';

COMMENT ON COLUMN TB_LYSX1.CTNM IS
'流域名称';

COMMENT ON COLUMN TB_LYSX1.CTCD IS
'流域代码';

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
'漫溢';

COMMENT ON COLUMN TB_OVFLDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_OVFLDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_OVFLDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_OVFLDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_OVFLDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_OVFLDSC.OVFLL IS
'漫溢长度';

COMMENT ON COLUMN TB_OVFLDSC.OVFLZ IS
'漫溢水位';

COMMENT ON COLUMN TB_OVFLDSC.DSQ IS
'下泻流量';

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
'倾覆';

COMMENT ON COLUMN TB_OVTUDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_OVTUDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_OVTUDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_OVTUDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_OVTUDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_OVTUDSC.OVTUDR IS
'倾覆方向';

COMMENT ON COLUMN TB_OVTUDSC.OVTUAG IS
'倾覆角度';

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
'已选择记录表';

COMMENT ON COLUMN TB_PICKREC.ZLBM IS
'记录主键';

COMMENT ON COLUMN TB_PICKREC.WTDPCD IS
'被挑选记录的填报单位';

COMMENT ON COLUMN TB_PICKREC.FENLEI IS
'被挑选记录的类别';

COMMENT ON COLUMN TB_PICKREC.MEDIASIZE IS
'被挑选图片的大小';

COMMENT ON COLUMN TB_PICKREC.NUM IS
'被挑选记录的编号';

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
'陷坑';

COMMENT ON COLUMN TB_PITDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_PITDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_PITDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_PITDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_PITDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_PITDSC.SBDSP IS
'陷坑深度';

COMMENT ON COLUMN TB_PITDSC.SBAR IS
'陷坑面积';

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
'工程代码表';

COMMENT ON COLUMN TB_PJ.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_PJ.CNTCD IS
'行政区划代码';

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
'工程运行';

COMMENT ON COLUMN TB_PJRCN.PJRNO IS
'运行编号';

COMMENT ON COLUMN TB_PJRCN.GCFLDM IS
'工程分类代码';

COMMENT ON COLUMN TB_PJRCN.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_PJRCN.DTCDT IS
'检测时间';

COMMENT ON COLUMN TB_PJRCN.PJNM IS
'工程名称';

COMMENT ON COLUMN TB_PJRCN.DNCFC IS
'险情预测';

COMMENT ON COLUMN TB_PJRCN.RDERESCN IS
'抢险资源配备';

COMMENT ON COLUMN TB_PJRCN.WTDPCD IS
'填报单位名称';

COMMENT ON COLUMN TB_PJRCN.WTDPDT IS
'填报时间';

COMMENT ON COLUMN TB_PJRCN.NT IS
'其它';

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
'运行多媒体资料';

COMMENT ON COLUMN TB_PJR_M.ZLBM IS
'资料编码';

COMMENT ON COLUMN TB_PJR_M.PJRNO IS
'运行编号';

COMMENT ON COLUMN TB_PJR_M.DTCDT IS
'采集时间';

COMMENT ON COLUMN TB_PJR_M.TITLE IS
'标题';

COMMENT ON COLUMN TB_PJR_M.WJGS IS
'文件格式';

COMMENT ON COLUMN TB_PJR_M.NRMS IS
'内容描述';

COMMENT ON COLUMN TB_PJR_M.LXZP IS
'录像照片';

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
'堵塞';

COMMENT ON COLUMN TB_PLUDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_PLUDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_PLUDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_PLUDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_PLUDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_PLUDSC.PLTNM IS
'堵塞物名称';

COMMENT ON COLUMN TB_PLUDSC.PLTBU IS
'堵塞物体积';

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
险情编号                 INT                  NOT NULL,
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
'管涌';

COMMENT ON COLUMN TB_PPDSC.险情编号 IS
'险情编号';

COMMENT ON COLUMN TB_PPDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_PPDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_PPDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_PPDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_PPDSC.TODFTDI IS
'距堤脚距离';

COMMENT ON COLUMN TB_PPDSC.PPQ IS
'管涌流量';

COMMENT ON COLUMN TB_PPDSC.WTLH IS
'水柱高';

COMMENT ON COLUMN TB_PPDSC.LKGTU IS
'漏水混清';

COMMENT ON COLUMN TB_PPDSC.PPSAR IS
'已形成管涌群面积';

ALTER TABLE TB_PPDSC
   ADD CONSTRAINT PK_TB_PPDSC PRIMARY KEY (险情编号);

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
'其它信息';

COMMENT ON COLUMN TB_QT.RPJINCD IS
'行动编号';

COMMENT ON COLUMN TB_QT.WTTT IS
'填报标题';

COMMENT ON COLUMN TB_QT.WTDT IS
'填报时间';

COMMENT ON COLUMN TB_QT.ACTICO IS
'行动内容';

COMMENT ON COLUMN TB_QT.WTDPCD IS
'填报单位名称';

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
'其它信息多媒体资料';

COMMENT ON COLUMN TB_QT_M.ZLBM IS
'资料编码';

COMMENT ON COLUMN TB_QT_M.RPJINCD IS
'行动编号';

COMMENT ON COLUMN TB_QT_M.DTCDT IS
'采集时间';

COMMENT ON COLUMN TB_QT_M.TITLE IS
'标题';

COMMENT ON COLUMN TB_QT_M.WJGS IS
'文件格式';

COMMENT ON COLUMN TB_QT_M.NRMS IS
'内容描述';

COMMENT ON COLUMN TB_QT_M.LXZP IS
'录像照片';

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
'行政区划代码';

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
'行政区划代码';

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
'水库运行';

COMMENT ON COLUMN TB_RSR.PJRNO IS
'运行编号';

COMMENT ON COLUMN TB_RSR.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_RSR.DTCDT IS
'检测时间';

COMMENT ON COLUMN TB_RSR.PJNM IS
'工程名称';

COMMENT ON COLUMN TB_RSR.RSCLS IS
'水库类别';

COMMENT ON COLUMN TB_RSR.RV IS
'当前库容';

COMMENT ON COLUMN TB_RSR.RZ IS
'当前运行水位';

COMMENT ON COLUMN TB_RSR.RQ IS
'当前泻量';

COMMENT ON COLUMN TB_RSR.DFPFCN IS
'坝基完好状况';

COMMENT ON COLUMN TB_RSR.DBSTBCN IS
'坝体稳定情况';

COMMENT ON COLUMN TB_RSR.BRBPPFCN IS
'护坡护岸稳定情况';

COMMENT ON COLUMN TB_RSR.ESPFCN IS
'泄水建筑物完好状况';

COMMENT ON COLUMN TB_RSR.EDDPFCN IS
'消能工完好状况';

COMMENT ON COLUMN TB_RSR.GTHOPFCN IS
'闸门、启闭机完好状况';

COMMENT ON COLUMN TB_RSR.COMMCN IS
'通讯手段及状况';

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
'灾情';

COMMENT ON COLUMN TB_SD.RPJINCD IS
'灾情编号';

COMMENT ON COLUMN TB_SD.WTTT IS
'填报标题';

COMMENT ON COLUMN TB_SD.WTDT IS
'填报时间';

COMMENT ON COLUMN TB_SD.SDDSC IS
'灾情描述';

COMMENT ON COLUMN TB_SD.DISCU IS
'灾害成因';

COMMENT ON COLUMN TB_SD.WTDPCD IS
'填报单位名称';

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
'灾情多媒体资料';

COMMENT ON COLUMN TB_SD_M.ZLBM IS
'资料编码';

COMMENT ON COLUMN TB_SD_M.RPJINCD IS
'灾情编号';

COMMENT ON COLUMN TB_SD_M.DTCDT IS
'采集时间';

COMMENT ON COLUMN TB_SD_M.TITLE IS
'标题';

COMMENT ON COLUMN TB_SD_M.WJGS IS
'文件格式';

COMMENT ON COLUMN TB_SD_M.NRMS IS
'内容描述';

COMMENT ON COLUMN TB_SD_M.LXZP IS
'录像照片';

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
'用于生成每个表的关键字段序列号。';

COMMENT ON COLUMN TB_SEQUENCE.TABLENAME IS
'表名';

COMMENT ON COLUMN TB_SEQUENCE.NEXTVALUE IS
'可使用的序号';

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
'滑坡';

COMMENT ON COLUMN TB_SLDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_SLDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_SLDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_SLDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_SLDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_SLDSC.SLBU IS
'滑坡体积';

COMMENT ON COLUMN TB_SLDSC.SLUPAG IS
'滑坡面角度';

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
'坍塌';

COMMENT ON COLUMN TB_SLIDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_SLIDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_SLIDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_SLIDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_SLIDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_SLIDSC.SLIAR IS
'坍塌面积';

COMMENT ON COLUMN TB_SLIDSC.SLIMS IS
'坍塌方量';

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
'滑动';

COMMENT ON COLUMN TB_SLUDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_SLUDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_SLUDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_SLUDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_SLUDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_SLUDSC.SLUPAG IS
'滑动面角度';

COMMENT ON COLUMN TB_SLUDSC.SLUDSP IS
'滑动位移';

COMMENT ON COLUMN TB_SLUDSC.SLUTP IS
'滑动类型';

COMMENT ON COLUMN TB_SLUDSC.SLUGLCN IS
'滑动面地质情况';

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
'渗水';

COMMENT ON COLUMN TB_SPDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_SPDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_SPDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_SPDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_SPDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_SPDSC.SPAR IS
'渗水面积';

COMMENT ON COLUMN TB_SPDSC.SPQ IS
'渗透流量';

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
'建筑物';

COMMENT ON COLUMN TB_ST.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_ST.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_ST.STNM IS
'建筑物名称';

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
'险情';

COMMENT ON COLUMN TB_STDNC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_STDNC.XQFLDM IS
'险情分类代码';

COMMENT ON COLUMN TB_STDNC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_STDNC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_STDNC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_STDNC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_STDNC.DNCGR IS
'险情级别';

COMMENT ON COLUMN TB_STDNC.DAGPLCCH IS
'出险地点桩号';

COMMENT ON COLUMN TB_STDNC.DAGLO IS
'出险部位';

COMMENT ON COLUMN TB_STDNC.RDEPL IS
'抢险方案';

COMMENT ON COLUMN TB_STDNC.RDERESCN IS
'抢险资源配备';

COMMENT ON COLUMN TB_STDNC.TPN IS
'群众投入';

COMMENT ON COLUMN TB_STDNC.PLAPN IS
'解放军投入';

COMMENT ON COLUMN TB_STDNC.PLIPN IS
'武警投入';

COMMENT ON COLUMN TB_STDNC.RDECNRL IS
'进展及结果';

COMMENT ON COLUMN TB_STDNC.DNCCUAN IS
'险情原因分析';

COMMENT ON COLUMN TB_STDNC.DNCESTDV IS
'险情发展趋势';

COMMENT ON COLUMN TB_STDNC.DNCPBNFZ IS
'可能影响范围';

COMMENT ON COLUMN TB_STDNC.RZ IS
'当前运行水位';

COMMENT ON COLUMN TB_STDNC.WTHCN IS
'抢险时气象情况';

COMMENT ON COLUMN TB_STDNC.FHYWTHCN IS
'未来水文气象情况';

COMMENT ON COLUMN TB_STDNC.DNCADDSC IS
'补充描述';

COMMENT ON COLUMN TB_STDNC.WTDPCD IS
'填报单位名称';

COMMENT ON COLUMN TB_STDNC.WTDPDT IS
'填报时间';

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
'险情多媒体资料';

COMMENT ON COLUMN TB_STDNC_M.ZLBM IS
'资料编码';

COMMENT ON COLUMN TB_STDNC_M.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_STDNC_M.DTCDT IS
'采集时间';

COMMENT ON COLUMN TB_STDNC_M.TITLE IS
'标题';

COMMENT ON COLUMN TB_STDNC_M.WJGS IS
'文件格式';

COMMENT ON COLUMN TB_STDNC_M.NRMS IS
'内容描述';

COMMENT ON COLUMN TB_STDNC_M.LXZP IS
'录像照片';

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
'蓄（滞）行洪区运行';

COMMENT ON COLUMN TB_STOFLER.PJRNO IS
'运行编号';

COMMENT ON COLUMN TB_STOFLER.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_STOFLER.DTCDT IS
'检测时间';

COMMENT ON COLUMN TB_STOFLER.PJNM IS
'工程名称';

COMMENT ON COLUMN TB_STOFLER.BKOT IS
'所在岸别';

COMMENT ON COLUMN TB_STOFLER.DSFLWZ IS
'设计行(蓄)洪水位';

COMMENT ON COLUMN TB_STOFLER.DSFLW IS
'设计行(蓄)洪量';

COMMENT ON COLUMN TB_STOFLER.TRFCN IS
'交通状况';

COMMENT ON COLUMN TB_STOFLER.DKCN IS
'圩堤状况';

COMMENT ON COLUMN TB_STOFLER.CWFCCN IS
'通讯预警设施状况';

COMMENT ON COLUMN TB_STOFLER.SFSRCN IS
'避水救生设施状况';

COMMENT ON COLUMN TB_STOFLER.FLFADSC IS
'分洪设施状况';

COMMENT ON COLUMN TB_STOFLER.IDSTCN IS
'排水站状况';

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
'应力过大';

COMMENT ON COLUMN TB_STREXDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_STREXDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_STREXDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_STREXDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_STREXDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_STREXDSC.MXTNST IS
'最大拉应力';

COMMENT ON COLUMN TB_STREXDSC.MXCMST IS
'最大压应力';

COMMENT ON COLUMN TB_STREXDSC.CONGR IS
'混凝土标号';

COMMENT ON COLUMN TB_STREXDSC.ASTR IS
'允许应力值';

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
'淘刷';

COMMENT ON COLUMN TB_UNDSC.DNCNO IS
'险情编号';

COMMENT ON COLUMN TB_UNDSC.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_UNDSC.STTPCD IS
'建筑物编码';

COMMENT ON COLUMN TB_UNDSC.DAGTM IS
'出险时间';

COMMENT ON COLUMN TB_UNDSC.DNCNM IS
'险情名称';

COMMENT ON COLUMN TB_UNDSC.TODFTDI IS
'距堤脚距离	';

COMMENT ON COLUMN TB_UNDSC.UNDAR IS
'淘刷面积';

COMMENT ON COLUMN TB_UNDSC.UNDD IS
'淘刷深度';

COMMENT ON COLUMN TB_UNDSC.UNDL IS
'淘刷长度';

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
'用户登记';

COMMENT ON COLUMN TB_USER.NAME IS
'用户名称';

COMMENT ON COLUMN TB_USER.AUTH IS
'用户权限';

COMMENT ON COLUMN TB_USER.PASS IS
'口令';

COMMENT ON COLUMN TB_USER.NT IS
'说明';

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
'流域省份对照表';

COMMENT ON COLUMN TB_VP.LYDM IS
'流域代码';

COMMENT ON COLUMN TB_VP.LYMC IS
'流域名称';

COMMENT ON COLUMN TB_VP.SFDM IS
'省份代码';

COMMENT ON COLUMN TB_VP.SFMC IS
'省份名称';

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
'水毁工程修复进度统计';

COMMENT ON COLUMN TB_WDMPJRHS.RPJINCD IS
'RPJINCD';

COMMENT ON COLUMN TB_WDMPJRHS.CNTCD IS
'行政区划代码';

COMMENT ON COLUMN TB_WDMPJRHS.STADT IS
'统计日期';

COMMENT ON COLUMN TB_WDMPJRHS.STAPTE IS
'统计时段止';

COMMENT ON COLUMN TB_WDMPJRHS.CTCD IS
'流域代码';

COMMENT ON COLUMN TB_WDMPJRHS.DKL IS
'堤防长度';

COMMENT ON COLUMN TB_WDMPJRHS.BPL IS
'护岸长度';

COMMENT ON COLUMN TB_WDMPJRHS.BT IS
'垛坝';

COMMENT ON COLUMN TB_WDMPJRHS.CLVGT IS
'涵闸';

COMMENT ON COLUMN TB_WDMPJRHS.VALL IS
'圩垸';

COMMENT ON COLUMN TB_WDMPJRHS.RSL IS
'大型水库';

COMMENT ON COLUMN TB_WDMPJRHS.RSM IS
'中型水库';

COMMENT ON COLUMN TB_WDMPJRHS.RSS IS
'小型水库';

COMMENT ON COLUMN TB_WDMPJRHS.NTSTA IS
'其它类型工程';

COMMENT ON COLUMN TB_WDMPJRHS.CMERMS IS
'计划完成土方';

COMMENT ON COLUMN TB_WDMPJRHS.TERPER IS
'完成土方百分数';

COMMENT ON COLUMN TB_WDMPJRHS.CMRCKMS IS
'计划完成石方';

COMMENT ON COLUMN TB_WDMPJRHS.TRCKPER IS
'完成石方百分数';

COMMENT ON COLUMN TB_WDMPJRHS.CMCONMS IS
'计划完成混凝土方数';

COMMENT ON COLUMN TB_WDMPJRHS.TCONPER IS
'完成混凝土方百分数';

COMMENT ON COLUMN TB_WDMPJRHS.CMFU IS
'计划用资金';

COMMENT ON COLUMN TB_WDMPJRHS.TFUPER IS
'已使用资金百分数';

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
'行政区划代码';

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
'行政区划代码';

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
'行政区划代码';

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
'水闸运行';

COMMENT ON COLUMN TB_WLR.PJRNO IS
'运行编号';

COMMENT ON COLUMN TB_WLR.PJNO IS
'PJNO';

COMMENT ON COLUMN TB_WLR.DTCDT IS
'检测时间';

COMMENT ON COLUMN TB_WLR.PJNM IS
'工程名称';

COMMENT ON COLUMN TB_WLR.WLGR IS
'水闸等别';

COMMENT ON COLUMN TB_WLR.RUPGZ IS
'当前闸上水位';

COMMENT ON COLUMN TB_WLR.RDWGZ IS
'当前闸下水位';

COMMENT ON COLUMN TB_WLR.RQO IS
'当前过闸流量';

COMMENT ON COLUMN TB_WLR.RWSTOWLT IS
'当前水面距闸顶距离';

COMMENT ON COLUMN TB_WLR.GFPFCN IS
'坝基完好状况';

COMMENT ON COLUMN TB_WLR.STPFCN IS
'建筑物完好状况';

COMMENT ON COLUMN TB_WLR.EDDPFCN IS
'消能工完好状况';

COMMENT ON COLUMN TB_WLR.GTHOPFCN IS
'闸门、启闭机完好状况';

COMMENT ON COLUMN TB_WLR.COMMCN IS
'通讯手段及状况';

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
'填报单位';

COMMENT ON COLUMN TB_WT.WTDPCD IS
'填报单位代码';

COMMENT ON COLUMN TB_WT.WTDPNM IS
'填报单位名称';

COMMENT ON COLUMN TB_WT.WTDPTY IS
'填报单位负责人';

COMMENT ON COLUMN TB_WT.WT IS
'填报人';

COMMENT ON COLUMN TB_WT.REPH IS
'联系电话';

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
'险情分类';

COMMENT ON COLUMN TB_XQFL.XQFLDM IS
'险情分类代码';

COMMENT ON COLUMN TB_XQFL.XQFLMC IS
'险情分类名称';

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
'最新工情视图';

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

