package kr.co.nextus.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.nextus.notice.NoticeVO;
import kr.co.nextus.report.ReportVO;

@Mapper
public interface ReportMapper {
	
    int insert(ReportVO vo);

}
