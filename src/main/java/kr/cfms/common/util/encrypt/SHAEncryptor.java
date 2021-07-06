package kr.cfms.common.util.encrypt;

import kr.cfms.common.exception.BaseException;
import kr.cfms.common.message.BaseErrorMessage;
import lombok.extern.slf4j.Slf4j;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Slf4j
public final class SHAEncryptor {
	
	public static String encrypt(String str) {
		
		StringBuilder encString = new StringBuilder();
		MessageDigest digest = null;
		byte[] msgStr = null;
		
		try {
			digest = MessageDigest.getInstance("SHA-256");
			digest.update(str.getBytes());
			msgStr = digest.digest();
		} catch (NoSuchAlgorithmException e) {
			log.error("", e);
			throw new BaseException(BaseErrorMessage.PROCESS_FAILED);
		}

		for (byte strByte : msgStr) {
			String tmpEncStr = Integer.toString((strByte & 0xff) + 0x100, 16).substring(1);
			encString.append(tmpEncStr);
		}

		return encString.toString();
	}
}
