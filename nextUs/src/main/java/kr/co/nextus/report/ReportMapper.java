package kr.co.nextus.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ReportMapper {
	
	int insert(ReportVO vo);
	public int count(ReportVO param);
	List<ReportVO> list(ReportVO vo);
	List<ReportVO> detail(int no);
	List<ReportVO> detailList(String email);
	
	int changeStatus(int m);
	
	
}
