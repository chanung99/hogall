package com.ho.gall.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ho.gall.common.PageBarFactory;
import com.ho.gall.common.PageBarFactory2;
import com.ho.gall.model.service.GalleryService;
import com.ho.gall.model.vo.Participating;
import com.ho.gall.model.vo.Product;
import com.ho.gall.model.vo.ProductComment;
import com.ho.gall.model.vo.ProductImage;
import com.ho.gall.model.vo.ProductVo;
import com.ho.gall.model.vo.WinningBid;

@Controller
public class GalleryController {

	private Logger logger = LoggerFactory.getLogger(GalleryController.class);
	
	@Autowired
	private GalleryService service;
	
	
	@RequestMapping("/gall/allGall.do")
	public String allGall() {
		
		return "/gall/allGallery";
	}
	
	@RequestMapping("/gall/gallList.do")
	public ModelAndView gallList(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage,String category) {
		int numPerPage= 20;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("category",category);
		map.put("cPage",cPage);
		map.put("numPerPage",numPerPage);
		ModelAndView mv=new ModelAndView();
		logger.info("카테고리확인"+category);
		System.out.println(category);
		List<Product> list=service.gallList(map);
		int totalList =service.gallCount(map);	
		
		mv.addObject("productCategory",category);
		mv.addObject("total",totalList);
		mv.addObject("list",list);
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalList, cPage, numPerPage, "/gall/gall/gallList.do?category="+category+"&"));
		mv.setViewName("/gall/ProductList");
		
		
		return mv;
	}
	
	@RequestMapping("/gall/enrollProduct")
	public ModelAndView enrollProduct(String category) {
		ModelAndView mv=new ModelAndView();
		logger.info("엔롤프로덕트 확인"+category);
		mv.addObject("category",category);
		mv.setViewName("/gall/enrollProduct");
		
		return mv;
	}

	
	@RequestMapping("/gall/enrollProductEnd.do")
	public String enrollProductEnd(@ModelAttribute ProductVo product,MultipartFile[] file,HttpServletRequest re,MultipartHttpServletRequest mtfRequest){
		
	
		 
		
		ModelAndView mv=new ModelAndView();
		
		
		
		String saveDir =re.getSession().getServletContext().getRealPath("/resources/product");
		File dir=new File(saveDir);
		
		MultipartFile mf = mtfRequest.getFile("upfile");


        String originFileName = mf.getOriginalFilename(); // 원본 파일 명
        long fileSize = mf.getSize(); // 파일 사이즈

        System.out.println("originFileName : " + originFileName);
        System.out.println("fileSize : " + fileSize);
        String jum=originFileName.substring(originFileName.indexOf("."));
        SimpleDateFormat sd=new SimpleDateFormat("yyyyMMddHHmmssSSS");
        int rndNum=(int)(Math.random()*10000);
        String reThumbnail="1"+sd.format(new Date(System.currentTimeMillis()))+"_"+rndNum+jum;
        String safeFile = saveDir +"/"+ System.currentTimeMillis() + originFileName;

        try {
            mf.transferTo(new File(saveDir + "/" +reThumbnail));
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		List<ProductImage> list=new ArrayList();
		
		for(MultipartFile f: file) {
			if(!f.isEmpty()) {
				String OriFileName=f.getOriginalFilename();
				String ext=OriFileName.substring(OriFileName.indexOf("."));
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
				
				String renamedFile=sdf.format(new Date(System.currentTimeMillis()))+"_"+rndNum+ext;
			try {
				f.transferTo(new File(saveDir+"/"+renamedFile));
			}catch(IOException e) {
				e.printStackTrace();
			}
				ProductImage pi= new ProductImage();
				pi.setOriFileName(OriFileName);
				pi.setReFileName(renamedFile);
				pi.setOrithumbnail(originFileName);
				pi.setRethumbnail(reThumbnail);
				list.add(pi);
			
			}
		}
		int result = service.insertProduct(product,list);
		
		mv.setViewName("/gall/");
		
		return "redirect:/";
	}
	
	/*@RequestMapping("/gall/readProduct")
	public ModelAndView readProduct(String productId,String img,String productName,String nowPrice,String priceStart,String name,String date,String time) {
		logger.info("상품정보확인 : "+productId+img+productName+nowPrice+priceStart+name+date+time);
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("productId",productId);
		mv.addObject("img",img);
		mv.addObject("productName",productName);
		mv.addObject("nowPrice",nowPrice);
		mv.addObject("priceStart",priceStart);
		mv.addObject("name",name);
		mv.addObject("date",date);
		mv.addObject("time",time);
		mv.setViewName("/gall/readProduct");
		
		
		return mv;
		
		
	}*/
	
	@RequestMapping("/gall/readProduct")
	public ModelAndView readProduct(int productId,String date,String time) {
		ModelAndView mv = new ModelAndView();
		Product p = new Product();
		p.setProductId(productId);
		
		int result=service.views(productId);
		int commentCount = service.commentCount(productId);
		
		List<ProductComment> comments = service.comments(productId);
		
		mv.addObject("commentCount",commentCount);
		mv.addObject("comment",comments);
		mv.addObject("product",service.readProduct(productId));
		mv.addObject("pCount",service.pCount(productId));
		mv.addObject("ppap",service.ppap(productId));
		logger.info("확인"+service.ppap(productId));
		mv.addObject("image",service.productImage(productId));
		mv.addObject("date",date);
		mv.addObject("time",time);
		mv.setViewName("/gall/readProduct");
		return mv;
	}
	
	@RequestMapping("/gall/winningBid")
	public String winningBid(WinningBid wb) {	
		ModelAndView mv=new ModelAndView();
		
		int productId=wb.getProductId();
		
		int result=service.winningBid(wb);
		
		int trigger=0;
		
		if(result>0) {
			trigger=service.productOff(productId);
		}
		
		mv.setViewName("/gall/");
		
		return "redirect:/";
	}
	
	@RequestMapping("/gall/bid")
	public String bid(Participating pp) {
		ModelAndView mv=new ModelAndView();
		int productId=pp.getProductId();
		
		System.out.println(productId);
		
		int result=service.bid(pp); 
		
		Participating ppap=service.maxPrice();
		String maxPrice=ppap.getCurPrice();
		
		Map<String,Object> map=new HashMap();
		map.put("productId",productId);
		map.put("maxPrice",maxPrice);
		
		int price=service.productPrice(map);
		return "redirect:/";
		
	}
	
	@RequestMapping("/popularProduct")
	public ModelAndView popularProduct(@RequestParam(value="cPage" , required=false , defaultValue="1")int cPage) {
		int numPerPage = 6;
		ModelAndView mv=new ModelAndView();
		Map<String,Object> map=new HashMap();
		map.put("cPage", cPage);
		map.put("numPerPage", numPerPage);
		
		List<Product> list=service.popularProduct(map);
		int totalList=service.productCount();
		mv.setViewName("/product/popularProduct");
		mv.addObject("list",list);
		mv.addObject("pageBar",PageBarFactory2.getPageBar(totalList,cPage,numPerPage,"/gall/popularProduct"));
		Map<String,Object> mapmap = new HashMap();
		
		mapmap.put("li", list);
		mapmap.put("bar",PageBarFactory2.getPageBar(totalList,cPage,numPerPage,"/gall/popularProduct"));
		return mv;
	}
	
	

	@RequestMapping(value="/gall/searchProduct",produces = "application/text; charset=utf8")
	@ResponseBody
	public ModelAndView searchProduct(String keyword,HttpServletResponse response) {
		
		ModelAndView mv=new ModelAndView();
		
		List<String> list=service.searchProduct(keyword);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		mv.addObject("list",list);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/*
	 * @RequestMapping(value="/gall/productCommentInsert.do") public String
	 * CommentInsert(ProductComment pc) { logger.info("ㅎㅎ;"+pc);
	 * 
	 * int result = service.CommentInsert(pc);
	 * 
	 * 
	 * 
	 * return "/gall/readProduct"; }
	 */
	
	@ResponseBody
	@RequestMapping(value="/gall/productCommentInsert.do")
	public List<ProductComment> CommentInsert(int productId,ProductComment pc) {
		logger.info("ㅎㅎ;"+pc);
		
		int result = service.CommentInsert(pc);
		
		List<ProductComment> comment = service.comments(productId);
		
		
		return comment;
	}
	
	@ResponseBody
	@RequestMapping(value="/gall/commentDelete")
	public int commentDelete(int commentNo) {
		
		int result = service.commentDelete(commentNo);
		
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/gall/commentAnswer")
	public List<ProductComment> commentAnswer(ProductComment pc){
		
		int result = service.commentAnswer(pc);
		
		List<ProductComment> list = service.cmtAnswer(pc);
		
		return list;
	}
}
