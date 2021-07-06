package kr.cfms.mapper;

import kr.cfms.vo.member.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


@Mapper
@Repository
public interface MemberMapper {

    MemberVo selectMemberByMidAndPassword(@Param("mid") String mid, @Param("pass") String pass);
    int selectMemberPassExpireCheck(@Param("mid") String mid);
    void updateMemberLastLoginDate(@Param("mid") String mid);

}
