package kr.co.nextus.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryMapper mapper;

	@Override
	public List<CategoryVO> list(CategoryVO vo) {
		
		return mapper.list(vo);
	}

}
