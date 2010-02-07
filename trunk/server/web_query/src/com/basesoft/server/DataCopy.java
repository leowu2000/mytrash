package com.basesoft.server;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

public class DataCopy
{
  public DataCopy() 
  {}
  
  //本函数返回指定编码对应的工情详情名称表： 大写字符串
//没有匹配的内容则返回空字符串
private String getRunDetailTable(String flbm)
{
   //*工程分类代码到具体表名的函数    
   int i=0;
   String  str1=new String(flbm);
   String[][] tableNameArray={{"B","TB_RSR"},{"D","TB_DKR"},{"E","TB_DKR"},
       {"F","TB_STOFLER"},{"H","TB_DKR"},{"K","TB_WLR"},{"N","TB_COWAPJ"},
       {"P","TB_DKR"}};
   
   for (i=0;i<tableNameArray.length;i++)
       if ((str1.toUpperCase()).equals(tableNameArray[i][0]))
	  	return((tableNameArray[i][1]).toUpperCase());
   return "";
}

//本函数返回指定编码对应的险情详情名称表：大写字符串
//没有匹配的内容则返回空字符串
private String getDangerDetailTable(String flbm)  
{
   /*险情分类代码转换到具体表名的函数*/
   int i=0;
   String  str1=new String(flbm);
   String[][] tableNameArray={{"D001","TB_BURDSC"},{"D002","TB_OVFLDSC"},
        {"D003","TB_LKDSC"},{"D004","TB_PPDSC"},{"D005","TB_PITDSC"},
        {"D006","TB_SLDSC"},{"D007","TB_UNDSC"},{"D008","TB_CRDSC"},
        {"D009","TB_CVDSC"},{"D010","TB_SPDSC"},{"D011","TB_BLBADSC"},
        {"D012","TB_SLUDSC"},{"D013","TB_HOMLFDSC"},{"D014","TB_GTWRDSC"},
        {"D015","TB_BRDMDSC"},{"D016","TB_OVTUDSC"},{"D017","TB_STREXDSC"},
        {"D018","TB_SLIDSC"},{"D019","TB_PLUDSC"},{"D020","TB_BSWRDSC"},
        {"D021","TB_EDDWRDSC"},{"D022","TB_BSWPLPDS"},{"D023","TB_HBWRDSC"},
        {"D024","TB_CLPJPRWR"},{"D025","TB_CLPJSCDN"}};
   
   for (i=0;i<tableNameArray.length;i++)
      if ((str1.toUpperCase()).equals(tableNameArray[i][0]))
         return((tableNameArray[i][1]).toUpperCase());

   return("");
}

//返回指定元集合的字段列表
private String getAllFieldList(ResultSetMetaData oResultSetmetaData)
{
   String sFieldList = "";
   try
      {  
      //获取字段个数：
      int numOfCols = oResultSetmetaData.getColumnCount();
      int i;
   
      //将字段名称连接起来，以，分隔
      for(i=1; i<=numOfCols; i++)
         {
	 sFieldList = sFieldList + oResultSetmetaData.getColumnName(i);
         if (i < numOfCols) sFieldList = sFieldList + ",";
         };
      }
   catch(SQLException e)
	{
	System.out.println("getAllFieldList():错误描述："+e.getMessage());
	return "";
	}
   return sFieldList;
}

//返回要插入值的参数串；输入参数是字段的个数
private String getAllValueParaList(ResultSetMetaData oResultSetmetaData)
{

String sValueParaList = "";
//将字段名称连接起来，以，分隔
try
   {  
   int numOfCols = oResultSetmetaData.getColumnCount();
   int i;   
   for(i=1; i<=numOfCols; i++)
      {
      sValueParaList = sValueParaList + "?";
      if (i<numOfCols) sValueParaList = sValueParaList + ",";
      };
   }
catch(SQLException e)
   {
	System.out.println("getAllValueParaList():错误描述："+e.getMessage());
	return "";
   }

return sValueParaList ;
}


// 检查当前后台表中有没有lxzp字段
boolean existLxzpField(ResultSetMetaData oResultSetmetaData)
{
   boolean hasLxzp = false;
   try
      {  
      //获取字段个数：
      int numOfCols = oResultSetmetaData.getColumnCount();
      int i;
   
      for(i=1; i<=numOfCols; i++)
         {
		 if (oResultSetmetaData.getColumnName(i).equalsIgnoreCase("lxzp")) 
			 {
			 hasLxzp = true;
			 break;
			 }
         };
      }
   catch(SQLException e)
	{
	System.out.println("getNonLobFieldList():错误描述："+e.getMessage());
	return false;
	}

   return hasLxzp ;
}

// 从工情数据库中获取指定序列名的未曾使用的序列值
private synchronized  int getNextSequence(Connection cnTarget, String tableName)
{
int nSequence;
String strDatabaseProductName="";
try
   {
   DatabaseMetaData myDBMetaData = cnTarget.getMetaData();
   strDatabaseProductName = myDBMetaData.getDatabaseProductName();	  
   strDatabaseProductName = strDatabaseProductName.toUpperCase();
   }
catch(SQLException e)
   {
	e.printStackTrace();
   return -1;
   }

   try
      {
      String strSql="select nextValue from tb_sequence where TableName = '"+tableName+"'".toUpperCase() ;
      PreparedStatement myStmt = cnTarget.prepareStatement( strSql.toUpperCase() );
      ResultSet rsCursor = myStmt.executeQuery();

       //若结果为空则在序号表中增加该序号名和序号值：初始化 1
      if ( !rsCursor.next() )
	     {
		  strSql = "insert into tb_sequence (tableName,NextValue) values('"+tableName.toUpperCase()+"',"+10000+")";
          myStmt.close();        
          myStmt = cnTarget.prepareStatement( strSql.toUpperCase() ) ;
	      myStmt.executeUpdate() ;
          myStmt.close();
          return 10001;
          }
       else
          {
	      nSequence = rsCursor.getInt("NEXTVALUE");
          rsCursor.close();
		  myStmt.close();
	       strSql =  "update tb_sequence set NextValue=NextValue+1 where TableName = '"+tableName.toUpperCase()+"'".toUpperCase() ;
	       myStmt = cnTarget.prepareStatement( strSql );
	       myStmt.executeUpdate() ;
	       myStmt.close(); 
	       return nSequence + 1;
          }
      }
   catch(SQLException e)
      {
	   e.printStackTrace();
      return -1;
      }
}

//清空参数数组
private void resetParameters(String[] strUpdateFieldName, Object[] iNewValue,  String[] strSequenceName)
{
		for (int i = 0; i < strSequenceName.length; i++) {
			strUpdateFieldName[i] = "";
			iNewValue[i] = 0;
			strSequenceName[i] = "";
		}
}

// 预先检查需要赋值的字段和参数数组，如果是需要对应的流水号的则先获取其流水号并写入到
// 对应位置；
/*private void prepareParameters(Connection cnTarget, 
	String[] strUpdateFieldName, 
	int[] iNewValue,  
	String[] strSequenceName)
{
int i;
for (i=0; i<strSequenceName.length; i++)
   {
    // 先判断当前的flag是否是指示需要获取新流水号？
    if (strSequenceName[i].substring(strSequenceName[i].length() - 7).equalsIgnoreCase("nextval"))
       {
       // 将获取的流水号写入同下标的整数参数数组中
       iNewValue[i] = getNextSequence( cnTarget, strSequenceName[i].toUpperCase() );
       // 并且把自己清空；
       //strFlag[i] = "";
       }
   }
}
// 预先检查参数数组的函数 prepareParameters 结束
*/

/* 从一个变长的char类型字段中获取二进制形式的数据，返回一个字节数组 */
// 专门对付text、clob类型的字段 呜呜呜呜 写了一天呀 活着还有什么意思。。。
public byte[] getClobFieldBytes(ResultSet sourceResultSet, String fieldName) 
{
byte[] wbytes = null;
InputStream wbin = null;

try 
   {
   ByteArrayOutputStream wbout = new ByteArrayOutputStream();
   // wbin = sourceResultSet.getBinaryStream(fieldName);
   wbin = sourceResultSet.getAsciiStream(fieldName);
   int wbyte;
   while ((wbyte = wbin.read()) != -1) 
      {
      wbout.write(wbyte);
      }
   wbytes =  wbout.toByteArray();
   }
catch(SQLException e)
   {
   String info = "getClobFieldBytes发生错误\n错误信息：" + 
   	e.getMessage()+";错误代码"+ e.getErrorCode();
   System.out.println( info );
   return null;
   }

catch(IOException e)
   {
   String info = "getClobFieldBytes发生错误\n错误信息：" + e.getMessage();
   System.out.println( info );
   return null;
   }
finally 
   {
   if (wbin != null) 
      {
      try 
         {
         wbin.close();
         }
      catch (IOException e) 
         {
         e.printStackTrace();
         return null;
        }
      }
    }
    //System.out.println("getBytes " + fieldName + " - " + new String(wbytes));

    return wbytes;
    // 返回一个字节数组
} // 从 text字段读取内容返回字节数组的 getClobFieldBytes 函数结束

/* 从一个变长二进制字段中获取二进制形式的数据，返回一个字节数组 */
// 专门对付image、blob类型的字段 
public byte[] getBlobFieldBytes(ResultSet sourceResultSet, String fieldName) 
{
byte[] wbytes = null;

//byte[] wbytes = "0x".getBytes();  //sql server 6.5要求二进制流前先有 0x 
InputStream wbin = null;

try 
   {
   	System.out.println(" enter getBlobFieldBytes\n");
   ByteArrayOutputStream wbout = new ByteArrayOutputStream();
   // wbin = sourceResultSet.getBinaryStream(fieldName);
   wbin = sourceResultSet.getBinaryStream(fieldName);
   int wbyte;
   
   //wbout.write(48); // 写入0x字符串的值
   //wbout.write(120); // 
   while ((wbyte = wbin.read()) != -1) 
      {
      wbout.write(wbyte);
      }
   wbytes =  wbout.toByteArray();
   }
catch(SQLException e)
   {
   String info = "getBlobFieldBytes发生错误\n错误信息：" + 
   	e.getMessage()+";错误代码"+ e.getErrorCode();
   System.out.println( info );
   return null;
   }

catch(IOException e)
   {
   String info = "getBlobFieldBytes发生错误\n错误信息：" + e.getMessage();
   System.out.println( info );
   return null;
   }
finally 
   {
   if (wbin != null) 
      {
      try 
         {
         wbin.close();
         }
      catch (IOException e) 
         {
         e.printStackTrace();
         return null;
        }
      }
    }
    //System.out.println("getBytes " + fieldName + " - " + new String(wbytes));

    return wbytes;
    // 返回一个字节数组
} // 从 一个变长二进制字段读取内容返回字节数组的 getBlobFieldBytes 函数结束


// 本函数用于预编译SQL语句需要
// 对非lob类型的字段进行绑定参数
private boolean bindInsertValues(Connection cnTarget,PreparedStatement pStmt, 
	String strParaTableName, ResultSet sourceRS,	ResultSetMetaData targetMetaData, ResultSetMetaData sourceMetaData, 
   	String[] strUpdateFieldName, Object[] iNewValue, String[] strSequenceName,	
	String strKeyFieldName, int iKeyFieldValue )	
{
try
   {
   int numOfCols = targetMetaData.getColumnCount();
  	System.out.println("共有"+numOfCols+"个字段");
  
   String targetFieldName;
   String targetColTypeName;
   String sourceFieldName;
   String sourceColTypeName;
   
   for(int i=1; i<=numOfCols; i++){
	   Object objAcceptData = null;
      targetFieldName = targetMetaData.getColumnName(i).toUpperCase();
      targetColTypeName = targetMetaData.getColumnTypeName(i).toUpperCase();
      System.out.println("来自Kingbase：第 " + i + " 个字段" + targetFieldName + "类型是 " + targetColTypeName);
      sourceFieldName = sourceMetaData.getColumnName(i).toUpperCase();
      sourceColTypeName = sourceMetaData.getColumnTypeName(i).toUpperCase();
	  System.out.println("来自ACCESS：第 " + i + " 个字段" + sourceFieldName + "类型是 " + sourceColTypeName);

       // 设置是否是需要单独绑定为整数(或者是字符串)的字段标志变量？
      boolean isUpdateFieldName = false;
      try  
         {
         for (int k = 0; k < strUpdateFieldName.length; k++)
            {
            if ( strUpdateFieldName[k].equalsIgnoreCase( targetFieldName ) ) {
               if (strSequenceName[k].equalsIgnoreCase(""))
                   pStmt.setObject( i , iNewValue[k]);
               else {
					     iNewValue[k] = getNextSequence( cnTarget, strSequenceName[k].toUpperCase() );
                         pStmt.setObject(i, iNewValue[k] ) ;
						 iKeyFieldValue = (Integer)iNewValue[k];   
               }
               System.out.println(targetFieldName+"绑定了"+iNewValue[k]);
               // 执行完特殊字段处理后置位处理标志
               isUpdateFieldName = true;
               } 
            }   
         }
      catch(SQLException e)
         {
    	  e.printStackTrace();
         return false;
         }

      // 执行完特殊字段检查和处理后检查处理标志：
      // 如果当前字段已经被处理则直接继续下一个字段的参数绑定工作
      if (isUpdateFieldName) continue;

//      if ( (targetColTypeName.equalsIgnoreCase("BLOB")) || ( targetColTypeName.equalsIgnoreCase("TEXT") ) )    
//      {
//      	System.out.println("当前字段类型：" + targetColTypeName + "\n");
//      	try{      		
// 		  	if ( rdbmsIsKingbase(cnTarget) )
// 		  	{
// 		 	  if ( targetColTypeName.equalsIgnoreCase("TEXT") )
// 		  		{ 
//		             try{
// 		                byte[] bigText = getClobFieldBytes( sourceCursor, targetMetaData.getColumnName(i) );
//			 	        ByteArrayInputStream zzz = new ByteArrayInputStream(bigText);
//		                System.out.println("Len="+ bigText.length);	
//		                pStmt.setBinaryStream( intParaindex++, zzz, bigText.length );
//		             }
//            		 catch(SQLException e){
//            		    System.out.println("绑定字段：" + targetMetaData.getColumnName(i)+"出错啦。。。");
//            		    System.out.println("bind:Clob错误："+e.getMessage() );
//               		 }
//          		}
// 		  		else
// 		  		{
// 		  			//if(mystrColTypeName.equalsIgnoreCase("LONGBINARY") )
// 		  			
//	                System.out.println(" 准备处理KINGBASE blob字段1\n");
// 		  			if(targetColTypeName.equalsIgnoreCase("BLOB") )
// 		  			{
//	                System.out.println(" 准备处理KINGBASE blob字段2\n");
//	                
//	                System.out.println(" enter the branch:source is image/video,target is long\n");
//	               	System.out.println(" null \n");
//	               	byte[] bigText = null;
//		        	ByteArrayInputStream zzz =null;
// 			        try{
// 			            System.out.println("have entered try\n");
// 			  	        bigText = getBlobFieldBytes( sourceCursor, targetMetaData.getColumnName(i) );
//			            System.out.println("bigText 's length is "+bigText.length+"\n");
//			            zzz = new ByteArrayInputStream( bigText );
//			            System.out.println("zzz has got value\n");
//	                    pStmt.setBinaryStream( intParaindex++, zzz, bigText.length );
//                    }
//            		catch(SQLException e){
//            		    System.out.println("绑定字段：" + targetMetaData.getColumnName(i)+"出错啦。。。");
//            		    System.out.println("bind:Blob错误："+e.getMessage() );
//               		}  
//                System.out.println("处理Kingbase 的大对象类型完毕\n");	
//			        }	      	
//     			}
//    		}
//  		}
//      	catch(SQLException e)
//      	{
//      		System.out.println("绑定字段：" + targetMetaData.getColumnName(i)+"出错啦。。。");
//            System.out.println("bind:LONG错误："+e.getMessage() );
//        }      
//      	continue; //处理完LONG型数据马上转入下?            
//	}	 
	 
      //必须先将数据读取出来存放到对象里面：
      //对同一个字段不能两次getObject读否则将扔出异常
			objAcceptData = sourceRS.getObject(i );
			if(objAcceptData==null)
				pStmt.setNull(i, java.sql.Types.LONGVARCHAR);
			else
				pStmt.setObject( i, objAcceptData);
            System.out.println(targetFieldName+"绑定了"+objAcceptData);
      } 
      
    System.out.println("going to execute……");
	pStmt.execute();
   }
catch(SQLException e)
   {
	e.printStackTrace();
    return false;
   };
   return true;
}

// 从cnSource源中将指定表中所有符合条件的记录复制到cnTarget连接的工情数据库中
   // *** 本函数针对只需要对一个字段用固定序号替换的情形
   // 
   // cnSource：源连接，cnTarget：目的连接
   // strTableName：要复制的表名称； strFilter：过滤条件表达式
   // strUpdateFieldName：需要单独赋值的字段名称, iNewValue：对应的值整型,
   // strSequenceName: 获取新序列号的序列字段名或者是用于绑定对应字段的字符串型内容
   // 执行成功返回真，否则返回假
private boolean copyAllRecord(Connection cnSource, Connection cnTarget, 
   	String strTableName, String strFilter, 
   	String[] strUpdateFieldName, Object[] iNewValue, String[] strSequenceName,
	String strParaKeyFieldName, int iParaKeyFieldValue )
   {
	try
	  { 
	  //获取源连接中指定表中的指定数据
	  System.out.println("进入copyAllRecord!参数如下：tablename="+strTableName+"，Filter="+strFilter+"#");
	  //获取Access原数据库中指定表的结构字段名和字段类型。
	  String mystrSql = "select * from "+ strTableName + " where 1>2";
	  Statement myAccessFieldTypeStmt = cnSource.createStatement();
	  ResultSet myAccessCursor = myAccessFieldTypeStmt.executeQuery( mystrSql.toUpperCase() );
	  
	  ResultSetMetaData myAccessMetaData = myAccessCursor.getMetaData();
	  // 先获取ACCESS端对应表的字段类型元
	  
	  String strSql = "select * from "+strTableName+" where " + strFilter;
	  Statement sourceStmt = cnSource.createStatement();
	  ResultSet sourceCursor = sourceStmt.executeQuery( strSql.toUpperCase() );
	  //获取后台服务器中指定表的空记录结果集合
	  strSql = "select * from "+ strTableName + " where 1>2";
	  Statement serverFieldTypeStmt = cnTarget.createStatement();
	  ResultSet targetCursor = serverFieldTypeStmt.executeQuery( strSql.toUpperCase() );
	  ResultSetMetaData targetMetaData = targetCursor.getMetaData();
	  // 先获取服务器端对应表的字段类型元

	  //存放需要插入内容的字段列表
	  String sFieldList = "";
	  //存放和字段列表个数对应的参数串
	  String sValueParaList = "";
	  // 获取字段列表和参数值列表;
//	  if ( rdbmsIsORACLE(cnTarget) )
//	     {
//	     sFieldList = getNonLobFieldList( targetMetaData );
//	     sValueParaList = getNonLobValueParaList( targetMetaData );
//         }
//      else
	     {
	     sFieldList = getAllFieldList( targetMetaData );
	     sValueParaList = getAllValueParaList( targetMetaData );
         }

	  //定义向后台数据库插入数据的预编译SQL对象，将字段和数据内容形式安排好
	  PreparedStatement serverPreStmt;

	  strSql = "insert into "+ strTableName + "("+ sFieldList + ")" +
	  		" values(" + sValueParaList + ")";
  	  serverPreStmt = cnTarget.prepareStatement( strSql.toUpperCase() );
	
	  int iTmp = 0;
	  while ( sourceCursor.next())
	     {
		 ++iTmp ;
         //绑定参数
         if ( !bindInsertValues( cnTarget, serverPreStmt, strTableName, 
				sourceCursor, targetMetaData, myAccessMetaData,
   				strUpdateFieldName, iNewValue, strSequenceName, 
				strParaKeyFieldName, iParaKeyFieldValue ) )
		{
			System.out.println("Out the copyAllRecord() with error!\n"); 
   		    return false;
		}
	     //实际执行插入数据命令！
	     System.out.println("已经向" + strTableName+ "插入第" + ( iTmp ) + "条数据.....*_* ");
	     }
	  sourceCursor.close();
	  targetCursor.close();
	  myAccessCursor.close();
	  //释放sql句柄
	  myAccessFieldTypeStmt.close();
	  sourceStmt.close();
	  serverFieldTypeStmt.close();
	  serverPreStmt.close();
	  return true;
	  }
	catch(SQLException e)
	  {e.printStackTrace();
	   return false;
	  }
   }


   // 本函数仅将指定的游标的当前记录复制到后台数据库的对应表中
   // 这是只有一个字段作特殊处理的版本
   // cnSource：源连接，cnTarget：目的连接
   // strTableName：将送入数据的表名称； 
   // strUpdateFieldName：需要单独赋值的字段名称, iNewValue：对应的值整型,
   // strSequenceName: 获取新序列号的序列字段名或者是用于绑定对应字段的字符串型内容
   // 执行成功返回真，否则返回假
   private boolean copyCurrentRecord(ResultSet sourceRS,Connection cnSource, Connection cnTarget, 
   	String tableName, String[] strUpdateFieldName, 
   	Object[] iNewValue, String[] strSequenceName,
	String strParaKeyFieldName, int iParaKeyFieldValue )
   {
	try
	  { 
	  System.out.println("复制记录，参数如下：="+tableName+"#");
	  String sql = "select * from "+ tableName + " where 1>2";
	  Statement sourceStmt = cnSource.createStatement();
	  ResultSet myAccessCursor = sourceStmt.executeQuery( sql.toUpperCase() );
	  ResultSetMetaData sourceMetaData = myAccessCursor.getMetaData();
	  // 获取后台服务器中指定表的空记录结果集?  ?
	  String strSql = "select * from "+ tableName + " where 1>2";
	  Statement targetStmt = cnTarget.createStatement();
	  ResultSet targetCursor = targetStmt.executeQuery( strSql.toUpperCase() );
	  ResultSetMetaData targetMetaData = targetCursor.getMetaData();

	  String fieldList = "";
	  String paramList = "";
      fieldList = getAllFieldList( targetMetaData );
      paramList = getAllValueParaList( targetMetaData );
	  
	  //定义向后台数据库插入数据的预编译SQL对象，将字段和数据内容形式安排好
      strSql = "insert into "+ tableName + " ("+ fieldList + ")" +
	  			" values (" + paramList + ")";
      PreparedStatement pStmt = cnTarget.prepareStatement( strSql.toUpperCase() );

	  // 先清除参数	
      if ( !bindInsertValues( cnTarget, pStmt, tableName, 
					sourceRS, targetMetaData, sourceMetaData,
          	        strUpdateFieldName, iNewValue, strSequenceName,
					strParaKeyFieldName, iParaKeyFieldValue ) ) 
   	   	 return false;

      System.out.println("已经向 " + tableName+ " 正确插入数据.....*_*" );
	     
	  myAccessCursor.close();
	  targetCursor.close();
	  sourceStmt.close();
      targetStmt.close();
	  pStmt.close();
	  return true;
	  }
	catch(SQLException e)
	  {
		e.printStackTrace();
	   return false;
	  }
   }


//从 cnSource 连接中复制和工程有关的信息的 cnTarget 连接中
public boolean copyPJ(Connection cnSource, Connection cnTarget)
{
String[] strUpdateFieldName = {"","","",""};
Object[] iNewValue = {-1, -1, -1, -1};
String[] strSequenceName = {"","","",""};

   try
      {   
      int sourcePJNO;	//存放当前记录中的PJNO字段值
      int targetPJNO;	//存放从服务器新获取的PJNO值
      Statement sourceStmt = cnSource.createStatement();
      ResultSet sourceRS = sourceStmt.executeQuery("select * from tb_pj");
      
	  int current = 0;
      while (sourceRS.next())
         {
         sourcePJNO = sourceRS.getInt("PJNO");
         System.out.println("the No "+current+1+" record in table TB_PJ from access;PJNO="+sourcePJNO+".");
         targetPJNO = getNextSequence(cnTarget, "TB_PJ");
         //先清空参数数组
         resetParameters( strUpdateFieldName, iNewValue, strSequenceName );
         strUpdateFieldName[0]="PJNO"; iNewValue[0] = targetPJNO;//strSequenceName[0]="PJ.NEXTVAL";
		 ++current;
         
		 if (!copyCurrentRecord(sourceRS, cnSource,cnTarget, "TB_PJ", 
         	strUpdateFieldName, iNewValue, strSequenceName, "", -1 ))
            { 
			 System.out.println("发生了错误");
			 return false; 
			 }

		 System.out.println("已经复制了 tb_pj 表的第" + (current) + "记录...");
            
         //处理工情类信息：调用 copyRunStatus 复制工情运行的相关信息
	     if ( !copyRunStatus(cnSource, cnTarget, sourcePJNO, targetPJNO)) 
            { 
			 System.out.println("copyRunStatus发生了错误");
			 return false; 
			 }
         
         //处理险情类信息：调用copyDanger复制工情运行的相关信息
         // 应该同时为sttpcd字段申请序列号！！！
	     if ( !copyDanger(cnSource, cnTarget, sourcePJNO, targetPJNO) ) 
            {
			 System.out.println("copyDanger发生了错误");
			 return false; 
			 }
         } // end of while;

      sourceRS.close(); // 关闭游标
	  sourceStmt.close();
      return true;
      }
   catch(SQLException e)
      {
      String strErrorInfo = "错误::copyPJ::"+e.getMessage()+"\n错误代码:"+e.getErrorCode();
      System.out.println( strErrorInfo );
      return false;
      }
}

// 调用copyDanger复制险情的相关信息
// 处理和当前工程流水号相同的记录
private boolean copyDanger(Connection cnSource, Connection cnTarget, 
		int comparePjno, int newPjno)
{
String[] strUpdateFieldName={"","","",""};
Object[] iNewValue={-1, -1, -1, -1};
String[] strSequenceName={"", "","",""};
   // 筛选和指定流水号一致的险情记录
   try
      {
      // 先复制 ST 表
      String strSql = "select * from tb_st where pjno=" + comparePjno;
      Statement stStmt = cnSource.createStatement();
      ResultSet stCursor = stStmt.executeQuery( strSql.toUpperCase() );
         
      int oldStPjno;
      int oldStSttpcd;
      // 开始循环： while 1
      while (stCursor.next())
         {
         // 存放好st表当前记录的 pjno、sttpcd 值， tb_stdnc表和险情的详细表还要以此来筛选
         // 作为绑定参数函数调用时本记录的XQFLDM字段值进行替换
         oldStPjno = stCursor.getInt("PJNO");
	     oldStSttpcd = stCursor.getInt("STTPCD");
         
         //先清空参数数组
         resetParameters( strUpdateFieldName, iNewValue, strSequenceName );
         // st 表要更新的第一个字段是pjno用上级tb_pj表新获得的流水号替换
         strUpdateFieldName[0]="PJNO"; iNewValue[0] = newPjno;
         //strSequenceName[0]="";
         // st 表要更新的第二个字段是sttpcd，该值用 st.nextval 的新序号替换
         strUpdateFieldName[1]="STTPCD"; 
         iNewValue[1] = getNextSequence(cnTarget, "TB_ST");;
         //strSequenceName[1] = "st.nextval";
         
         // 先处理参数数组，形成字段名<=>参数值一一对应。
         //prepareParameters();
      	 
      	 // 复制st表当前记录
      	 if ( !copyCurrentRecord(stCursor, cnSource,cnTarget, "TB_ST", 
      	 	strUpdateFieldName, iNewValue, strSequenceName, "", -1) )
      	    {
			 System.out.println("复制TB_ST表时发生了错误");
			 return false;
			 }

         // 获取刚才新获取的的sttpcd序号!!!! 
		 // 一定要在resetParameters之前执行！！！
         Object newStSttpcd = iNewValue[1];
         
         int newDncno;    //存放 tb_stdnc 新获取的 dncno 值
         int oldDncno;	//存放本记录中的主键值，便于和多媒体表的dncno联系
      
         String strXQFLDM;   //存放险情信息表记录中对应的险情分类代码，便于查找对应的详情表名称
      
         //从cnSource的tb_stdnc表中筛选获得和tb_st当前记录中
         // 对应的工程码?pjno 、建筑物代码 sttpcd 相同的记录
         strSql = "select * from tb_stdnc where pjno=" + oldStPjno + 
      			" and sttpcd=" + oldStSttpcd;
         Statement sourceStmt = cnSource.createStatement();
         ResultSet sourceCursor = sourceStmt.executeQuery( strSql.toUpperCase() );
         
         // 开始循环：
         while (sourceCursor.next())
            {
            // 获取当前记录对应的详情表名称: getRunDetailTable()
            //存放好strXQFLDM值，作为绑定参数函数调用时本记录的XQFLDM字段值进行替换
            strXQFLDM = sourceCursor.getString("XQFLDM");
            oldDncno = sourceCursor.getInt("DNCNO");
            newDncno = getNextSequence(cnTarget, "TB_STDNC");

            //先清空参数数组
            resetParameters( strUpdateFieldName, iNewValue, strSequenceName );
            // stdnc 表要更新的第一个字段是pjno用上级tb_pj表新获得的流水号替换
            strUpdateFieldName[0]="PJNO"; iNewValue[0] = newPjno;
            // stdnc 表要更新的第二个字段是 dncno，该值用 stdnc.nextval 的新序号替换
            strUpdateFieldName[1]="DNCNO"; 
            iNewValue[1] = newDncno ;
            // stdnc 表要更新的第三个字段是 xqfldm 用刚才保存的 strXQFLDM 替换
            strUpdateFieldName[2]="XQFLDM"; iNewValue[2] = strXQFLDM;
            //strSequenceName[2]=strXQFLDM;
            // stdnc 表要更新的第四个字段是 sttpcd 用刚才获得的 newStSttpcd 替换
            strUpdateFieldName[3]="STTPCD"; iNewValue[3] = newStSttpcd;
            //strSequenceName[3]="";
            
            //复制当前记录到服务器中：注意！哪个字段被读取过就必须单独处理：
            // Dncno字段是用服务器端的值更新的，pjno是上级指定的(新的流水号)
            if (!copyCurrentRecord(sourceCursor, cnSource,cnTarget, "TB_STDNC", 
                          strUpdateFieldName, iNewValue, strSequenceName, "dncno", newDncno ))
               { 
			    System.out.println("复制 TB_STDNC 表时发生了错误");
				return false; 
				}
          
            // 根据险情表中的险情分类代码查找对应的详情表名称.
	        // 若找不到，则对详情表内容不予处理
	        String strDangerDetailTable = getDangerDetailTable( strXQFLDM );
            if (! strDangerDetailTable.equals("") ) 
               {

               //先清空参数数组
               resetParameters( strUpdateFieldName, iNewValue, strSequenceName );
               // 险情详情表要更新的第一个字段是pjno用上级tb_pj表新获得的流水号替换
               strUpdateFieldName[0]="PJNO"; iNewValue[0] = newPjno;
               // 险情详情表表要更新的第二个字段是 dncno，该值用 表名对应的的新序号替换
               strUpdateFieldName[1]="DNCNO"; iNewValue[1] = newDncno ;
               //strSequenceName[1] = strDangerDetailTable.substring(3)+".nextval" ;
			   //strSequenceName[1] = "";
               // stdnc 表要更新的第三个字段是 STTPCD 用刚才获得的 newStSttpcd 替换
               strUpdateFieldName[2]="STTPCD"; iNewValue[2] = newStSttpcd ;

               if ( !copyAllRecord( cnSource, cnTarget, strDangerDetailTable, 
                       "pjno=" + comparePjno + " and sttpcd=" + oldStSttpcd + 
						" and dncno=" + oldDncno  , 
                       strUpdateFieldName, iNewValue, strSequenceName,
						"", -1 ) )
				   {
				   System.out.println("复制 " + strDangerDetailTable + " 表时发生了错误");
				 return false;
				   }

			   
               }
            else
               {
               System.out.println("copyDanger: 没有和代码：" + 
                   strXQFLDM + " 对应的险情详情表.请检查...");
                }
            // 处理相关的险情多媒体表记录：调用copyData；
            // 将 pjrno=oldPjrno 的记录复制到 cnTarget 中.
            // 需要对该详情表的 dncno 字段以 Tb_stdnc 表刚刚获取的新序号 newDncno 替代，
            // 而其主键字段 zlbm 则需要从后台服务器取得

            //先清空参数数组
            resetParameters( strUpdateFieldName, iNewValue, strSequenceName );
            // 险情多媒体表要更新的第一个字段是 Dncno 
            // 用tb_stdnc表新获得的流水号newDncno替换
            strUpdateFieldName[0]="DNCNO"; iNewValue[0] = newDncno ;
            // 险情多媒体表要更新的第二个字段是 zlbm 用刚才获得的 stdnc_m.nextval 替换
            strUpdateFieldName[1] = "zlbm"; iNewValue[1] = newStSttpcd ;
            strSequenceName[1] = "stdnc_m.nextval";

            if ( !copyAllRecord( cnSource, cnTarget, "tb_stdnc_m", "dncno="+oldDncno, 
   	         strUpdateFieldName, iNewValue, strSequenceName, "zlbm", -1 ) )
				{
				System.out.println("发生了错误");
                return false;
                }
            }
            sourceCursor.close(); //及时关闭游标，避免占用过多资源
            sourceStmt.close();   //释放sql 句柄
         }
         stCursor.close();		//及时关闭游标，避免占用过多资源
		 stStmt.close();        //释放sql 句柄
      }
   catch(SQLException e)
      {e.printStackTrace();
      return false;
      }
   return true;
}

// 复制运行信息及其相关信息函数
private boolean copyRunStatus(Connection cnSource, Connection cnTarget, int sourcePJNO, int targetPJNO)
{
String[] strUpdateFieldName={"","","",""};
Object[] iNewValue={-1, -1, -1, -1};
String[] strSequenceName={"","","",""};

   // 筛选和指定流水号一致的工情记录
   try
      {   
      System.out.println("enter the copyRunStatus.The parameter is targetPJNO="+targetPJNO+".");
      
      int newPjrno;    //存放tb_pjrcn新获取的pjno值
      int oldPjrno;	//存放本记录中的主键值，便于和多媒体表的pjno联系
      String strGCFLDM;   //存放工程信息表记录中对应的工程分类代码，便于查找对应的详情表名称

      String strSql = "select * from tb_pjrcn where pjno=" + sourcePJNO;
      Statement sourceStmt = cnSource.createStatement();
      ResultSet sourceRS = sourceStmt.executeQuery( strSql.toUpperCase() );
         
      int iTmp = 0;
      while (sourceRS.next())
         {
          // 获取当前记录对应的详情表名称: getRunDetailTable()
          //存放好strGCFLDM值，作为绑定参数函数调用时本记录的gcfl字段值进行替换
         strGCFLDM  = sourceRS.getString("GCFLDM");
	     oldPjrno = sourceRS.getInt("PJRNO");
         newPjrno = getNextSequence(cnTarget, "TB_PJRCN");
         //复制当前记录到服务器中：注意！哪个字段被读取过就必须单独处理：
         // pjrno字段是用服务器端的值更新的，pjno是上级指定的(新的流水号)

         //先清空参数数组
         resetParameters( strUpdateFieldName, iNewValue, strSequenceName );
         // tb_pjrcn 表要更新的第一个字段是 pjno 用刚才获得的 newPjno 替换
         strUpdateFieldName[0]="PJNO"; iNewValue[0] = targetPJNO ;
         // tb_pjrcn 表要更新的第二个字段是 pjrno 用刚才获得的 newPjrno 替换
         strUpdateFieldName[1] = "PJRNO"; iNewValue[1] = newPjrno;
         // tb_pjrcn 表要更新的第三个字段是 GCFLDM 用刚才保存的 strGCFLDM 替换
         strUpdateFieldName[2] = "GCFLDM"; iNewValue[2] = strGCFLDM;
         
		 ++iTmp;
         if (!copyCurrentRecord(sourceRS,cnSource, cnTarget, "TB_PJRCN", 
                          strUpdateFieldName, iNewValue, strSequenceName, "", -1 ))
            { 
			 System.out.println("发生了错误");
			 return false; 
			 }
         System.out.println("tb_pjrcn表的第" + iTmp + "当前记录复制完毕");
          
	     // 根据运行状态表中的分类代码查找对应的详情表名称.
	     // 若找不到，则对详情表内容不予处理
	     String strRunDetailTable = getRunDetailTable(strGCFLDM);
         if (! strRunDetailTable.equals("")) 
            {
            // 处理对应的详情表记录
            // 需要对该详情表的pjno字段以 Tb_pj 表刚刚获取的新工程的序号 newPjno 替代(上级指定)，
            // 而其主键字段pjrno则需要从后台服务器取得
            resetParameters( strUpdateFieldName, iNewValue, strSequenceName );
            // 工情详情表要更新的第一个字段是 pjno 用刚才获得的 newPjno 替换
            strUpdateFieldName[0]="PJNO"; iNewValue[0] = targetPJNO ;
            // 工情详情表要更新的第二个字段是 pjrno 用 父表对应的新序列号 替换
            strUpdateFieldName[1] = "PJRNO"; iNewValue[1] = newPjrno;
            //strSequenceName[1] = strRunDetailTable.substring(3)+".nextval";
            
            if ( !copyAllRecord( cnSource, cnTarget, strRunDetailTable, 
            	"pjno="+sourcePJNO+" and pjrno="+oldPjrno, strUpdateFieldName, 
				iNewValue, strSequenceName, "", -1 ) )
				{
				System.out.println("发生了错误");
                return false;
				}
             }
          else
             {
             System.out.println("copyRunStatus: 没有和代码：" + 
             	strGCFLDM + " 对应的运行详情表");
             }
          // 处理相关的工情多媒体表记录：调用copyData；
          // 将 pjrno=oldPjrno 的记录复制到 cnTarget 中.
          // 需要对该详情表的 pjrno 字段以 Tb_pjrcn 表刚刚获取的新序号 newPjrno 替代，
          // 而其主键字段 zlbm 则需要从后台服务器取得
          // 需要对2个字段作单独处理

          //先清空参数数组
          resetParameters( strUpdateFieldName, iNewValue, strSequenceName );
          // 工情详情表要更新的第一个字段是 zlbm 用 pjr_m.nextval 替换
          strUpdateFieldName[0]="zlbm"; iNewValue[0] = 0 ;
          strSequenceName[0] = "pjr_m.nextval" ;
          // 工情详情表要更新的第二个字段是 pjrno 用指定的 newPjrno 替换
          strUpdateFieldName[1] = "PJRNO" ; iNewValue[1] = newPjrno;
          
          if ( !copyAllRecord( cnSource, cnTarget, "tb_pjr_m", "pjrno="+oldPjrno, 
   		      strUpdateFieldName, iNewValue, strSequenceName, "zlbm", -1 ) )
			 {
			  System.out.println("对工情多媒体tb_pjr_m入库时表发生了错误.");
			  return false;
			  }
         }        
		 sourceRS.close();
		 sourceStmt.close();     
      }//end of try 
   catch(SQLException e)
      {e.printStackTrace();
      return false;
      }
   return true;
}

// 复制防汛行动、灾情、防汛简报、其他 4 类信息。
public boolean copyOtherTables(Connection cnSource, Connection cnTarget)
{
String[] classTableList = {"TB_SD", "tb_QT", "tb_fpacti","tb_fxjb"};
String strClassKeyFieldName = "RPJINCD"; //这4类信息表的主键名称都是rpjincd :)
   
String[] mediaTableList = {"tb_sd_m", "tb_qt_m", "tb_fpacti_m", "tb_fxjb_m"};
String mediaPKField = "zlbm";

String tableName;
String mediaTableName;

String[] strUpdateFieldName={"","","",""};
Object[] iNewValue={-1, -1, -1, -1};
String[] strSequenceName={"","","",""};

int i;   

for (i=0; i<classTableList.length; i++)
   {
   tableName = classTableList[i].toUpperCase();
   mediaTableName = mediaTableList[i].toUpperCase();
   try
      {   
      int oldKeyValue;	//存放信息表当前记录的主键值
      int newKeyValue;    //存放信息表新获取的主键值
      
      //从cnSource中获得信息表所有的记录
      String strSql = "select * from " + tableName;
      Statement sourceStmt = cnSource.createStatement();
      ResultSet sourceCursor = sourceStmt.executeQuery( strSql.toUpperCase() );
         
      // 开始循环：
      int iCounter = 0;
      while (sourceCursor.next())
         {
         //   取得当前记录主键值：=> curKeyFieldValue
	     oldKeyValue = sourceCursor.getInt("RPJINCD");
         newKeyValue = getNextSequence(cnTarget, tableName);
         // 用处理一个字段的复制函数(只复制当前记录)
         System.out.println("正在复制 " + tableName + " 表的第" + (++iCounter) + "记录...");
         //先清空参数数组
         resetParameters( strUpdateFieldName, iNewValue, strSequenceName );
         // 其他类别表要更新的第一个字段是 strClassKeyFieldName 用 newKeyValue 替换
         strUpdateFieldName[0]=strClassKeyFieldName; iNewValue[0] = newKeyValue  ;
          
         if (!copyCurrentRecord(sourceCursor,cnSource, cnTarget, tableName, 
                 strUpdateFieldName, iNewValue, strSequenceName, "rpjincd", newKeyValue ))
            { 
			 return false; 
			 }
         System.out.println("已经复制了 " + tableName + "第" + iCounter + "记录...");
          
         // 筛选对应的多媒体表中rpjincd字段内容等于oldKeyValue的记录进行复制
         // 复制时候将该字段以刚刚获取的新序号 newKeyValue 替代，
         // 而自己的主键字段 zlbm 则需要从后台服务器取得
         // 需要对2个字段作单独处理
         //if ( !strMultimediaTableName.equals("TB_FXJB_M") )
         //{//暂时不处理防汛简报的媒体表
	     //System.out.println( "没有处理TB_FXJB_M" );
      	 //writeLogFile( "没有处理TB_FXJB_M" );
         

         //先清空参数数组
         resetParameters( strUpdateFieldName, iNewValue, strSequenceName );
         // 其他4类表要更新的第一个字段是 strClassKeyFieldName 用 newKeyValue 替换
         strUpdateFieldName[0]=strClassKeyFieldName; iNewValue[0] = newKeyValue ;
         // 其他4类表要更新的第二个字段是 strMultimediaKeyFieldName 
         // 用对应的多媒体表的序列值替换
         strUpdateFieldName[1] = mediaPKField ; iNewValue[1] = 0;
         strSequenceName[1] = mediaTableName;

         if ( !copyAllRecord( cnSource, cnTarget, mediaTableName, 
         	strClassKeyFieldName + "=" + oldKeyValue, 
   			strUpdateFieldName, iNewValue, strSequenceName, "zlbm", -1 ) )
			 {
	         System.out.println( "错误：copyOtherTables中的错误，出现在多媒体数据中" );
			 return false;
		     }
         
         }
		 sourceCursor.close();
		 sourceStmt.close();
	  } 
   catch(SQLException e)
      {
      String strErrorInfo = "错误::copyOtherTables::"+e.getMessage()+
      			" \n错误代码:"+e.getErrorCode(); 
      System.out.println( strErrorInfo );
      return false;
      }
   }
   return true;
}

// 复制报表记录
public boolean copyReportTables(Connection cnSource, Connection cnTarget)
{
//报表列表
String[] reportTableList = {"TB_BCSTSDST","TB_DKDNCSTA1","TB_DKDNCSTA2",
			"TB_DKSNWS","TB_HYWDMS","TB_RDEST1","TB_RDEST2",
			"TB_WDMPJRHS","TB_WDMPJS","TB_WDMPJS1","TB_WDMPJS2"};
String strReportTable ;
int i;

String[] strUpdateFieldName={"","","",""};
Object[] iNewValue={-1, -1, -1, -1};
String[] strSequenceName={"","","",""};

for (i=0; i<reportTableList.length; i++)
   {
   strReportTable = reportTableList[i].toUpperCase();

   System.out.println("正在处理 " + strReportTable + " 表的记录......");
         // 复制时候将rpjincd字段需要从后台服务器取得
         // 需要对1个字段作单独处理
   	     // 过滤条件为恒真1=1：即所有记录都被复制
   	    // 需要更新获取新流水号的字段是 rpjincd

         //先清空参数数组
         resetParameters( strUpdateFieldName, iNewValue, strSequenceName );
         // 报表类表要更新的唯一一个字段是 rpjincd 用 表对应的序列好 替换
         strUpdateFieldName[0] = "rpjincd" ; iNewValue[0] = 0;
         strSequenceName[0] = strReportTable;
   	
         if ( !copyAllRecord( cnSource, cnTarget, strReportTable , "1=1", 
   				strUpdateFieldName, iNewValue, strSequenceName, "", 0 ) )
	         {
			 System.out.println("发生了错误");
			 return false;
			 }

         System.out.println("已经复制了 " + strReportTable + " 表的所有记录......");
   }
return true;
}

}
/*
有clob类型的表包括：
1. TB_STDNC		主键：DNCNO 
2. TB_FPACTI	主键：RPJINCD
3. TB_SD		主键： RPJINCD
4. TB_QT		主键： RPJINCD
5. TB_FXJB		主键： RPJINCD
有blob类型的表包括：
1. TB_PJR_M		主键： zlbm
2. TB_STDNC_M	主键： zlbm
3. TB_FPACTI_M	主键： zlbm
4. TB_SD_M		主键： zlbm
5. TB_QT_M		主键： zlbm
6. TB_FXJB_M	主键： zlbm

		    System.out.println("正在读源内容");
			byte[] bigText = null;
            bigText = getBlobFieldBytes( sourceCursor, targetMetaData.getColumnName(i) );
			byte[] tmpText = new byte[1024];
			intParaindex++;
            ByteArrayInputStream zzz = null;
			int iChunk=0;
			int iTmp=0;
			int iIndex=0;
			for (iChunk=0; iChunk+1024<bigText.length; iChunk + = 1024)
			{
			 for(iTmp=0; iTmp<1024; iTmp++)
				{tmpText[iTmp] = bigText[iIndex++];}
				zzz = new ByteArrayInputStream( tmpText );
				// 将读取到的内容绑定在要写入的字段上
				serverPreStmt.setBinaryStream( intParaindex, zzz, bigText.length );
			}
			for(iTmp=0; iTmp<bigText.length-iChunk; iTmp++)
				{tmpText[iTmp] = bigText[iIndex++];}
				zzz = new ByteArrayInputStream( tmpText );
				// 将读取到的内容绑定在要写入的字段上
				serverPreStmt.setBinaryStream( intParaindex, zzz, bigText.length );
*/
