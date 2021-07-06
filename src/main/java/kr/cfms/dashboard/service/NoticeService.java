package kr.cfms.dashboard.service;

import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.cfms.common.exception.BaseException;
import kr.cfms.common.message.BaseErrorMessage;
import kr.cfms.dashboard.dto.NoticeDTO;
import kr.cfms.dashboard.dto.NoticeSearchDTO;
import kr.cfms.dashboard.mapper.NoticeMapper;
import kr.cfms.dashboard.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class NoticeService {

	private final NoticeMapper noticeMapper;
	

	/**
	 * 공지사항 리스트 조회
	 */
	public List<NoticeDTO> selectNoticeList(NoticeSearchDTO noticeSearchDTO) {
		return noticeMapper.selectNoticeList(noticeSearchDTO);
	}
	
	/**
	 * 공지사항 단건 조회
	 */
	public NoticeDTO selectNotice(NoticeSearchDTO noticeSearchDTO) {
		int updateResult = noticeMapper.updateReadCount(noticeSearchDTO);
		if (updateResult < 0) {
			throw new BaseException(BaseErrorMessage.UPDATE_FAILED);
		}

		return noticeMapper.selectNotice(noticeSearchDTO);
	}
	
	/**
	 * 이전글, 다음글 조회
	 */
	public List<NoticeDTO> preNextDoc(long id) {
		return noticeMapper.selectPreNextDoc(id);
	}
	
	/**
	 * 공지사항 등록
	 */
	public void insertNotice(NoticeVO noticeVO) {
		noticeMapper.insertNotice(noticeVO);
	}
	
	/**
	 * 공지사항 수정
	 */
	public void updateNotice(NoticeVO noticeVO) {
		noticeMapper.updateNotice(noticeVO);
	}
	
	/**
	 * 공지사항 삭제
	 */
	public void deleteNotice(NoticeVO noticeVO) {
		noticeMapper.deleteNotice(noticeVO);
	}
}
