package kr.cfms.service.member;

import kr.cfms.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberPassExpireCheckService {

    private final MemberMapper memberMapper;


    public boolean memberPassExpireCheck(String mid) {
        return memberMapper.selectMemberPassExpireCheck(mid) > 0;
    }
}
