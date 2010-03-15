package com.upload;

import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.RandomAccessFile;
import java.net.Socket;
import java.net.UnknownHostException;

public class DataUploader {
	int BLOCK_SIZE = 10240;

	public static void main(String[] args) {
		DataUploader data = new DataUploader();
		try {
			String ip = "127.0.0.1";
			data.upload(ip, 9292, "d:/20100308173421.mdb.zip");
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// char[] cs = new char[10];
		// cs[0]='1';cs[1]='2';
		// System.out.println(cs);
		// String aa = new String(cs).trim();
		// System.out.println(aa);
	}

	public void upload(String ip, int port, String fileName)
			throws UnknownHostException, IOException {
		Socket server = new Socket(ip, port);
		File f = new File(fileName);
		String fName = f.getName();
		long fLen = f.length();
		String fTime = "";
		String fDepart = "�Ͻڷ���";

		DataOutputStream out = new DataOutputStream(server.getOutputStream());
		InputStreamReader in = new InputStreamReader(server.getInputStream());
		String head = "SSGQ" + "#" + fName + "#" + fLen + "#" + fTime + "#"
				+ fDepart + "#" + BLOCK_SIZE + "#";
		out.write(head.getBytes());

		char[] cs = new char[10];
		while (in.read(cs) > 0) {
			String data = String.valueOf(cs).trim();
			int pack = Integer.parseInt(data);
			if (pack >= 0) {
				byte[] bytes = readFileByRandomAccess(fileName, pack
						* BLOCK_SIZE);
				out.write(bytes);
				out.write('\0');
				out.flush();
				System.out.println("д��飺" + pack + " :" + bytes.length);
			}
			if (pack == -4)
				break;
			cs = new char[10];
		}
		in.close();
		server.close();
	}

	public byte[] readFileByRandomAccess(String fileName, int beginIndex) {
		RandomAccessFile randomFile = null;
		try {
			randomFile = new RandomAccessFile(fileName, "r");
			randomFile.seek(beginIndex);
			byte[] bytes = new byte[BLOCK_SIZE];
			randomFile.read(bytes);
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

