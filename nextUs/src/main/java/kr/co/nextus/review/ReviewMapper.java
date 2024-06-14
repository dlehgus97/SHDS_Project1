package kr.co.nextus.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.nextus.notice.NoticeVO;
import kr.co.nextus.review.ReviewVO;

@Mapper
public interface ReviewMapper {
    List<ReviewVO> list(ReviewVO vo);
    int count(ReviewVO vo);
    int insert(ReviewVO vo);
    int update(ReviewVO vo);
    int delete(@Param("reviewno") int reviewno);
}
