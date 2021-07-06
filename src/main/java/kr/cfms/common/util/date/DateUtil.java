package kr.cfms.common.util.date;

import kr.cfms.common.exception.BaseException;
import kr.cfms.common.message.BaseErrorMessage;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.time.DateUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@Slf4j
public final class DateUtil {

	public static final String YYYY_MM_DD = "yyyy-MM-dd";						// yyyy-MM-dd
	public static final String YYYYMMDDHHMMSS = "yyyyMMddHHmmss";				// yyyyMMddHHmmss
	public static final String LAST_DT = "99991231000000";						// 마지막 일시
	public static final String MILLISECOND = "yyyy-MM-dd HH:mm:ss.SSS";			// 밀리세컨드 포멧

	/**
	 * 지정한 패턴으로 현재날짜 반환
	 * @param pattern   날짜패턴
	 * @return          패턴에 맞는 현재일 반환
	 */
	public static String getTodayString(String pattern) {
		return LocalDateTime.now().format(DateTimeFormatter.ofPattern(pattern));
	}

	/**
	 * 현재일 반환
	 * @return	yyyy-MM-dd 형식으로 반환
	 */
	public static String getNowDate() {

		SimpleDateFormat sDate = new SimpleDateFormat(YYYY_MM_DD);
		return sDate.format(new Date());
	}

	/**
	 * 호출 시, 원하는 패턴 형식으로
	 * @param pattern	날짜패턴
	 * @return			현재일 반환
	 */
	public static String getNowDate(String pattern) {
		SimpleDateFormat sDate = new SimpleDateFormat(pattern);
		return sDate.format(new Date());
	}

	/**
	 * 마지막 일시 가져오기
	 * @return 9999-12-31 반환
	 */
	public static Date getLastDt() {

		try {
			return DateUtils.parseDate(LAST_DT, YYYYMMDDHHMMSS);
		} catch (ParseException e) {
			log.error("DateUtil : getLastDt fail : ", e);
			throw new BaseException(BaseErrorMessage.PROCESS_FAILED);
		}
	}

	/**
	 * 날짜를 문자로 변환
	 * @param date		일시
	 * @param pattern	패턴
	 * @return			주어진 일시를 해당 패턴으로 반환
	 */
	public static String getDateToString(Date date, String pattern) {
		SimpleDateFormat sDate = new SimpleDateFormat(pattern);
		return sDate.format(date);
	}

	/**
	 * 문자를 패턴 문자로 변환
	 * @param strDate	문자열 날짜
	 * @param pattern1	주어진 날짜의 패턴
	 * @param pattern2	변경하려는 패턴
	 * @return			변경패턴으로 날짜 반환
	 */
	public static String getStrDateToStr(String strDate, String pattern1, String pattern2) {
		Date date;
		try {
			date = new SimpleDateFormat(pattern1).parse(strDate);
		} catch (ParseException e) {
			log.error("Date Format Change Fail!!", e);
            throw new BaseException(BaseErrorMessage.WRONG_DATE);
		}
		return new SimpleDateFormat(pattern2).format(date);
	}

	/**
	 * 오늘날짜와 시간(초 까지)
	 * @return	년월일시분초밀리 반환
	 */
	public static String getTimeMillisecond() {
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat(MILLISECOND);
		return dayTime.format(new Date(time));
	}
}
