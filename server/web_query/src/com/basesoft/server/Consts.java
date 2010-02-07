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
		{"D025","控导工程冲毁","TB_CLPJSCDN"}
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

/*
 * 以下代码是 向oracel写入blob内容的代码 // 不要自动提交事务，因为要分两次对同一个记录插入数据 if
 * (cnSource.getAutoCommit()) { cnSource.setAutoCommit(false); }
 * 
 * int zlbm = 110; // 写入blob字段的代码在此！ String strSql = "insert into
 * tb_pjr_m(zlbm,pjrno,dtcdt,title,nrms,wjgs) "+ " values(" + zlbm + ", 117,
 * to_date('2001-01-01','yyyy-mm-dd'),'试验写blob','内容描述','mpg')";
 * 
 * Statement sourceStmt = cnSource.createStatement( );
 * 
 * ResultSet sourceCursor = sourceStmt.executeQuery( strSql.toUpperCase() );
 * sourceCursor.close();
 * 
 * strSql = "select lxzp from tb_pjr_m where zlbm = "+zlbm; sourceStmt =
 * cnSource.createStatement( ); sourceCursor = sourceStmt.executeQuery(
 * strSql.toUpperCase() );
 * 
 * sourceCursor.next(); oracle.sql.BLOB blob = (oracle.sql.BLOB)
 * sourceCursor.getBlob(1);
 * 
 * System.out.println("取回空 lob 内容？");
 * 
 * System.out.println("正在绑定oracle字段...");
 * 
 * //oracle.sql.BLOB myblob = (oracle.sql.BLOB) sourceCursor.getBlob( i ); //
 * Blob blob = rs.getBlob(1); OutputStream blobOs = ( (oracle.sql.BLOB)
 * blob).getBinaryOutputStream(); FileInputStream fis = new
 * FileInputStream("d:\\007.mpg");
 * 
 * byte[] buffer = new byte[10 * 1024]; int noOfBytes = 0; // Number of bytes
 * read while ((noOfBytes = fis.read(buffer)) != -1) blobOs.write(buffer, 0,
 * noOfBytes); // Write to Blob
 * 
 * fis.close(); blobOs.close(); //serverPreStmt.setBlob( i, myblob );
 * cnSource.commit(); // 手动提交
 * 
 * System.out.println("成功写入blob字段");
 *  // 试验对oracle写入Clob数据 // 不要自动提交事务，因为要分两次对同一个记录插入数据 /*if
 * (cnSource.getAutoCommit()) { cnSource.setAutoCommit(false); }
 * 
 * int zlbm = 9; // 写入blob字段的代码在此！ String strSql = "insert into
 * tb_fpacti(RPJINCD, WTTT, WTDT, WTDPCD)"+ " values(" + zlbm + ", '防汛行动',
 * to_date('2001-01-01','yyyy-mm-dd'),'人大金仓')";
 * 
 * Statement sourceStmt = cnSource.createStatement( );
 * 
 * System.out.println(strSql.toUpperCase());
 * 
 * ResultSet sourceCursor = sourceStmt.executeQuery( strSql.toUpperCase() );
 * sourceCursor.close();
 * 
 * System.out.println("插入一条记录...");
 * 
 * strSql = "select ACTICO from tb_fpacti where rpjincd = "+zlbm; sourceStmt =
 * cnSource.createStatement( ); sourceCursor = sourceStmt.executeQuery(
 * strSql.toUpperCase() );
 * 
 * sourceCursor.next(); oracle.sql.CLOB myClob = (oracle.sql.CLOB)
 * sourceCursor.getClob(1);
 * 
 * //char[] chns = "中华人民共和国万岁。".toCharArray(); //fillClob(cnSource, myClob,
 * chns);
 * 
 * /*Writer blobOs = myClob.getCharacterOutputStream(); FileReader fis = new
 * FileReader("d:\\setuplog.txt"); BufferedReader br = new BufferedReader(fis);
 * 
 * char[] buffer = new char[10 * 1024]; int noOfBytes = 0; // Number of bytes
 * read
 * 
 * while ((noOfBytes = br.read(buffer)) != -1) blobOs.write(buffer, 0,
 * buffer.length); // Write to clob
 * 
 * fis.close(); blobOs.close();
 * 
 * cnSource.commit(); // 手动提交 System.out.println("成功写入 clob 字段");
 * 
 * 
 * 
 * static void fillClob(Connection conn, oracle.sql.CLOB clob, char[] bigText)
 * throws Exception { Writer outstream = clob.getCharacterOutputStream();
 * 
 * //int i = 0; //int chunk = 10;
 * 
 * String s = " 26日晚8时，市政府副市长刘春林主持召开了防汛抗旱"+ "会商会，专题研究当前抗旱工作。会议通报了当前的旱情、"+
 * "分析了今后发展趋势，对后段抗旱工作作了具体安排。"+ "市农办、气象、水文、水利、农业、农机、电业等单位负责"+ "人参加了会议。"+ "
 * 今年以来，由于我市境内降雨普遍偏少，加之蓄水工程"+ "前期蓄水明显不足，全市出现了不同程度的旱情，特别是7"+
 * "月中旬以来，我市一直维持晴热高温少雨天气，部分地方旱"+ "情发展迅速，给群众生产生活带来一定困难。全市9个区、"+
 * "县（市）有164个乡（镇）受旱，受旱面积达155.8千公顷，"+ "占全市总耕地面积的36%，其中水稻86.5千公顷（中稻38.74"+
 * "千公顷，晚稻47.76千公顷），旱作物69.3千公顷，过白12.34"+ "千公顷，水稻枯萎7.82千公顷，旱作枯萎19.82千公顷。另"+
 * "有24.17千公顷无水翻耕。全市3956个村19万人、18.24万"+ "头牲畜饮水发生困难。全市总蓄水只有8.16亿立米，占可蓄"+
 * "水量的32%，接近历史同期最低蓄水。目前已有10座小型"+ "水库，4.3万处山塘干涸，164条溪河断流。受旱比较严重的"+
 * "有澧县、石门、汉寿、临澧、津市等县（市）。"+ " 会议对前段各级各部门密切配合、协同搞好抗旱工作给"+
 * "予了充分肯定，特别是对临澧、石门发扬龙江精神，与澧县"+ "一道团结抗旱，确保从青山干渠引水灌溉澧阳平原，给予了"+ "高度评价。"+ "
 * 会议分析了后段旱情发展趋势，认为我市后段抗旱形势"+ "将更加严峻：一是从全国和整个长江流域天气变化来看，目"+
 * "前已进入一个相对干旱的时期；二是从我市近期的天气情况"+ "来看，将持续维持晴热高温天气；三是从各地现有的抗旱水"+
 * "源来看，水源不足已成为抗旱中的最大问题；四是从抗旱的"+ "投入来看，将会越来越大。各地一定要认真落实市委市政府"+
 * "7月25日发出的“关于做好当前抗旱工作的指示”，突出抓"+ "好当前的抗旱工作。"+ " 刘春林在会上突出强调了几点：刘春林指出，各级各部"+
 * "门要充分认识当前全市的旱情，牢固树立抗大旱、抗长旱的"+ "思想。当前旱情普遍，发展迅速，水源稀缺，抗救困难大，"+
 * "抗旱设施老化、失修、缺少，部分基层干部对当前的旱情认"+ "识还不够，力量还没有摆在抗旱上来，有人还忙于收提留。"+
 * "目前，抗旱是大局，是农村的中心工作，领导干部的精力要"+ "集中到抗旱上来，旱情未解除前，上交收提留暂缓。"+ "
 * 刘春林强调，各级领导要牢记江总书记“三个代表”重"+ "要思想，充分认识农村抗旱保丰收的重要性和紧迫性，必须"+
 * "采取切实可行措施，科学制订抗旱规划。要加大市、县农口"+ "部门工作责任，加大县、乡、村干部抗旱的工作责任；要科"+
 * "学实施人工增雨，在确保安全的前提下，只要空中有降雨层"+ "就要开炮；要千方百计找水源、保水源，科学调度水源，合"+ "理使用水源。"+ "
 * 刘春林要求，各级各部门要坚持互相配合，协调抗旱。"+ "气象水文部门要加强预测预报，力求准确；水利部门要科学"+
 * "制订调水方案；水利、电力、农机部门要派得力力量到旱情"+ "严重的地方帮助指导抗旱；电力、石油部门要积极组织抗旱"+
 * "能源，确保抗旱能源需求；农业部门要积极做好抗灾补损工"+ "作，帮助灾民恢复生产，改制改种；各级财政、银信部门要"+
 * "提供资金支持抗旱；卫生防疫部门重点搞好人畜饮水的安"+ "全；新闻部门要加大宣传力度，要对当前旱情作出及时、准"+ "确、全面、深入地报道。"+ "
 * 发送：省防汛抗旱指挥部办公室、省厅办公室、市委办、"+ "市人大农业委、市政府办、市农办、市防汛指挥部领导成员、"+
 * "各区、县（市）防汛抗旱指挥部办公室。"+ "1、市人大副主任孙维忠要求：全力以赴抓好抗旱救灾"+ "2、青山北干通水 澧阳平原“解渴”"+
 * "市人大副主任孙维忠要求："+ "全力以赴抓好抗旱救灾"+ " 7月24日，市人大副主任孙维忠、市人大农业委主任高"+
 * "勇在市政府副秘书长田晓川陪同下，专门到市防指了解当前"+ "旱情。在认真听取了市防办关于抗旱工作的情况汇报后，孙"+
 * "维忠针对当前全市旱情发展趋势和抗旱水源严重不足等困"+ "难，对抗旱工作提出了四点要求："+ " 1、要对当前旱情引起高度重视。抗旱工作事关人民生"+
 * "产生活和社会稳定，各级各部门切不可麻痹大意、掉以轻心，"+ "一定要全力以赴抓好这项工作。"+ " 2、要落实具体措施和方案。当前，重点是要研究解决"+
 * "新辟抗旱水源的问题，乡与乡、县与县、灌区与灌区之间合"+ "理调剂水源的问题，节约用水、提高水利用率的问题。后段"+
 * "天气以晴热为主,因此各地要从最坏处着想。在水源严重不足"+ "的地方，要优先保证饮用水。"+ " 3、要抓紧做好情况收集工作。对当前受灾的面积及程"+
 * "度、水库蓄水等情况要及时收集，要保证掌握的情况全面,"+ "统计的数据准确翔实，各级防办要及时向上反映旱情，气象"+
 * "部门要加强气象监测和预报，为领导决策提供可靠依据。"+ " 4、要做好抗旱后勤保障工作。各级各部门要尽职尽责"+
 * "为当前的抗旱工作搞好服务，想方设法保证抗旱所需的资"+ "金、机械器具、油料和电力等。";
 * 
 * bigText = s.toCharArray();
 * 
 * //while (i < length) { //s = i + "hello world, 下午好啊！";
 * outstream.write(bigText, 0, bigText.length);
 * 
 * //i += s.length(); //if (length - i < s.length()) //chunk = (int) length - i; }
 * outstream.close(); }
 * 
 * 
 *  // 试验将大文件直接写入sql server 6.5的image字段中，看ODBC是否提示截断/部分更新错误？！ int zlbm = 630;
 * String strSql = "insert into tb_pjr_m(zlbm,pjrno,dtcdt,title,nrms,wjgs,lxzp) "+ "
 * values(" + zlbm + ", 558, '2001-01-01','试验写blob','内容描述','mpg',?)";
 * 
 * File file = new File("d:\\Setuplog.txt"); // 实际上限是多少？ 超过多少会发生截断？
 * FileInputStream fis = new FileInputStream(file); PreparedStatement ps =
 * cnSource.prepareStatement(strSql);
 * 
 * System.out.println("字段最大允许的字节数目：" + ps.getMaxFieldSize() ); // sql server
 * 6.5返回0， 意味着没有限制！ 天啊，我要晕了。。。
 * 
 * //ps.setMaxFieldSize( (int) (file.length()+1024*2) ); ps.setMaxFieldSize( 0 );
 * //主动设定对字段数据量的限制
 * 
 * ps.setBinaryStream(1,(InputStream)fis,(int)file.length());
 * ps.executeUpdate();
 * 
 * 
 * System.out.println("写入成功！");
 *  // 试验将大文件直接写入sql server 6.5的image字段中，看ODBC是否提示截断/部分更新错误？！ int zlbm = 689;
 * String strSql = "update tb_pjr_m set wjgs='mpg', lxzp=? where zlbm = "+zlbm ;
 * 
 * File file = new File("d:\\007.mpg"); // 实际上限是多少？ 超过多少会发生截断？ FileInputStream
 * fis = new FileInputStream(file); PreparedStatement ps =
 * cnSource.prepareStatement(strSql);
 * 
 * System.out.println("字段最大允许的字节数目：" + ps.getMaxFieldSize() ); // sql server
 * 6.5返回0， 意味着没有限制！ 天啊，我要晕了。。。
 * 
 * //ps.setMaxFieldSize( (int) (file.length()+1024*2) ); //ps.setMaxFieldSize( 0 );
 * //主动设定对字段数据量的限制
 * 
 * ps.setBinaryStream(1,(InputStream)fis,(int)file.length());
 * ps.executeUpdate();
 * 
 * 
 * System.out.println("写入成功！");
 * 
 * 
 */