<%@ page contentType="text/html;charset=GBK"%>
<input type="hidden" name="filepath" value=""/>
<input type="hidden" name="actionType" value=""/>
<input type="hidden" name="SAVETYPES" value=""/>
<!-- disable 后不能取到,在disable之前为其赋值-->
<input type="hidden" name="picid" value=""/>
<input type="hidden" name="check" value="1"/><!-- 是否删除多媒体临时表数据标志1,删除,2不删除 -->
<input type="hidden" name="uptype" value=""/>
<input type="hidden" name="XQYC" value=""/>
<input type="hidden" name="DFJZZK" value=""/>
<input type="hidden" name="QT" value=""/>
<input type="hidden" name="uptype" value=""/>
<!-- TB_RSR	水库	B -->
<input type="hidden" name="RSCLS" value=""/>	<!-- 水库类别(良好/尚好/病险库) -->
<input type="hidden" name="RV" value=""/>		<!-- 当前库容(万立方米) -->
<input type="hidden" name="RZ" value=""/>		<!-- 当前运行水位(米)===TB_RSR===TB_DKR -->
<input type="hidden" name="RQ" value=""/>		<!-- 当前泻量(立方米/秒)===TB_RSR===TB_DKR -->
<input type="hidden" name="DFPFCN" value=""/>	<!-- 坝基完好状况 -->	
<input type="hidden" name="DBSTBCN" value=""/>	<!-- 坝体稳定情况 -->	
<input type="hidden" name="BRBPPFCN" value=""/>	<!-- 护坡护岸稳定情况===TB_RSR===TB_DKR -->	
<input type="hidden" name="ESPFCN" value=""/>	<!-- 泄水建筑物完好状况 -->	
<input type="hidden" name="EDDPFCN" value=""/>	<!-- 消能工完好状况===TB_RSR===TB_WLR -->	
<input type="hidden" name="GTHOPFCN" value=""/>	<!-- 闸门、启闭机完好状况===TB_RSR===TB_WLR -->	
<input type="hidden" name="COMMCN" value=""/>	<!-- 通讯手段及状况===TB_RSR===TB_WLR -->	
<!-- TB_WLR 	水闸	K -->
<input type="hidden" name="WLGR" value=""/>		<!-- 水闸等别(一/二/三/四/五) --> 
<input type="hidden" name="RUPGZ" value=""/>	<!-- 当前闸上水位(米) -->	
<input type="hidden" name="RDWGZ" value=""/>	<!-- 当前闸下水位(米) -->	
<input type="hidden" name="RQO" value=""/>		<!-- 当前过闸流量(立方米/秒) -->
<input type="hidden" name="RWSTOWLT" value=""/>	<!-- 当前水面距闸顶距离(米) -->	
<input type="hidden" name="GFPFCN" value=""/>	<!-- 坝基完好状况  -->	
<input type="hidden" name="STPFCN" value=""/>	<!-- 建筑物完好状况  -->	
<!-- TB_COWAPJ 治河工程	N -->
<input type="hidden" name="BKOT" value=""/>		<!-- 所在岸别(左/右)===TB_DKR===TB_COWAPJ===TB_STOFLER -->
<input type="hidden" name="FLCNDSC" value=""/>	<!-- 水流情况描述 -->	
<input type="hidden" name="WDCNDSC" value=""/>	<!-- 河道情况描述 -->	
<input type="hidden" name="PRCCLR" value=""/>	<!-- 清障的落实 -->	
<input type="hidden" name="SPURDSC" value=""/>	<!-- 控导工程描述 -->	
<input type="hidden" name="BPPJCN" value=""/>	<!-- 护岸工程情况 -->	
<!-- TB_STOFLER	蓄滞	F -->
<input type="hidden" name="DSFLWZ" value=""/>	<!-- 设计行(蓄)洪水位(米) -->	
<input type="hidden" name="DSFLW" value=""/>	<!-- 设计行(蓄)洪量(万立方米) -->	
<input type="hidden" name="TRFCN" value=""/>	<!-- 交通状况 -->	
<input type="hidden" name="DKCN" value=""/>		<!-- 圩堤状况 -->	
<input type="hidden" name="CWFCCN" value=""/>	<!-- 通讯预警设施状况 -->	
<input type="hidden" name="SFSRCN" value=""/>	<!-- 避水救生设施状况 -->	
<input type="hidden" name="FLFADSC" value=""/>	<!-- 分洪设施状况 -->	
<input type="hidden" name="IDSTCN" value=""/>	<!-- 排水站状况 -->	
<!-- TB_DKR	堤防==海堤==圩垸==穿堤 -->
<input type="hidden" name="DKGR" value=""/>		<!-- 堤防级别(1/2/3/4/5) -->
<input type="hidden" name="STECH" value=""/>	<!-- 起止桩号 -->	
<input type="hidden" name="WSTODC" value=""/>	<!-- 水面距堤顶距离(米)  -->	
<input type="hidden" name="DKPFCN" value=""/>	<!-- 堤防完好状况 -->	
<input type="hidden" name="TSCN" value=""/>		<!-- 穿堤建筑物状况 -->	