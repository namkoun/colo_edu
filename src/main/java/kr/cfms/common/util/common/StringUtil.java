package kr.cfms.common.util.common;

import java.util.regex.Pattern;

import kr.cfms.common.constant.enumeration.MaskingType;
import org.apache.commons.lang3.StringUtils;

import kr.cfms.common.exception.BaseException;
import kr.cfms.common.message.BaseErrorMessage;
import lombok.extern.slf4j.Slf4j;


@Slf4j
public class StringUtil {
	
	public static boolean isHangulChk(String str) {
		
		if (str == null) {
			return false;
		}
		
        return Pattern.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*", str);
    }
	
	public static String masking(MaskingType type, String str) {
		
		if (StringUtils.isBlank(str)) {
			return str;
		}		
		
		String tmpStr = str.trim();
		
		if (MaskingType.ALL == type) {			
			return tmpStr.replaceAll(".", "*");
		} else if (MaskingType.NAME == type) {
			
			if(tmpStr.length() == 1) {
				return tmpStr;
			} else if (tmpStr.length() == 2) {
				return tmpStr.substring(0, 1) + "*";
			} else {
				return tmpStr.substring(0, 2) + "*";
			}			
		} else {
			log.error("Masking Type Error!! ");
			throw new BaseException(BaseErrorMessage.MASKING_TYPE_NONE);
		}
	}
}
