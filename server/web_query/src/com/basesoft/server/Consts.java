package com.basesoft.server;

public class Consts {

	public static final String[] TABLES={
//	"TB_HS",
//	"TB_HS_BAK",
//	"TB_HS_M",
	"TB_HYWDMS",
	"TB_JZWFL",
	"TB_LYSX",
	"TB_LYSX1",
	"TB_PICKREC",
	"TB_REPORTEDDATA",
//	"TB_SEQUENCE",
	"TB_USER",
	"TB_VP",
	"TB_WT",
	"TB_ZBJL",
//	"V_HOME",
	"TB_BCSTSDST",
	"TB_BLBADSC",
	"TB_BRDMDSC",
	"TB_BSWPLPDS",
	"TB_BSWRDSC",
	"TB_BURDSC",
	"TB_CLPJPRWR",
	"TB_CLPJSCDN",
	"TB_COWAPJ",
	"TB_CRDSC",
	"TB_CVDSC",
	"TB_DKDNCSTA1",
	"TB_DKDNCSTA2",
	"TB_DKR",
	"TB_DKSNWS",
	"TB_EDDWRDSC",
	"TB_FPACTI_M",
	"TB_FPACTI",
	"TB_FXJB_M",
	"TB_FXJB",
	"TB_GTWRDSC",
	"TB_HBWRDSC",
	"TB_HOMLFDSC",
	"TB_LKDSC",
	"TB_OVFLDSC",
	"TB_OVTUDSC",
	"TB_PITDSC",
	"TB_GCLB",
	"TB_PJR_M",
	"TB_PJRCN",
	"TB_PLUDSC",
	"TB_PPDSC",
	"TB_QT_M",
	"TB_QT",
	"TB_RDEST1",
	"TB_RDEST2",
	"TB_RSR",
	"TB_SD_M",
	"TB_SD",
	"TB_SLDSC",
	"TB_SLIDSC",
	"TB_SLUDSC",
	"TB_SPDSC",
	"TB_XQFL",
	"TB_STDNC_M",
	"TB_STDNC",
	"TB_STOFLER",
	"TB_STREXDSC",
	"TB_UNDSC",
	"TB_ST",
	"TB_WDMPJRHS",
	"TB_WDMPJS",
	"TB_WDMPJS1",
	"TB_WDMPJS2",
	"TB_CNT",
	"TB_WLR",
	"TB_PJ"};
	
	public static final String[][] XQFL={
		{"D001","决口","TB_BURDSC"},
		{"D002","漫溢","TB_OVFLDSC"},
		{"D003","漏洞","TB_LKDSC"},
		{"D004","管涌","TB_PPDSC"},
		{"D005","陷坑","TB_PITDSC"},
		{"D006","滑坡","TB_SLDSC"},
		{"D007","淘刷","TB_UNDSC"},
		{"D008","裂缝","TB_CRDSC"},
		{"D009","崩岸","TB_CVDSC"},
		{"D010","渗水","TB_SPDSC"},
		{"D011","浪坎","TB_BLBADSC"},
		{"D012","滑动","TB_SLUDSC"},
		{"D013","启闭失灵","TB_HOMLFDSC"},
		{"D014","闸门破坏","TB_GTWRDSC"},
		{"D015","溃坝","TB_BRDMDSC"},
		{"D016","倾覆","TB_OVTUDSC"},
		{"D017","应力过大","TB_STREXDSC"},
		{"D018","坍塌","TB_SLIDSC"},
		{"D019","堵塞","TB_PLUDSC"},
		{"D020","基础破坏","TB_BSWRDSC"},
		{"D021","消能工破坏","TB_EDDWRDSC"},
		{"D022","基础排水失效","TB_BSWPLPDS"},
		{"D023","洞身破坏","TB_HBWRDSC"},
		{"D024","控导工程局部破坏","TB_CLPJPRWR"},
		{"D025","控导工程冲毁","TB_CLPJSCDN"},
		{"D026","山洪灾害","TB_TORRENTS"}
	};
	
	public static final String[][] GCLB={
		{"B","水库","TB_RSR"},
		{"D","堤防(段)","TB_DKR"},
		{"E","海堤","TB_DKR"},
		{"F","蓄滞(行)洪区","TB_STOFLER"},
		{"H","圩垸","TB_DKR"},
		{"K","水闸","TB_WLR"},
		{"N","治河工程","TB_COWAPJ"},
		{"P","穿堤建筑物","TB_DKR"}
	};


}


//对数据分类处理时涉及的表和相关字段：
//
// 一.工情信息
// 1.工程表 tb_pj 需要更新pjno字段(来自服务器)
// 2.运行信息表 tb_pjrcn 需要更新pjno字段(来自tb_pj表)和pjrno字段(来自于服务器)
// 3.运行信息表对应的多媒体表 tb_pjr_m 需要更新pjrno(来自于tb_pj)和zlbm(来自于服务器)两个字段
// 4.详情表
// 1) TB_DKR 堤防 D 要更新pjrno和pjno两个字段(来自于tb_pjrcn更新后)的值
// 2) TB_DKR 海堤 E 要更新pjrno和pjno两个字段(来自于tb_pjrcn更新后)的值
// 3) TB_DKR 圩垸 H 要更新pjrno和pjno两个字段(来自于tb_pjrcn更新后)的值
// 4) TB_DKR 穿堤 P 要更新pjrno和pjno两个字段(来自于tb_pjrcn更新后)的值
// 5) TB_RSR 水库 B 要更新pjrno和pjno两个字段(来自于tb_pjrcn更新后)的值
// 6) TB_WLR 水闸 K 要更新pjrno和pjno两个字段(来自于tb_pjrcn更新后)的值
// 7) TB_COWAPJ 治河 N 要更新pjrno和pjno两个字段(来自于tb_pjrcn更新后)的值
// 8) TB_STOFLER 蓄滞 F 要更新pjrno和pjno两个字段(来自于tb_pjrcn更新后)的值
//
// 二.险情信息
// 1.工程表 tb_pj 需要更新pjno字段(来自服务器)
// 2.建筑物表 tb_st 需要更新pjno字段(来自tb_pj表)
// 3.险情信息表 tb_stdnc 需要更新pjno(来自于tb_pj)和dncno(来自于服务器)两个字段
// 4.险情信息表对应的多媒体表 tb_stdnc_m 需要更新dncno(来自于tb_pj)和zlbm(来自于服务器)两个字段
// 5.险情详情表 需要更新pjno(来自于tb_pj)和dncno(来自于服务器)两个字段
// 1). 决口: "D001" "TB_BURDSC"
// 2). 漫溢: "D002" "TB_OVFLDSC"
// 3). 漏洞: "D003" "TB_LKDSC"
// 4). 管涌 "D004" "TB_PPDSC"
// 5). 陷坑 "D005" "TB_PITDSC"
// 6). 滑坡 "D006" "TB_SLDSC"
// 7). 淘刷 "D007" "TB_UNDSC"
// 8). 裂缝 "D008" "TB_CRDSC"
// 9). 崩岸 "D009" "TB_CVDSC"
// 10). 渗水 "D010" "TB_SPDSC"
// 11). 浪坎 "D011" "TB_BLBADSC"
// 12). 滑动 "D012" "TB_SLUDSC"
// 13). 启闭失灵 "D013" "TB_HOMLFDSC"
// 14). 闸门破坏 "D014" "TB_GTWRDSC"
// 15). 溃坝 "D015" "TB_BRDMDSC"
// 16). 倾覆 "D016" "TB_OVTUDSC"
// 17). 应力过大 "D017" "TB_STREXDSC"
// 18). 坍塌 "D018" "TB_SLIDSC"
// 19). 堵塞 "D019" "TB_PLUDSC"
// 20). 基础破坏 "D020" "TB_BSWRDSC"
// 21). 消能工破坏 "D021" "TB_EDDWRDSC"
// 22). 基础排水失效 "D022" "TB_BSWPLPDS"
// 23). 洞身破坏 "D023""TB_HBWRDSC"
// 24). 控导工程局部破坏 "D024" "TB_CLPJPRWR"
// 25). 控导工程冲毁 "D025" "TB_CLPJSCDN"
//   
// 三.灾情信息
// 1.灾情表 tb_sd 需要更新rpjincd(来自于服务器)字段
// 2.灾情多媒体表 tb_sd_m 需要更新和rpjincd(新值来自于tb_sd)和zlbm(新值来自于服务器)两个字段
//
// 四.其他信息
// 1.其他表 tb_QT 需要更新rpjincd(新值来自于服务器)字段
// 2.其他多媒体表 tb_qt_m 需要更新和rpjincd(新值来自于tb_QT)和zlbm(新值来自于服务器)两个字段
//
// 五.防汛信息
// 1.防汛表 tb_fpacti 需要更新rpjincd(新值来自于服务器)字段
// 2.防汛多媒体表 tb_fpacti_m 需要更新和rpjincd(新值来自于tb_fpacti)
// 和zlbm(新值来自于服务器)两个字段
//
// 六.简报信息
// 1.防汛表 tb_fxjb 需要更新rpjincd(新值来自于服务器)字段
// 2.防汛多媒体表 tb_fxjb_m 需要更新和rpjincd(新值来自于tb_fxjb)和zlbm(新值来自于服务器)两个字段
//
// 七.报表信息
// 共计 11 张表， 无需改变任何数据。可参见tbNamLst.txt
// (产生于2001-08-30 20:00,应重新检索最新的Access文件)
// pjdb.mdb
//
// 下列表需要更新rpjincd(新值来自于服务器)字段
// 1. TB_BCSTSDST
// 2. TB_DKDNCSTA1
// 3. TB_DKDNCSTA2
// 4. TB_DKSNWS
// 5. TB_HYWDMS
// 6. TB_RDEST1
// 7. TB_RDEST2
// 8. TB_WDMPJRHS
// 9. TB_WDMPJS
// 10. TB_WDMPJS1
// 11. TB_WDMPJS2
