package kr.cfms.dashboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kr.cfms.dashboard.dto.NoticeDTO;
import kr.cfms.dashboard.dto.NoticeSearchDTO;
import kr.cfms.dashboard.vo.NoticeVO;

@Mapper
@Repository
public interface NoticeMapper {
	
	List<NoticeDTO> selectNoticeList(@Param("noticeSearchDTO") NoticeSearchDTO noticeSearchDTO);
	NoticeDTO selectNotice(@Param("noticeSearchDTO") NoticeSearchDTO noticeSearchDTO);
	int updateReadCount(@Param("noticeSearchDTO") NoticeSearchDTO noticeSearchDTO);
	List<NoticeDTO> selectPreNextDoc(@Param("id") long id);
	
	Integer insertNotice(@Param("noticeVO") NoticeVO noticeVO);
	Integer updateNotice(@Param("noticeVO") NoticeVO noticeVO);
	Integer deleteNotice(@Param("noticeVO") NoticeVO noticeVO);
	
}
