package com.basesoft.server;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.net.Socket;
import java.text.DateFormat;
import java.util.zip.CRC32;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

class ServerThread extends Thread {
	//SOCK流的变量
	Socket clientSocket;
        DataInputStream DataIn;
        DataOutputStream DataOut;
        //接收文件数据的变量
        String SockAddtion;
        int remainPack;
        int backPack;
        byte sockSendByte;

//        ServerFrame serverMyFrame;

        //分割附加信息变量
        String SockFileFlag="";
        String SockFileName="";
        String SockFileLen="";
        String SockFileCreatDate="";
        String SockFileDanWei="";
        int SockBlockSize;
        int totalPack=0;
        boolean remainIsExist=false;
        int remainTotal=0;
        int MAX_SIZE;

        //文件操作变量
        File logFile;
        FileWriter  fWriter;
	int nCheckFile=0;
	int ExistPack=0;
	boolean LogFileExist=false;

        public ServerThread(ServerFrame parent,Socket s) {
//           this.serverMyFrame=parent;
//           serverMyFrame.ConnectNum++;
//           ContentLogFile("数据接收编号："+serverMyFrame.ConnectNum);
           this.clientSocket=s;
        }
        public ServerThread(Socket s) {
//          this.serverMyFrame=parent;
//          serverMyFrame.ConnectNum++;
//          ContentLogFile("数据接收编号："+serverMyFrame.ConnectNum);
          this.clientSocket=s;
       }
        public synchronized void run(){
        	int curPack=0;
        	byte[] socketData=new byte[256];
                FileOutputStream outputFile=null;
                try{
              		DataIn=new DataInputStream(clientSocket.getInputStream());
              		DataOut=new DataOutputStream(clientSocket.getOutputStream());
              	}catch(IOException e){
              		e.printStackTrace();
              	}
                try{
                	try{
                		DataIn.read(socketData);
                	}catch(IOException e1){
                		System.out.println("接收信息包出错！"+e1.getMessage());
                	}
                	
                	System.out.println("开始接收文件：");
                	ByteToString(socketData);
                	System.out.println("附加信息："+SockAddtion);
                	
                	if(!SockAddtion.trim().equals("")){
                	formatInfo(SockAddtion);
                	ContentLogFile("发送单位是："+SockFileDanWei);
                	
                	byte[] buffer=new byte[MAX_SIZE];
                	if(SockFileFlag.equals("SSGQ")){
                		System.out.println("检查日志文件：");
                		checkLogFileExist(SockFileName);
                		if (LogFileExist) {
                			try{
                				CheckLogFile(SockFileName);
                			}catch(Exception e1){
                				System.out.println("检查完日志文件:"+e1.getMessage());
                				nCheckFile=3;
                			}
                			System.out.println("检查完日志文件:"+nCheckFile);
                			switch(nCheckFile){
                				case 1:
                					remainPack=ExistPack;
                					System.out.println("最后的包数"+remainPack);
                					if (remainPack<totalPack-1 && remainPack>0){
                						curPack=ExistPack+1;
                						System.out.println("续传！返回客户端包数:"+curPack);
                						SendPack(curPack);
                						outputFile=new FileOutputStream(SockFileName,true);
                						System.out.println("开始发送的包数："+curPack);
										for(int i=curPack;i<totalPack;i++){
											DataIn.readFully(buffer,0,MAX_SIZE);
											DataIn.skip(1);
											outputFile.write(buffer,0,MAX_SIZE);
											DeleteLogFile(SockFileName);
											WriteLog(SockFileFlag,SockFileName);
											WriteLog(SockFileName,SockFileName);
											WriteLog(SockFileLen,SockFileName);
											WriteLog(SockFileCreatDate,SockFileName);
											WriteLog(SockFileDanWei,SockFileName);
											WriteLog(curPack,SockFileName);
											curPack++;
											SendPack(curPack);
										}
										if(remainTotal!=0){
											System.out.println("接收余数！");
											DataIn.readFully(buffer,0,remainTotal);
											outputFile.write(buffer,0,remainTotal);
										}
										else{
											System.out.println("接收最后一个包！");
											DataIn.readFully(buffer,0,MAX_SIZE);
											DataIn.skip(1);
											outputFile.write(buffer,0,MAX_SIZE);
											DeleteLogFile(SockFileName);
											WriteLog(SockFileFlag,SockFileName);
											WriteLog(SockFileName,SockFileName);
											WriteLog(SockFileLen,SockFileName);
											WriteLog(SockFileCreatDate,SockFileName);
											WriteLog(SockFileDanWei,SockFileName);
											WriteLog(curPack,SockFileName);
										}
										System.out.println("已全部收完!");
										SendPack(-4);
										ContentLogFile(SockFileDanWei+":"+"续传......数据传输成功!!");
                					}else{
                						System.out.println("入库未成功");
                						SendPack(-3);
                						ContentLogFile("开始检查到入库出错");
                					}
                					break;
                				case 2:
                					System.out.println("与日志文件文件创建日期不一样，是否覆盖？");
                					SendPack(-1);
                					break;
                				case 3:
                					System.out.println("与日志文件不符合！");
                					SendPack(0);
                					break;
                				case 0:
                					System.out.println("检查日志文件出错！");
                					SendPack(0);
                					break;
                			}
                		}else{
                			System.out.println("日志文件不存在，并返回客户端包数0:");
                			SendPack(0);
                		}
                	}else{
                		System.out.println("传来的文件有误！");
                	}
			if (curPack<totalPack){
				System.out.println("新的传输数据");
				outputFile=new FileOutputStream(SockFileName);
	
				for(int i=curPack;i<totalPack;i++){
					DataIn.readFully(buffer,0,MAX_SIZE);
					DataIn.skip(1);
					outputFile.write(buffer,0,MAX_SIZE);
					DeleteLogFile(SockFileName);
					WriteLog(SockFileFlag,SockFileName);
					WriteLog(SockFileName,SockFileName);
					WriteLog(SockFileLen,SockFileName);
					WriteLog(SockFileCreatDate,SockFileName);
					WriteLog(SockFileDanWei,SockFileName);
					WriteLog(curPack,SockFileName);
					curPack++;
					SendPack(curPack);
				}
				if(remainTotal!=0){
					System.out.println("接收余数!");
					DataIn.readFully(buffer,0,remainTotal);
					outputFile.write(buffer,0,remainTotal);
				}else{
					System.out.println("接收最后一个包!");
					DataIn.readFully(buffer,0,MAX_SIZE);
					DataIn.skip(1);
					outputFile.write(buffer,0,MAX_SIZE);
					DeleteLogFile(SockFileName);
					WriteLog(SockFileFlag,SockFileName);
					WriteLog(SockFileName,SockFileName);
					WriteLog(SockFileLen,SockFileName);
					WriteLog(SockFileCreatDate,SockFileName);
					WriteLog(SockFileDanWei,SockFileName);
					WriteLog(curPack,SockFileName);
				}
				System.out.println("已全部收完!");
				SendPack(-4);
				ContentLogFile(SockFileDanWei+":"+"数据传输成功!!");
			}

			//调用入库模块
			System.out.println("调用入库模块!");
			DbQuery DataDbQuery=new DbQuery("");

            // 如果是ZIP文件先解压缩
				if ((SockFileName.substring(SockFileName.length() - 4)
						.toUpperCase().equals(".ZIP"))) {
					if (!extractZipedMdbFile(SockFileName)) {
						System.out.println(SockFileName + "解压缩失败。");
					}
					// 先判断SockFileName扩展名是否是。ZIP？
					// DataDbQuery.setMdbFileName(SockFileName);

					// 将 .ZIP 4个字符去掉，成为释放后的MDB文件。以此文件入库。
					String strMdbFileName = SockFileName.substring(0,
							SockFileName.length() - 4);
					DataDbQuery.setMdbFileName(strMdbFileName);
					System.out.println("收到ZIP文件:" + SockFileName
							+ " , 解压缩后文件" + strMdbFileName);
				} else {
					DataDbQuery.setMdbFileName(SockFileName);
				}

   			try{
   				Thread.sleep(1000);
   			}catch(InterruptedException e){
   				System.out.println("阻塞状态出错"+e.getMessage());
   			}

   			if (DataDbQuery.beginCopyData()){
   				System.out.println("入库成功!!");
   				SendPack(-2);
   				try{
   					DataIn.close();
   					outputFile.close();
   				}catch(Exception e){
   					System.out.println("已关闭接收文件数据流出错"+e.getMessage());
   				}
   				System.out.println("已关闭完接收文件数据流");
   				try{
   					DeleteLogFile(SockFileName);
   					DeleteMdbFile(SockFileName);
   				}catch(Exception e){
   					System.out.println("删除日志文件和数据库文件出错："+e.getMessage());
   				}
   			}else{
   				System.out.println("第一次入库出故障!!");
   				SendPack(-3);
   				ContentLogFile("第一次入库之后出错");
  				//入库不成功，允许重传一次
  				System.out.println("入库出故障,重传一次!!");

  				try{
   					outputFile.close();
   				}catch(Exception e){
   					System.out.println("已关闭接收文件数据流出错"+e.getMessage());
   				}
  				DataIn.readFully(buffer,0,MAX_SIZE);
				DataIn.skip(1);

  				//outputFile=new FileOutputStream(SockFileName+".mdb");
  				outputFile=new FileOutputStream(SockFileName);

  				outputFile.write(buffer,0,MAX_SIZE);
				DeleteLogFile(SockFileName);
				WriteLog(SockFileFlag,SockFileName);
				WriteLog(SockFileName,SockFileName);
				WriteLog(SockFileLen,SockFileName);
				WriteLog(SockFileCreatDate,SockFileName);
				WriteLog(SockFileDanWei,SockFileName);
				WriteLog(curPack,SockFileName);
				SendPack(0);
  				curPack=1;
  				for(int i=curPack;i<totalPack;i++){
					DataIn.readFully(buffer,0,MAX_SIZE);
					DataIn.skip(1);
					outputFile.write(buffer,0,MAX_SIZE);
					DeleteLogFile(SockFileName);
					WriteLog(SockFileFlag,SockFileName);
					WriteLog(SockFileName,SockFileName);
					WriteLog(SockFileLen,SockFileName);
					WriteLog(SockFileCreatDate,SockFileName);
					WriteLog(SockFileDanWei,SockFileName);
					WriteLog(curPack,SockFileName);
					curPack++;
					SendPack(curPack);
				}
				if(remainTotal!=0){
					System.out.println("接收余数!");
					DataIn.readFully(buffer,0,remainTotal);
					outputFile.write(buffer,0,remainTotal);
				}else{
					System.out.println("接收最后一个包!");
					DataIn.readFully(buffer,0,MAX_SIZE);
					DataIn.skip(1);
					outputFile.write(buffer,0,MAX_SIZE);
					DeleteLogFile(SockFileName);
					WriteLog(SockFileFlag,SockFileName);
					WriteLog(SockFileName,SockFileName);
					WriteLog(SockFileLen,SockFileName);
					WriteLog(SockFileCreatDate,SockFileName);
					WriteLog(SockFileDanWei,SockFileName);
					WriteLog(curPack,SockFileName);
				}
				System.out.println("已全部收完!");
				SendPack(-4);
				ContentLogFile("发送单位是："+SockFileDanWei+":"+"文件传输完毕!!");
				//调用入库模块
				//DataDbQuery.setMdbFileName(SockFileName+".mdb");

                // 如果是ZIP文件先解压缩
					if ((SockFileName.substring(SockFileName.length() - 4)
							.toUpperCase().equals(".ZIP"))) {
						if (!extractZipedMdbFile(SockFileName)) {
							System.out.println(SockFileName + "解压缩失败。");
						}
						// 将 .ZIP 4个字符去掉，成为释放后的MDB文件。以此文件入库。
						String strMdbFileName = SockFileName.substring(0,
								SockFileName.length() - 4);
						DataDbQuery.setMdbFileName(strMdbFileName);
						System.out.println("收到ZIP文件是:" + SockFileName
								+ " , 解压缩后的文件是" + strMdbFileName);
					} else {
						DataDbQuery.setMdbFileName(SockFileName);
					}

				if (DataDbQuery.beginCopyData()) {
						System.out.println("最后入库成功!!");
						SendPack(-2);
						// clientRequest.close();
						// serverMyFrame.ConnectNum--;
						// System.out.println("已关闭第"+serverMyFrame.ConnectNum+"个连接");
						try {
							DataIn.close();
							outputFile.close();
						} catch (Exception e) {
							System.out.println("已关闭接收文件数据流出错" + e.getMessage());
						}
						// randomFile.close();
						try {
							DeleteLogFile(SockFileName);
							DeleteMdbFile(SockFileName);
						} catch (Exception e) {
							System.out.println("删除日志文件和数据库文件出错："
									+ e.getMessage());
						}
						ContentLogFile("发送单位" + SockFileDanWei + ":"
								+ "好了，这次入库成功!!");
					} else {
						System.out.println("入库再次出故障!!,请退出");
						SendPack(-5);
						// serverMyFrame.ConnectNum--;
						try {
							DataIn.close();
							outputFile.close();
						} catch (Exception e) {
							System.out.println("已关闭接收文件数据流出错" + e.getMessage());
						}
						// randomFile.close();
						ContentLogFile(SockFileDanWei + ":"
								+ "入库再次出故障，可能数据文件有问题!!");
					}
   			}
   		}
		}catch(IOException e){
                	System.out.println("接收数据抛出的异常!"+e.getMessage());
        }finally{
                	try{
                		try{
		   					DataIn.close();
		   					outputFile.close();
		   				}catch(Exception e){
		   					System.out.println("已关闭接收文件数据流出错"+e.getMessage());
		   				}
                		//randomFile.close();
//                		serverMyFrame.ConnectNum--;
//                		System.out.println("线程数目"+serverMyFrame.ConnectNum);
                		try{
	                		clientSocket.close();
                		}catch(Exception e){
                			System.out.println("关闭单个SOCKET流出错"+e.getMessage());
                		}
                		System.out.println("结束");
                	}
                	catch(Exception e){
//                		serverMyFrame.ConnectNum--;
                		e.printStackTrace();
                	}
                }
	}
        
	//将附加信息分割出来
	public void formatInfo(String strAdd){
		try{
			String str;
			str=strAdd.trim();
			int len1=str.indexOf("#");
			SockFileFlag=new String(str.substring(0,len1));
			String str1=new String(str.substring(len1+1));
			System.out.println("文件标志："+SockFileFlag);
			int len2=str1.indexOf("#");
			SockFileName=str1.substring(0,len2);
			String str2=new String(str1.substring(len2+1));
			System.out.println("文件名："+SockFileName);
			int len3=str2.indexOf("#");
			SockFileLen=(str2.substring(0,len3)).trim();
			String str3=new String(str2.substring(len3+1));
			System.out.println("文件长度："+SockFileLen);
			int len4=str3.indexOf("#");
			SockFileCreatDate=str3.substring(0,len4);
			String str4=new String(str3.substring(len4+1));
			System.out.println("文件日期："+SockFileCreatDate);
			int len5=str4.indexOf("#");
			SockFileDanWei=str4.substring(0,len5);
			String str5=new String(str4.substring(len5+1));
			System.out.println("发送单位："+SockFileDanWei);
			int len6=str5.indexOf("#");
			String blocksize=str5.substring(0,len6);
			SockBlockSize=Integer.parseInt(blocksize.trim());
			System.out.println("包的字节数"+SockBlockSize);
			MAX_SIZE=SockBlockSize;
			int filelen=Integer.parseInt(SockFileLen.trim());
			if(SockBlockSize!=0){
			totalPack=(int)filelen/SockBlockSize;
			remainTotal=filelen-(totalPack)*SockBlockSize;
			if((filelen%SockBlockSize)==0){
				remainIsExist=true;
				System.out.println("正好被整除!");
			}
			else{
				remainIsExist=false;
				System.out.println("余字节数:"+remainTotal);
			}
			}
			System.out.println("返回客户端包数:"+totalPack);
		}
		catch(Exception e){
			System.out.println("附加信息有错!!"+e.getMessage());
		}
	}

	//写日志文件
	public void WriteLog(String info,String strFileName){
		try{
			fWriter=new FileWriter((strFileName+".log"),true);
			BufferedWriter logBufferedWriter = new BufferedWriter(fWriter, 256);
      			logBufferedWriter.write(info,0,info.length());
      			logBufferedWriter.newLine();
      			logBufferedWriter.flush();
      			logBufferedWriter.close();
      		}
      		catch(IOException e){
      			ContentLogFile("写续传日志文件出错！"+e.getMessage());
      		}

	}
	public void WriteLog(int infoPack,String strFileName){
		try{
			String info=Integer.toString(infoPack);
			fWriter=new FileWriter((strFileName+".log"),true);
			BufferedWriter logBufferedWriter = new BufferedWriter(fWriter, 512);
      			logBufferedWriter.write(info,0,info.length());
      			logBufferedWriter.newLine();
      			logBufferedWriter.flush();
      			logBufferedWriter.close();
      		}
      		catch(IOException e){
      			ContentLogFile("写续传日志文件出错！"+e.getMessage());
      		}

	}
	//判断文件是否存在
	public void checkLogFileExist(String strFileName){
		logFile=new File(strFileName+".log");
		if (logFile.exists()){
			LogFileExist=true;
		}
		else{
			LogFileExist=false;
			System.out.println("日志文件不存在！");
		}
	}

	//删除入库成功后ACCESS数据库文件
	public void DeleteMdbFile(String strFileName){
		File fmdb=null;
		//fmdb=new File(strFileName+".mdb");
		fmdb=new File(strFileName);
			if (fmdb.exists()){
				if(fmdb.delete()){
					//System.out.println("已成功地删除了数据库文件!");
				}
				else{
					System.out.println("无法删除数据库文件:"+strFileName);
				}
			}
	}
	//写日志文件作为判断
	public void DeleteLogFile(String strFileName){
		logFile=new File(strFileName+".log");
		if (logFile.exists()){
			try{
				if(logFile.delete()){
					//System.out.println("已成功删除日志文件!");
				}
				else{
					System.out.println("无法删除日志文件!");
				}
			}
			catch(Exception e){
				System.out.println("删除日志文件出错!"+e.getMessage());
				logFile.delete();
			}

		}
		else{
			System.out.println("日志文件不存在！");
		}
	}
	//写主要的日志的文件
	public void ContentLogFile(String info){
		try{
			File f=new File("人大金仓发送日志文件.log");
			long maxSizeOfLogFile = 1000000;
			if (f.length()>=maxSizeOfLogFile){
				File fLogBak = new File("人大金仓发送日志文件"+f.lastModified()+".log");
      				f.renameTo( fLogBak );
      			}
      			FileWriter logWriter=new FileWriter(("人大金仓发送日志文件.log"),true);
			BufferedWriter logBuffered = new BufferedWriter(logWriter, 512);
			DateFormat dFull = DateFormat.getDateTimeInstance();
			logBuffered.write("接收时间是："+(dFull.format(new java.util.Date())).toString()+";"+info);
      			logBuffered.newLine();
      			logBuffered.flush();
      			logBuffered.close();
      		}
      		catch(IOException e){
      			System.out.println("写主要日志文件出错!!"+e.getMessage());
      		}
      	}
      	//判断与传输文件是否相同
      	public void CheckLogFile(String strFileName){
		String strFileFlag=null;
		String sFileName=null;
		String strFileLen=null;
		String strFileCreatDate=null;
		String strFileDanWei=null;
		String strFilePack=null;
		try{
			FileReader fReader=new FileReader(strFileName+".log");
			BufferedReader bufReader=new BufferedReader(fReader,512);
			try{
				strFileFlag=(bufReader.readLine()).trim();
				sFileName=(bufReader.readLine()).trim();
				strFileLen=(bufReader.readLine()).trim();
				strFileCreatDate=(bufReader.readLine()).trim();
				strFileDanWei=(bufReader.readLine()).trim();
				strFilePack=(bufReader.readLine()).trim();
			}
			catch(NullPointerException e1){

				//strException strExce=new strException(e1);
				System.out.println("检查日志文件出错！取字符问题！"+e1.getMessage());
				bufReader.close();
			}
			if (strFileFlag.equals(SockFileFlag)&&
				sFileName.equals(SockFileName)&&
					strFileLen.equals(SockFileLen)&&
						strFileDanWei.equals(SockFileDanWei)){
				if(strFileCreatDate.equals(SockFileCreatDate)){
					nCheckFile=1;
					ExistPack=Integer.parseInt(strFilePack);
					System.out.println("检查日志文件的包数并返回："+ExistPack);
				}
				else{
					nCheckFile=2;
					System.out.println("文件日期不一样!!");
					ExistPack=0;
				}
			}
			else{
				System.out.println("与日志文件不符合!!");
				nCheckFile=3;
			}
		}
		catch(IOException e){
			System.out.println("检查日志文件出错！"+e.getMessage());
		}
	}
	//将字节转换为字符串
	public void ByteToString(byte[] byteTemp){
		byte[] strTemp=new byte[256];
		for(int i=0;i<256;i++){
			strTemp[i]=byteTemp[i];
		}
		SockAddtion=new String(strTemp);
	}
	//发送数字给客户
	public void SendPack(int pack){
		try{
			DataOut.write(new String(pack+"").getBytes());
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	protected void finalize(){
        	if (clientSocket != null) {
            		try {
                		//serverMyFrame.ConnectNum--;
                		clientSocket.close();
            		}
            		catch (IOException e) {
                		e.printStackTrace();
                		System.out.println("释放出错!"+e.getMessage());
            		}
            		clientSocket = null;
        	}
    }
	
    public void destroy(){
//    		System.out.println("线程数目"+serverMyFrame.ConnectNum);
   	}

      	//检查接受到的文件是否是ZIP扩展名？是则释放之
      public boolean extractZipedMdbFile(String zipFileName)
      {
         String strDataFileName = "";
         String s =zipFileName.substring(zipFileName.length()-4);
         System.out.println("extract文件："+zipFileName);

         //if (zipFileName.substring(zipFileName.length()-4).toUpperCase().equals(".ZIP"))
          if (s.toUpperCase().equals(".ZIP")){
             strDataFileName =  zipFileName.substring(0, zipFileName.length()-4);
             return extractFile(zipFileName,strDataFileName,strDataFileName);
          }else{
             return true;
          }
      }

      public boolean extractFile(String zipFileName,String sourceFileName,String outputFileName)
      {
       if ( zipFileName.equals("") )
       {
          System.out.println("您没有指定压缩文件名称。");
          return false;
       }

       if ( sourceFileName.equals("") )
       {
          System.out.println("您没有指定要解压缩哪一个文件。");
          return false;
       }
       if ( outputFileName.equals("") )
       {
          System.out.println("您没有指定解压缩到哪个文件。");
          return false;
       }
       
       byte buffer[] = new byte[1024];
       try //1
       {
          //open archive file
          FileInputStream stream = new FileInputStream( zipFileName );
          System.out.println("\nzipFileName :" +zipFileName );
          
          ZipInputStream zipStream = new ZipInputStream( stream );

          //find archive entry
          ZipEntry zipExtract = null;
          while(true){
          	try{
             	   zipExtract = zipStream.getNextEntry();
          	   }catch(Exception e){
          		   e.printStackTrace();
          	   }
             if (zipExtract == null){
                System.out.println("\n\nZIP包中没有文件：" + sourceFileName+"\n\n");
                break;
                }
             if (zipExtract.getName().equals(sourceFileName)){
                System.out.println("\n\nZIP包中的文件名：" + sourceFileName+"\n\n");
                break;
                }
             zipStream.closeEntry();
          }
          
          if (zipExtract == null || !zipExtract.getName().equals(sourceFileName)){
             stream.close();
             System.out.println("在"+ zipFileName +"中找不到要展开的文件："+ sourceFileName);
             return false;
          }
          //create output file
          FileOutputStream output = new FileOutputStream(outputFileName);
          
          //check store CRC
          long crcReq = zipExtract.getCrc();
          CRC32 crc = new CRC32();
          
          //read input & write to output
          while(true)
          {
             int nRead = zipStream.read(buffer,0,buffer.length);
             if (nRead <= 0) break;  
             output.write(buffer,0,nRead);
             crc.update(buffer,0,nRead);
          }
          //close all
          output.close();
          zipStream.closeEntry();
          stream.close();
          //check CRC value, if avaiable
          if ( crcReq != -1 && crc.getValue() != crcReq ){
             System.out.println(outputFileName + "CRC 校验错误。");
             return false;
          }
       }catch(Exception e){
          System.out.println("错误："+e.getMessage());
          return false;
       }
      System.out.println("文件" + sourceFileName + "已经被解压缩为："+ outputFileName);
      return true;
      }	

}
