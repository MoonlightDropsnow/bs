package com.zzu.zjh.util;

import org.apache.commons.codec.digest.DigestUtils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class MD5Utils {
	/**
	 * 使用md5加密
	 */
	public static String md5(String plainText) {
		byte[] secretBytes = null;
		try {
			secretBytes = MessageDigest.getInstance("md5").digest(
					plainText.getBytes());
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("没有md5算法");
		}
		String md5code = new BigInteger(1, secretBytes).toString(16);// 16��������
		// 生成数字未满32位，前面补0
		for (int i = 0; i < 32 - md5code.length(); i++) {
			md5code = "0" + md5code;
		}
		return md5code;
	}
	public static String getSalt() {

		char[] array = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".toCharArray();

		StringBuilder sbu = new StringBuilder("");
		Random random = new Random();
		for (int i = 0; i <= 6; i++) {
			int num = random.nextInt(array.length);
			sbu.append(array[num]);
		}
		return sbu.toString();
	}

	public static String encryption(String src) {
		return DigestUtils.md5Hex(src);
	}

	public static boolean checkPassword(String src, String pwd) {
		if (src == null) {
			throw new RuntimeException();
		}
		if (pwd == null) {
			throw new RuntimeException();
		}
		return encryption(src).equals(pwd);
	}

}
