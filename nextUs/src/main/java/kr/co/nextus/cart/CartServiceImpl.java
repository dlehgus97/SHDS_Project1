package kr.co.nextus.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextus.buylist.BuyListVO;
import kr.co.nextus.selllist.SellListMapper;
import kr.co.nextus.selllist.SellListVO;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper mapper;
	
	@Override
	public int insert(int memberno, int sellno, int optionno) {
		int r = mapper.insert(memberno, sellno, optionno);
		return r;
	}
	
	@Override
	public int check(int memberno, int sellno, int optionno) {
		int r = mapper.check(memberno, sellno, optionno);
		return r;
	}
	
	@Override
	public List<CartVO> list(int memberno) {
		List<CartVO> data = mapper.list(memberno);
		return data;
	}

	@Override
    public int delete(int memberno, int sellno, int optionno) {
        return mapper.delete(memberno, sellno, optionno);
    }
	
	@Override
	public void delList(List<BuyListVO> vos) {
		mapper.delList(vos);
	}
}
