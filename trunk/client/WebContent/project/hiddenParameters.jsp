<%@ page contentType="text/html;charset=GBK"%>
<input type="hidden" name="filepath" value=""/>
<input type="hidden" name="actionType" value=""/>
<input type="hidden" name="SAVETYPES" value=""/>
<!-- 工程运行状态 -->
<input type="hidden" name="XQYC" value=""/>
<input type="hidden" name="DFJZZK" value=""/>
<input type="hidden" name="QT" value=""/>
<input type="hidden" name="BJWHZK" value=""/>
<input type="hidden" name="BTWDZK" value=""/>
<input type="hidden" name="HPHAWDQK" value=""/>
<input type="hidden" name="TXSDJZK" value=""/>
<input type="hidden" name="XSJZWZK" value=""/>
<input type="hidden" name="XNGWHZK" value=""/>
<input type="hidden" name="ZMQBJZK" value=""/>
<!-- 工程险情 -->
<input type="hidden" name="BCMS" value=""/>
<input type="hidden" name="QXFA" value=""/>
<input type="hidden" name="QXZYPB" value=""/>
<input type="hidden" name="JZJJG" value=""/>
<input type="hidden" name="XQYYFX" value=""/>
<input type="hidden" name="XQFZQS" value=""/>
<input type="hidden" name="KNYXFW" value=""/>
<input type="hidden" name="QXSQX" value=""/>
<input type="hidden" name="WLSWQX" value=""/>

<!-- 险情分类 -->

<input type="hidden" name="LKGTU" value=""/>		<!--漏水混清	==D004==D003-->

<input type="hidden" name="SLUPAG" value=""/>		<!--滑坡面角度(度)	==D006==D012-->

<input type="hidden" name="TODFTDI" value=""/>		<!--距堤脚距离(米)	==D007==D009==D003==D004-->

<input type="hidden" name="WDQ" value=""/><!--河道流量(立方米/秒）	==D011==D009-->

<input type="hidden" name="DSSPN" value=""/>		<!--受灾人口(人)	==D001==D015-->
<input type="hidden" name="INPN" value=""/>		<!--受伤人口(人)	==D001==D015-->
<input type="hidden" name="DTHPN" value=""/>		<!--死亡人口(人)	==D001==D015-->
<input type="hidden" name="WRHS" value=""/>		<!--倒塌房屋(间)	==D001==D015-->
<input type="hidden" name="CRPDSSAR" value=""/>	<!--农作物受灾面积(公顷)	==D001==D015-->
<input type="hidden" name="SCDMFMAR" value=""/>	<!--毁坏耕地面积(公顷)		==D001==D015-->
<input type="hidden" name="DRCECLS" value=""/>		<!--直接经济损失(万元)	==D001==D015-->

<input type="hidden" name="WRAR" value=""/>		<!--破坏面积(平方米)	==D023==D024-->
<!--D001	决口				TB_BURDSC-->
<input type="hidden" name="BUW" value=""/>			<!--决口宽度(米)-->
<input type="hidden" name="BUVL" value=""/>		<!--决口流速(米/秒)-->
<input type="hidden" name="BUZDF" value=""/>		<!--决口水头差(米)-->
<input type="hidden" name="BUQ" value=""/>			<!--决口流量(立方米/秒)-->
<input type="hidden" name="BURLDGL" value=""/>		<!--决口处地形地质条件-->
<!--D002	漫溢				TB_OVFLDSC-->
<input type="hidden" name="OVFLL" value=""/>		<!--漫溢长度(米)-->
<input type="hidden" name="OVFLZ" value=""/>		<!--漫溢水位(米)-->
<input type="hidden" name="DSQ" value=""/>			<!--漫溢流量(立方米/秒)-->
<!--D003	漏洞				TB_LKDSC-->
<input type="hidden" name="LKDMT" value=""/>		<!--漏洞直径(米)-->
<input type="hidden" name="LKQ" value=""/>			<!--漏洞流量(升/秒)-->
<input type="hidden" name="LKWTLH" value=""/>		<!--漏洞水柱高(米)-->

<input type="hidden" name="LKSAR" value=""/>		<!--已形成漏洞群面积(平方米)-->
<!--D004	管涌				TB_PPDSC-->
<input type="hidden" name="PPQ" value=""/>			<!--管涌流量(升/秒)-->
<input type="hidden" name="WTLH" value=""/>		<!--水柱高(米)-->

<input type="hidden" name="PPSAR" value=""/>		<!--已形成管涌群面积(平方米)-->
<!--D005	陷坑				TB_PITDSC-->
<input type="hidden" name="SBDSP" value=""/>		<!--陷坑深度(米)-->
<input type="hidden" name="SBAR" value=""/>		<!--陷坑面积(平方米)-->

<!--D006	滑坡 			TB_SLDSC-->
<input type="hidden" name="SLBU" value=""/>		<!--滑坡体积(立方米)-->

<!--D007	淘刷				TB_UNDSC-->
<input type="hidden" name="UNDAR" value=""/>		<!--淘刷面积(平方米)-->
<input type="hidden" name="UNDD" value=""/>		<!--淘刷深度(米)-->
<input type="hidden" name="UNDL" value=""/>		<!--淘刷长度(米)-->

<!--D008	裂缝				TB_CRDSC-->
<input type="hidden" name="CRDR" value=""/>		<!--裂缝方向-->
<input type="hidden" name="CRD" value=""/>			<!--裂缝深度(米)-->
<input type="hidden" name="CRL" value=""/>			<!--裂缝长度(米)-->
<input type="hidden" name="CRW" value=""/>			<!--裂缝宽度(厘米)-->

<!--D009	崩岸				TB_CVDSC-->

<input type="hidden" name="CVL" value=""/>			<!--崩塌长度(米)-->
<input type="hidden" name="CVBU" value=""/>		<!--崩塌体积(立方米)-->
<input type="hidden" name="RVH" value=""/>			<!--河岸高度(米)-->
<input type="hidden" name="FLCNDSC" value=""/>		<!--水流情况描述-->
<!--D010	渗水				TB_SPDSC-->
<input type="hidden" name="SPAR" value=""/>		<!--渗水面积(平方米)-->
<input type="hidden" name="SPQ" value=""/>			<!--SPQ-->
<!--D011	 浪坎 			TB_BLBAD-->
<input type="hidden" name="BLH" value=""/>			<!--浪高(米)-->
<input type="hidden" name="WNS" value=""/>			<!--风速(级)-->
<!--D012	滑动				TB_SLUDSC-->
<input type="hidden" name="SLUDSP" value=""/>		<!--滑动位移(米)-->
<input type="hidden" name="SLUTP" value=""/>		<!--滑动类型-->
<input type="hidden" name="SLUGLCN" value=""/>		<!--滑动面地质情况-->
<!--D013	启闭失灵			TB_HOMLFDSC-->
<input type="hidden" name="POWCUT" value=""/>		<!--停电-->
<input type="hidden" name="HOMLF" value=""/>		<!--启闭机失灵-->
<input type="hidden" name="GSDST" value=""/>		<!--闸门井变形-->
<input type="hidden" name="MLFCN" value=""/>		<!--失灵时开启状况-->
<!--D014	闸门破坏			TB_GTWRDSC-->
<input type="hidden" name="WRDSC" value=""/>		<!--破坏形式-->
<input type="hidden" name="WRQ" value=""/>			<!--失事时流量(立方米/秒)-->
<!--D015	溃坝				TB_BRDMDSC-->
<input type="hidden" name="BRDMW" value=""/>		<!--溃坝宽度(米)-->
<input type="hidden" name="PJPS" value=""/>		<!--工程现状-->
<input type="hidden" name="BRZDMCDI" value=""/>	<!--库水位距堤顶距离(米)-->
<input type="hidden" name="BRV" value=""/>			<!--溃坝时库容(万立方米)-->
<input type="hidden" name="BRDMQ" value=""/>		<!--溃坝流量(立方米/秒)-->
<input type="hidden" name="BRDMLDGL" value=""/>	<!--溃坝处地形、地质条件-->
<!--D016	倾覆				TB_OVTUDSC-->
<input type="hidden" name="OVTUDR" value=""/>		<!--倾覆方向-->
<input type="hidden" name="OVTUAG" value=""/>		<!--倾覆角度(度)-->
<!--D017	应力过大			TB_STREXDSC-->
<input type="hidden" name="MXTNST" value=""/>		<!--最大拉应力(牛/平方毫米)-->
<input type="hidden" name="MXCMST" value=""/>		<!--最大压应力(牛/平方毫米)-->
<input type="hidden" name="CONGR" value=""/>		<!--混凝土标号-->
<input type="hidden" name="ASTR" value=""/>		<!--允许应力值(牛/平方毫米)-->
<!--D018	坍塌				TB_SLIDSC-->
<input type="hidden" name="SLIAR" value=""/>		<!--坍塌面积(平方米)-->
<input type="hidden" name="SLIMS" value=""/>		<!--坍塌方量(立方米)-->
<!--D019	堵塞				TB_PLUDSC-->
<input type="hidden" name="PLTNM" value=""/>		<!--堵塞物名称-->
<input type="hidden" name="PLTBU" value=""/>		<!--堵塞物体积(立方米)-->
<!--D020	基础破坏			TB_BSWRDSC-->
<input type="hidden" name="GRNSPDSC" value=""/>	<!--基础渗漏描述-->
<input type="hidden" name="GRNUSB" value=""/>		<!--据传不均匀沉降(米)-->
<input type="hidden" name="GROVCHWR" value=""/>	<!--基础超载破坏-->

<!--D021	消能工破坏		TB_EDDWRDSC-->
<input type="hidden" name="APWR" value=""/>		<!--底板掀起-->
<input type="hidden" name="WSTWR" value=""/>		<!--止水破坏-->
<!--D022		基础排水失效		TB_BSWPLPDS-->
<input type="hidden" name="WPPLU" value=""/>		<!--排水孔堵塞-->
<input type="hidden" name="WPEQML" value=""/>		<!--排水设备失灵-->
<!--D023	洞身破坏 			TB_HBWRDSC-->
<input type="hidden" name="WRMS" value=""/><!--破坏方量(立方米)-->
<input type="hidden" name="LNINF" value=""/><!--对衬砌造成的影响-->
<input type="hidden" name="HBGLCN" value=""/><!--洞身地质情况-->
<!--D024	控导工程局部破坏	TB_CLPJPRWR-->

<input type="hidden" name="WRD" value=""/>			<!--破坏深度(米)-->
<input type="hidden" name="WRL" value=""/>			<!--破坏长度(米)-->
<input type="hidden" name="WRGLCN" value=""/>		<!--破坏处地质情况-->
<!--D025	控导工程冲毁		TB_CLPJSCDN-->
<input type="hidden" name="SCDMBU" value=""/>		<!--冲毁体积(立方米)-->
<input type="hidden" name="SCDML" value=""/>		<!--冲毁长度(米)-->
<input type="hidden" name="SCDMD" value=""/>		<!--冲毁深度(米)-->
<input type="hidden" name="SCDMGLCN" value=""/>		<!--冲毁处地质情况-->
