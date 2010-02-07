package com.basesoft.server;


/**
 * Title:        实时工情信系统WEB查询
 * Description:  该包是实现WEB查询需要使用的类库，为第一个版本，并没有实现缓冲池技术，包括了web界面的参数设置default.properties,数据库连接信息存入db.properties
 * 具体包括：
 *   DbQuery.java : 实现查询的类，实现了bean接口
 *   DefaultSetting.java 从default.properties中取得各种参数设置
 *   DuoMeiTiChanSheng.java 产生多媒体文件并且缓存在硬盘上，有微弱管理能力
 *   select_hs_dmt,select_hs:实现会商记录选择的插入功能
 *   hs_manager: 会商管理快的后台处理，进行增删该
 * Copyright:    Copyright (c) 2000
 * Company:      北京人大金仓信息有限公司
 * @author 周昭涛，张新宇
 * @version 1.0
 */

 /*
 * DefaultSetting.java
 *本程序用于获取本系统中的各种默认参数设置
 *在本程序的所有程序中   需要默认参数时都由本程序确定
 * 进行平台移植和安装时只需要修改本程序使用的两个资源文件
   db.properties和default.properties
 */

import java.io.InputStream;
import java.util.Properties;

public class DefaultSetting {

  private static  boolean isInit=false; //是否进行系统默认参数初始化的标识

  public static String DuoMeiTiPathDf=
   System.getProperties().getProperty("java.io.tmpdir");     //多媒体资料的默认路径

  public static long DuoMeiTiMaxSpaceDf=300000000;//默认缓存空间的最大值为300 M
  
  public static String CharsetFromDataBase="ISO8859-1";  //表示从数据库的字符集设置,默认ISO8859-1
  public static String CharsetFromWebServer="ISO8859-1";  //表示从WebServer的字符集设置，默认ISO8859-1
  public static String CharsetView="GB2312";  //表示显示使用的字符集，应该是GB2312
  

  /*@@@  实时库连接的参数设置  @@@*/
  public static String FxServerNameDf="";  //默认的http假名
  public static String driverName="";
  public static String url="";
  public static String userName="";
  public static String password="";

   /*@@@  历史库连接的参数设置  @@@*/
  public static String driverNameH="";
  public static String urlH="";
  public static String userNameH="";
  public static String passwordH="";
  //服务端口所用
  public static String port="";
public DefaultSetting() {
     super();
}

/*@@@  初始化读取各种参数     @@@*/
 private   synchronized void init() {

// 打开流
  InputStream is = getClass().getResourceAsStream("/default.properties");
  Properties dbProps = new Properties();
  System.out.println("正在读取配置参数。。。");
  try {
    dbProps.load(is);
   }
  catch (Exception e) {
   System.err.println("不能读取属性文件. "
      + "请确保default.properties在CLASSPATH指定的路径中");
    return;
   }
 //填值
 try{
 
 if(dbProps.getProperty("CharsetFromDataBase")!=null)
       {CharsetFromDataBase=dbProps.getProperty("CharsetFromDataBase"); 
       //System.println("CharsetFromDataBase="+CharsetFromDataBase); 
       }
       
       
 if(dbProps.getProperty("CharsetFromWebServer")!=null)
       CharsetFromWebServer=dbProps.getProperty("CharsetFromWebServer"); 
       
 if(dbProps.getProperty("CharsetView")!=null)
       CharsetView=dbProps.getProperty("CharsetView");

 if(dbProps.getProperty("DuoMeiTiPath")!=null)
       DuoMeiTiPathDf=dbProps.getProperty("DuoMeiTiPath");

 if(dbProps.getProperty("MaxSpace")!=null)
    DuoMeiTiMaxSpaceDf=Long.parseLong(dbProps.getProperty("MaxSpace"));

 if(dbProps.getProperty("LocalPath")!=null)
    FxServerNameDf=dbProps.getProperty("LocalPath");

    driverName=dbProps.getProperty("driverName");
    url=dbProps.getProperty("url");
    userName=dbProps.getProperty("userName");
    password=dbProps.getProperty("password");

    driverNameH=dbProps.getProperty("driverNameH");
    urlH=dbProps.getProperty("urlH");
    userNameH=dbProps.getProperty("userNameH");
    passwordH=dbProps.getProperty("passwordH");

    port=dbProps.getProperty("default_port");
   is.close();
  }
  catch(Exception e){
   System.err.println("无法获得需要的参数 "
   + "请在default.properties中填入\nDuoMeiTiPath= \n"
   +"LocalPath=\n"
   +"MaxSpace=\n "
   +"而且等号后边不能为空值");
 try{ is.close();} catch(Exception e1){}
   return ;
  }
 isInit=true;
 }

/*  @@  字符集设置信息的获取  @@*/
public synchronized  static String getCharsetFromDataBase(){
 if(!isInit) {
     DefaultSetting initDefault=new DefaultSetting();
     initDefault.init();
     }
  return(DefaultSetting.CharsetFromDataBase);
}


public synchronized  static String getCharsetFromWebServer(){
 if(!isInit) {
     DefaultSetting initDefault=new DefaultSetting();
     initDefault.init();
     }
  return(DefaultSetting.CharsetFromWebServer);
}


public synchronized  static String getCharsetView(){
 if(!isInit) {
     DefaultSetting initDefault=new DefaultSetting();
     initDefault.init();
     }
  return(DefaultSetting.CharsetView);
}

 /*@@@  缓存多媒体文件的磁盘绝对路径，必须为  /主页所在目录的\\image\\temp\\  @@@*/
public synchronized  static String getDuoMeiTiPathDf(){
 if(!isInit) {
     DefaultSetting initDefault=new DefaultSetting();
     initDefault.init();
     }
  return(DefaultSetting.DuoMeiTiPathDf);
}


/*@@@   获取用于缓存多媒体文件的磁盘空间的上限      @@@*/
public synchronized static long getDuoMeiTiMaxSpaceDf(){
 if(!isInit) {
     DefaultSetting initDefault=new DefaultSetting();
     initDefault.init();
      }
   return(DefaultSetting.DuoMeiTiMaxSpaceDf);
 }

 /*@@@   获取防汛web查询的url     @@@*/
 public synchronized static String  getFxServerNameDf(){
 if(!isInit) {
     DefaultSetting initDefault=new DefaultSetting();
     initDefault.init();
     }
  return(DefaultSetting.FxServerNameDf);
 }

/*@@@   历史库查询的各种参数设置   @@@*/
 public synchronized static String  getDriverName(){
 if(!isInit) {
     DefaultSetting initDefault=new DefaultSetting();
     initDefault.init();
     }
  return(DefaultSetting.driverName);
 }


  public synchronized static String  getUrl(){
 if(!isInit) {
     DefaultSetting initDefault=new DefaultSetting();
     initDefault.init();
     }
  return(DefaultSetting.url);
 }


 public synchronized static String  getUserName(){
 if(!isInit) {
     DefaultSetting initDefault=new DefaultSetting();
     initDefault.init();
     }
  return(DefaultSetting.userName);
 }

 public synchronized static String  getPassword(){
 if(!isInit) {
     DefaultSetting initDefault=new DefaultSetting();
     initDefault.init();
     }
  return(DefaultSetting.password);
 }


/*@@@   历史库查询的各种参数设置   @@@*/
 public synchronized static String  getDriverNameH(){
 if(!isInit) {
     DefaultSetting initDefault=new DefaultSetting();
     initDefault.init();
     }
  return(DefaultSetting.driverNameH);
 }


  public synchronized static String  getUrlH(){
 if(!isInit) {
     DefaultSetting initDefault=new DefaultSetting();
     initDefault.init();
     }
  return(DefaultSetting.urlH);
 }


 public synchronized static String  getUserNameH(){
 if(!isInit) {
     DefaultSetting initDefault=new DefaultSetting();
     initDefault.init();
     }
  return(DefaultSetting.userNameH);
 }

 public synchronized static String  getPasswordH(){
 if(!isInit) {
     DefaultSetting initDefault=new DefaultSetting();
     initDefault.init();
     }
  return(DefaultSetting.passwordH);
 }
 
 public synchronized static String  getPort(){
 if(!isInit) {
     DefaultSetting initDefault=new DefaultSetting();
     initDefault.init();
     }
  return(DefaultSetting.port);
 }

/*@@@    测试是否正确取得各种参数     @@@*/
  public static  void main(String[] args){
    System.out.println("Path="+DefaultSetting.getDuoMeiTiPathDf());
    System.out.println("FxServerName="+DefaultSetting.getFxServerNameDf());
    System.out.println("Space="+DefaultSetting.getDuoMeiTiMaxSpaceDf());

    System.out.println("◎◎  实时库数据库连接参数  ◎◎");
    System.out.println("DriverName="+DefaultSetting.getDriverName());
    System.out.println("Url="+DefaultSetting.getUrl());
    System.out.println("UserName="+DefaultSetting.getUserName());
    System.out.println("Password="+DefaultSetting.getPassword());

    System.out.println("◎◎ 历史库数据库连接参数  ◎◎");
    System.out.println("DriverName="+DefaultSetting.getDriverNameH());
    System.out.println("Url="+DefaultSetting.getUrlH());
    System.out.println("UserName="+DefaultSetting.getUserNameH());
    System.out.println("Password="+DefaultSetting.getPasswordH());

    System.out.println("◎◎ 字符集设置 ◎◎");
    System.out.println("CharsetFromDataBase="+DefaultSetting.getCharsetFromDataBase());
    System.out.println("CharsetFromWebServer="+DefaultSetting.getCharsetFromWebServer());
    System.out.println("CharsetView="+DefaultSetting.getCharsetView());   

  }



}