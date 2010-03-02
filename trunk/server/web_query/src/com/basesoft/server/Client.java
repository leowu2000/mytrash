package com.basesoft.server;

import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.RandomAccessFile;
import java.net.Socket;
import java.net.UnknownHostException;

public class Client {
	int BLOCK_SIZE=1024;

	public static void main(String[] args) {
		Client c = new Client();
		try {
			c.send("d:/141030356.mdb.zip");
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void send(String fileName) throws UnknownHostException, IOException {
		File f = new File(fileName);
		String m_FileName2 = f.getName();
		String m_FileLen = f.length() + "";
		String m_FileTime = "";
		String m_FileDepart = "毕节防办";
		int MAX_SIZE = 1024;
		Socket server = new Socket("localhost", 9292);

		DataOutputStream out = new DataOutputStream(server
				.getOutputStream());
		InputStreamReader in = new InputStreamReader(server.getInputStream());
		String head = "SSGQ" + "#" + m_FileName2 + "#" + m_FileLen + "#"
				+ m_FileTime + "#" + m_FileDepart + "#" + MAX_SIZE + "#";
		out.write(head.getBytes());
//		out.flush();

		char[] cs = new char[10];
		while (in.read(cs) > 0) {
			String data = new String(cs);
			System.out.println(data);
			int pack = Integer.parseInt(data.substring(0, data.indexOf("#")));
			if (pack >= 0) {
				System.out.println(pack);
				byte[] bytes = readFileByRandomAccess(fileName,pack*BLOCK_SIZE);
				out.write(bytes);
				out.flush();
				System.out.println("写入块："+pack+" :"+bytes.toString());
			}
			cs = new char[10];
		}
		in.close();
		server.close();
	}

	/**
	 * 随机读取文件内容
	 * @param fileName  文件名
	 */
	public byte[] readFileByRandomAccess(String fileName,int beginIndex) {
		RandomAccessFile randomFile = null;
		try {
			// 打开一个随机访问文件流，按只读方式
			randomFile = new RandomAccessFile(fileName, "r");
			// 文件长度，字节数
			long fileLength = randomFile.length();
			// 将读文件的开始位置移到beginIndex位置。
			randomFile.seek(beginIndex);
			byte[] bytes = new byte[BLOCK_SIZE];
			int byteread = 0;
			byteread = randomFile.read(bytes);
			return bytes;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		} finally {
			if (randomFile != null) {
				try {
					randomFile.close();
				} catch (IOException e1) {
				}
			}
		}
	}
}
