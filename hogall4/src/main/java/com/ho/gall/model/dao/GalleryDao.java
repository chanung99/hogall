package com.ho.gall.model.dao;

import java.util.List;
import java.util.Map;

import com.ho.gall.model.vo.Participating;
import com.ho.gall.model.vo.Product;
import com.ho.gall.model.vo.ProductComment;
import com.ho.gall.model.vo.ProductImage;
import com.ho.gall.model.vo.ProductVo;
import com.ho.gall.model.vo.ReadProduct;
import com.ho.gall.model.vo.WinningBid;

public interface GalleryDao {
	
	public List<Product> gallList(Map<String,Object> map);
	public int gallCount(Map<String,Object> map);
	public int insertProduct(ProductVo p);
	public int insertProductImage(ProductImage pi);
	public ReadProduct readProduct(int productId);
	public List<ProductImage> productImage(int productId);
	public int winningBid(WinningBid wb);
	public int productOff(int productId);
	public int bid(Participating pp);
	public int productPrice(Map<String,Object> map);
	public Participating maxPrice();
	public List<Participating> ppap(int productId);
	public int pCount(int productId);
	public int views(int productId);
	public List<Product> popularProduct(Map<String, Object> map);
	public int productCount();
	public List<String> searchProduct(String keyword);
	public int CommentInsert(ProductComment pc);
	public List<ProductComment> comments(int productId);
	public int commentCount(int productId);
	public int commentDelete(int commentNo);
	public int commentAnswer(ProductComment pc);
	public List<ProductComment> cmtAnswer(ProductComment pc);
	public List<Participating> partic(String id);
}
