package com.ho.gall.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ho.gall.common.exception.BoardException;
import com.ho.gall.model.dao.GalleryDao;
import com.ho.gall.model.vo.Participating;
import com.ho.gall.model.vo.Product;
import com.ho.gall.model.vo.ProductComment;
import com.ho.gall.model.vo.ProductImage;
import com.ho.gall.model.vo.ProductVo;
import com.ho.gall.model.vo.ReadProduct;
import com.ho.gall.model.vo.WinningBid;

@Service
public class GalleryServiceImpl implements GalleryService {

	

	@Autowired
	private GalleryDao dao;

	@Override
	public List<Product> gallList(Map<String,Object> map) {
		
		List<Product> list=dao.gallList(map);
		
		return list;
	}

	@Override
	public int gallCount(Map<String,Object> map) {
		int totalList=dao.gallCount(map);
		return totalList;
	}

	@Override
	public int insertProduct(ProductVo p, List<ProductImage> list) {
		
		int result = 0;
		result = dao.insertProduct(p);
		if(result == 0 ) throw new BoardException();
		if(list.size() > 0 )
		{
			for(ProductImage pi : list)
			{
				pi.setProductId(p.getProductId());
				result = dao.insertProductImage(pi);
				if(result == 0) throw new BoardException();
			}
		}
		return result;
	}

	@Override
	public ReadProduct readProduct(int productId) {
		ReadProduct product = dao.readProduct(productId);
		
		return product;
	}

	@Override
	public List<ProductImage> productImage(int productId) {
		List<ProductImage> list=dao.productImage(productId);
		
		return list;
	}

	@Override
	public int winningBid(WinningBid wb) {
		int result = dao.winningBid(wb);
		return result;
	}

	@Override
	public int productOff(int productId) {
		int trigger = dao.productOff(productId);
		return trigger;
	}

	@Override
	public int bid(Participating pp) {
		int result=dao.bid(pp);
		return result;
	}

	@Override
	public int productPrice(Map<String,Object> map) {
		int price=dao.productPrice(map);
		return price;
	}

	@Override
	public Participating maxPrice() {
		Participating ppap=dao.maxPrice();
		return ppap;
	}
		
	@Override
	public int pCount(int productId) {
		int result=dao.pCount(productId);
		return result;
	}

	@Override
	public List<Participating> ppap(int productId) {
		List<Participating> list=dao.ppap(productId);
		return list;
	}

	@Override
	public int views(int productId) {
		int result=dao.views(productId);
		return result;
	}

	@Override
	public List<Product> popularProduct(Map<String, Object> map) {
		List<Product> list=dao.popularProduct(map);
		return list;
	}

	@Override
	public int productCount() {
		int result=dao.productCount();
		return result;
	}

	@Override
	public List<String> searchProduct(String keyword) {
		List<String> list = dao.searchProduct(keyword);
		return list;
	}

	@Override
	public int CommentInsert(ProductComment pc) {
		int result = dao.CommentInsert(pc);
		return result;
	}

	@Override
	public List<ProductComment> comments(int productId) {
		List<ProductComment> comments = dao.comments(productId);
		return comments;
	}

	@Override
	public int commentCount(int productId) {
		int commentCount = dao.commentCount(productId);
		return commentCount;
	}

	@Override
	public int commentDelete(int commentNo) {
		int result = dao.commentDelete(commentNo);
		return result;
	}

	@Override
	public int commentAnswer(ProductComment pc) {
		int result = dao.commentAnswer(pc);
		return result;
	}

	@Override
	public List<ProductComment> cmtAnswer(ProductComment pc) {
		List<ProductComment> list = dao.cmtAnswer(pc);
		return list;
	}
	
	@Override
	public List<Participating> partic(String id) {
		List<Participating> list = dao.partic(id);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
