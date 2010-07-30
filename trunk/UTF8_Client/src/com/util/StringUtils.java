package com.util;

import java.io.FileInputStream;
import java.util.Properties;

public class StringUtils {
	/**
	   * 从配置文件中取得属性值
	   * @param path
	   * @param name
	   * @return
	   * @throws Exception
	   */
	  public static String getProperty(String path, String name) throws Exception {
	    if (path == null || path.equals("") || name == null || name.equals("")) {
	      return null;
	    }
	    String rs = null;
	    Properties prop = new Properties();
	    try {
	      FileInputStream fis = new FileInputStream(path);
	      prop.load(fis);

	      rs = prop.getProperty(name);
	    }catch (Exception e) {
	    }

	    return rs;
	  }	  	    
}
