/*==============================================================*/
/* Table: TB_GCLJ                                               */
/*==============================================================*/
create table TB_GCLJ  (
   SXBM                 VARCHAR(20),
   SXMC                 VARCHAR(20),
   LXBM                 VARCHAR(20),
   LXMC                 VARCHAR(20),
   GCMC                 VARCHAR(100),
   GCLJ                 VARCHAR(200)
);

comment on table TB_GCLJ is
'工程链接表';

comment on column TB_GCLJ.SXBM is
'市县编码';

comment on column TB_GCLJ.SXMC is
'市县名称';

comment on column TB_GCLJ.LXBM is
'类型编码';

comment on column TB_GCLJ.LXMC is
'类型名称';

comment on column TB_GCLJ.GCMC is
'工程名称';

comment on column TB_GCLJ.GCLJ is
'工程对应链接';


INSERT INTO TB_GCLJ VALUES('1','毕节市','2','中型水库','倒天河水库','blank_3144.html');
INSERT INTO TB_GCLJ VALUES('1','毕节市','1','小型水库','宋官水库','blank_3145.html');
INSERT INTO TB_GCLJ VALUES('1','毕节市','1','小型水库','利民水库','blank_3146.html');
INSERT INTO TB_GCLJ VALUES('1','毕节市','1','小型水库','小峨峰水库','blank_3147.html');
INSERT INTO TB_GCLJ VALUES('1','毕节市','1','小型水库','银厂沟水库','blank_3148.html');
INSERT INTO TB_GCLJ VALUES('1','毕节市','1','小型水库','罗圈岩水库','blank_3149.html');
INSERT INTO TB_GCLJ VALUES('1','毕节市','1','小型水库','小和平水库','blank_3150.html');
INSERT INTO TB_GCLJ VALUES('1','毕节市','1','小型水库','崔家沟水库','blank_3151.html');
INSERT INTO TB_GCLJ VALUES('1','毕节市','1','小型水库','雅木水库','blank_3152.html');
INSERT INTO TB_GCLJ VALUES('1','毕节市','1','小型水库','小果老水库','blank_3153.html');
INSERT INTO TB_GCLJ VALUES('1','毕节市','1','小型水库','松山大塘水库','blank_3154.html');
INSERT INTO TB_GCLJ VALUES('1','毕节市','1','小型水库','鸭子塘水库','blank_3155.html');
INSERT INTO TB_GCLJ VALUES('1','毕节市','1','小型水库','石板沟水库','blank_3156.html');
INSERT INTO TB_GCLJ VALUES('1','毕节市','1','小型水库','野鸡水库','blank_3157.html');
INSERT INTO TB_GCLJ VALUES('1','毕节市','4','灰渣坝(尾矿坝)','毕节市头步电厂灰库','blank_3158.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','2','中型水库','落脚河电站水库','blank_3159.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','2','中型水库','东风水电站水库','blank_3160.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','小箐沟水库','blank_3161.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','宋家沟水库','blank_3162.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','东郊水库','blank_3163.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','露海水库','blank_3164.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','三岔沟水库','blank_3165.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','大消洞水库','blank_3166.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','官田水库','blank_3167.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','新源水库','blank_3168.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','牛集水库','blank_3169.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','石板河水库','blank_3170.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','劈山水库','blank_3171.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','移山水库','blank_3172.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','毛栗水库','blank_3173.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','倒铧冲水库','blank_3174.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','大岩洞水库','blank_3175.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','凉水井水库','blank_3176.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','水头上水库','blank_3177.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','新街水库','blank_3178.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','沙田水库','blank_3179.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','马家田水库','blank_3180.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','大哑口水库','blank_3181.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','大水沟水库(城关)','blank_3182.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','大水沟水库(高店)','blank_3183.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','螺丝塘水库','blank_3184.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','云龙山水库','blank_3185.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','大海坝水库','blank_3186.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','小海坝水库','blank_3187.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','白瓦厂水库','blank_3188.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','龙王庙水库','blank_3189.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','九股水水库','blank_3190.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','1','小型水库','杨家湾水库','blank_3191.html');
INSERT INTO TB_GCLJ VALUES('2','大方县','4','灰渣坝(尾矿坝)','大方县灰渣坝','blank_3192.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','3','大型水库','洪家渡电站水库','blank_3193.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','2','中型水库','附廓水库','blank_3194.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','2','中型水库','沙坝河水电站水库','blank_3195.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','水淹坝水库','blank_3196.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','野那沟水库','blank_3197.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','卷洞门水库','blank_3198.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','干河沟水库','blank_3199.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','大明堰水库','blank_3200.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','双树沟水库','blank_3201.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','龙家槽水库','blank_3202.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','田冲水库','blank_3203.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','大田水库','blank_3204.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','烂田冲水库','blank_3205.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','王家堰水库','blank_3206.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','湘明水库','blank_3207.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','鹅项井水库','blank_3208.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','绿塘子水库','blank_3209.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','苦鱼井水库','blank_3210.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','堰石灰水库','blank_3211.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','落底田水库','blank_3212.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','化那寨水库','blank_3213.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','小寨水库','blank_3214.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','龙滩口水库','blank_3215.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','木弄水库','blank_3216.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','新山水库','blank_3217.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','六勒水库','blank_3218.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','绿堰滩水库','blank_3219.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','上坝水库','blank_3220.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','青山水库','blank_3221.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','青甫塘水库','blank_3222.html');
INSERT INTO TB_GCLJ VALUES('3','黔西县','1','小型水库','粮田水库','blank_3223.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','2','中型水库','小洋溪水库','blank_3224.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','上坝水库','blank_3225.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','文家桥水库','blank_3226.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','川洞水库','blank_3227.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','西洛河水库','blank_3228.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','箐河水库','blank_3229.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','白果水库','blank_3230.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','木蓑衣水库','blank_3231.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','长征电站水库','blank_3232.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','倒座岩水库','blank_3233.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','拦河堰水库','blank_3234.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','烂田坝水库','blank_3235.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','三岔沟水库','blank_3236.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','史家田水库','blank_3237.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','龙塘坝水库','blank_3238.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','新民水库','blank_3239.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','民丰水库','blank_3240.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','穿洞水库','blank_3241.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','晏家沟水库','blank_3242.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','西堰坎水库','blank_3243.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','官田水库','blank_3244.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','马桥水库','blank_3245.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','继红水库','blank_3246.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','水淹凼水库','blank_3247.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','杨桃沟水库','blank_3248.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','四块田水库','blank_3249.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','新庄水库','blank_3250.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','老鹰屯水库','blank_3251.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','民族水库','blank_3252.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','大湾水库','blank_3253.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','小沟水库','blank_3254.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','1','小型水库','鱼箐沟水库','blank_3255.html');
INSERT INTO TB_GCLJ VALUES('4','金沙县','4','灰渣坝(尾矿坝)','金沙县灰渣坝','blank_3256.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','1','小型水库','红阳水库','blank_3257.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','1','小型水库','吹聋水库','blank_3258.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','1','小型水库','自强电站水库','blank_3259.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','1','小型水库','后寨水库','blank_3260.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','1','小型水库','后坝水库','blank_3261.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','1','小型水库','萝卜冲水库','blank_3262.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','1','小型水库','红旗水库','blank_3263.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','1','小型水库','千斤水库','blank_3264.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','1','小型水库','烂坝水库','blank_3265.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','1','小型水库','蓑衣塘水库','blank_3266.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','1','小型水库','杠坝水库','blank_3267.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','1','小型水库','杉树寨水库','blank_3268.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','1','小型水库','群丰水库','blank_3269.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','1','小型水库','白泥塘水电站','blank_3270.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','1','小型水库','险峰水库','blank_3271.html');
INSERT INTO TB_GCLJ VALUES('5','织金县','4','灰渣坝(尾矿坝)','织金县灰渣坝','blank_3272.html');
INSERT INTO TB_GCLJ VALUES('6','纳雍县','1','小型水库','红旗水库','blank_3273.html');
INSERT INTO TB_GCLJ VALUES('6','纳雍县','1','小型水库','鞍山水库','blank_3274.html');
INSERT INTO TB_GCLJ VALUES('6','纳雍县','1','小型水库','吊水岩水库','blank_3275.html');
INSERT INTO TB_GCLJ VALUES('6','纳雍县','1','小型水库','过狮河水库','blank_3276.html');
INSERT INTO TB_GCLJ VALUES('6','纳雍县','1','小型水库','小坝水库','blank_3277.html');
INSERT INTO TB_GCLJ VALUES('6','纳雍县','1','小型水库','大海坝水库','blank_3278.html');
INSERT INTO TB_GCLJ VALUES('6','纳雍县','1','小型水库','小湖坝水库','blank_3279.html');
INSERT INTO TB_GCLJ VALUES('6','纳雍县','4','灰渣坝(尾矿坝)','纳雍县灰渣坝','blank_3280.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','2','中型水库','杨湾桥水库','blank_3281.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','长海水库','blank_3282.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','邓家营水库','blank_3283.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','响水水库','blank_3284.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','冒水水库','blank_3285.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','雪山水库','blank_3286.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','李子沟水库','blank_3287.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','新华水库','blank_3288.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','尖山水库','blank_3289.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','赖毛冲水库','blank_3290.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','工农水库','blank_3291.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','冲子河水库','blank_3292.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','新田水库','blank_3293.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','大山水库','blank_3294.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','发路海水库','blank_3295.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','范家田水库','blank_3296.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','新丰水库','blank_3297.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','乐溪水库','blank_3298.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','结里水库','blank_3299.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','云雾山水库','blank_3300.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','林场水库','blank_3301.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','新村水库','blank_3302.html');
INSERT INTO TB_GCLJ VALUES('7','威宁县','1','小型水库','金叶水库','blank_3303.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','2','中型水库','板桥水库','blank_3304.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','红岩水库','blank_3305.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','公鸡寨水库','blank_3306.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','深沟水库','blank_3307.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','扇子田水库','blank_3308.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','杨七沟水库','blank_3309.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','白草坝水库','blank_3310.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','庙沟水库','blank_3311.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','坝研水库','blank_3312.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','双岔沟水库','blank_3313.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','滑石板水库','blank_3314.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','马槽沟水库','blank_3315.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','大沟水库','blank_3316.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','下海子水库','blank_3317.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','石门坎水库','blank_3318.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','石笋沟水库','blank_3319.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','香椿树水库','blank_3320.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','申家沟水库','blank_3321.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','中坝水库','blank_3322.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','袁家滩电站一级水库','blank_3323.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','袁家滩电站二级水库','blank_3324.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','1','小型水库','龙场坝水库','blank_3325.html');
INSERT INTO TB_GCLJ VALUES('8','赫章县','4','灰渣坝(尾矿坝)','赫章县灰渣坝','blank_3326.html');
