package kr.cfms.dashboard.service;

import kr.cfms.dashboard.mapper.TestInsertMapper;
import kr.cfms.dashboard.vo.InOrdVO;
import kr.cfms.dashboard.vo.JoinVO;
import kr.cfms.dashboard.vo.OutOrdVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class TestInsertService {

    private final TestInsertMapper testInsertMapper;

    public void insertInOrd(InOrdVO inOrdVO) {
        testInsertMapper.insertInOrd(inOrdVO);
    }

    public void insertOutOrd(OutOrdVO outOrdVO) {
        testInsertMapper.insertOutOrd(outOrdVO);
    }
    public void insertUser(JoinVO joinVO) {
        testInsertMapper.insertUser(joinVO);
    }
}
