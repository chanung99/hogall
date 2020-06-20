package com.ho.gall.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ho.gall.model.vo.Participating;
import com.ho.gall.model.vo.Product;
import com.ho.gall.model.vo.ProductComment;
import com.ho.gall.model.vo.ProductImage;
import com.ho.gall.model.vo.ProductVo;
import com.ho.gall.model.vo.ReadProduct;
import com.ho.gall.model.vo.WinningBid;

@Repository
public class GalleryDaoImpl implements GalleryDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Product> gallList(Map<String,Object> map) {
		
		int cPage=(Integer) map.get("cPage");
		int numPerPage=(Integer) map.get("numPerPage");
		List<Product> list=session.selectList("product.sportsList",map,new RowBounds((cPage-1)*numPerPage, numPerPage));
		return list;
	}

	@Override
	public int gallCount(Map<String,Object> map) {
		
		int totalList=session.selectOne("product.productCount",map);
		
		return totalList;
	}

	@Override
	public int insertProduct(ProductVo p) {
		int result=session.insert("product.insertProduct",p);
		
		return result;
		
	}

	@Override
	public int insertProductImage(ProductImage pi) {
		int result=session.insert("product.insertProductImage",pi);
		return result;
	}

	@Override
	public ReadProduct readProduct(int productId) {
		ReadProduct product = session.selectOne("product.readProduct",productId);
		return product;
	}

	@Override
	public List<ProductImage> productImage(int productId) {
		List<ProductImage> list=session.selectList("product.productImage",productId);
		return list;
	}

	@Override
	public int winningBid(WinningBid wb) {
		int result=session.insert("product.winningBid",wb);
		return result;
	}

	@Override
	public int productOff(int productId) {
		int trigger = session.update("product.productOff",productId);
		return trigger;
	}

	@Override
	public int bid(Participating pp) {
		int result = session.insert("product.productBid",pp);
		return result;
	}

	@Override
	public int productPrice(Map<String,Object> map) {
		int price = session.update("product.priceInsert",map);
		return price;
	}

	@Override
	public Participating maxPrice() {
		Participating ppap = session.selectOne("product.maxPrice");
		return ppap;
	}

	@Override
	public List<Participating> ppap(int productId) {
		List<Participating> list=session.selectList("product.ppap",productId);
		return list;
	}

	@Override
	public int pCount(int productId) {
		int result=session.selectOne("product.pCount",productId);
		return result;
	}

	@Override
	public int views(int productId) {
		int result=session.update("product.views",productId);
		return result;
	}

	@Override
	public List<Product> popularProduct(Map<String, Object> map) {
		
		int cPage=(Integer) map.get("cPage");
		int numPerPage=(Integer) map.get("numPerPage");
		
		//List<Product> list = session.selectList("product.popularProduct",map,new RowBounds((cPage-1)*numPerPage, numPerPage));
		List<Product> list = session.selectList("product.popularProduct");
		return list;
	}

	@Override
	public int productCount() {
		return session.selectOne("product.itemCount");
	}

	@Override
	public List<String> searchProduct(String keyword) {
		List<String> list = session.selectList("product.searchProduct",keyword);
		return list;
	}

	@Override
	public int CommentInsert(ProductComment pc) {
		int result = session.insert("product.commentInsert",pc);
		return result;
	}

	@Override
	public List<ProductComment> comments(int productId) {
		List<ProductComment> comments = session.selectList("product.comments",productId);
		return comments;
	}

	@Override
	public int commentCount(int productId) {
		int commentCount = session.selectOne("product.commentCount",productId);
		return commentCount;
	}

	@Override
	public int commentDelete(int commentNo) {
		int result = session.delete("product.cmtDel",commentNo);
		return result;
	}

	@Override
	public int commentAnswer(ProductComment pc) {
		int result = session.insert("product.cmtAnswer",pc);
		return result;
	}

	@Override
	public List<ProductComment> cmtAnswer(ProductComment pc) {
		List<ProductComment> list = session.selectList("product.cmtAnswerList",pc);
		return list;
	}

	@Override
	public List<Participating> partic(String id) {
		List<Participating> list = session.selectList("product.partic",id);
		return list;
	}
	
	
	
	
	
	
	
	
	
}
