package kr.cfms.common.util.encrypt;

import kr.cfms.common.exception.BaseException;
import kr.cfms.common.message.BaseErrorMessage;

import java.security.MessageDigest;

public class MD5Encryptor {
	
	public static String encrypt(String str) {
		
		StringBuilder stringBuilder = new StringBuilder();
		
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(str.getBytes());
			byte[] md5Bytes = md5.digest();
			for (byte md5Byte : md5Bytes) {
				stringBuilder.append(Integer.toString((md5Byte & 0xFF) + 0x100, 16).substring(1));
			}
		} catch (Exception e) {
			throw new BaseException(BaseErrorMessage.PROCESS_FAILED);
		}
		
		return stringBuilder.toString();
	}
}
