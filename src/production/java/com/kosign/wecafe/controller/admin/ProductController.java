package com.kosign.wecafe.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.services.CategoryService;
import com.kosign.wecafe.services.ProductService;

@RestController
public class ProductController {
	
	@Inject
	private ProductService productService;
	
	@Inject
	private CategoryService categoryService;
	
	
	@RequestMapping(value="/admin/products", method=RequestMethod.GET)
	public String listAllProducts(Map<String, Object> model){
		model.put("products", productService.getAllProducts());
		return "admin/productlist";
	}
	
	@RequestMapping(value="/admin/products/rest", method=RequestMethod.GET, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public  @ResponseBody List<Product> getAllProducts(){
		return productService.getAllProducts();
	}
	
	@RequestMapping(value="/admin/productadd", method=RequestMethod.GET)
	public String productadd(Map<String, Object> model){
		model.put("categories", categoryService.getAllCategories());
		return "admin/productadd";
	}	
	
	/*@RequestMapping(value="/admin/productlists", method=RequestMethod.GET)
	public  @ResponseBody List<Product> getAllProductsJSON(){
		return productService.getAllProducts();
	}*/

	@RequestMapping(value="/admin/productlists", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getAllProduct(){
		Map<String, Object> m = new HashMap<>();
		try{
			m.put("item", productService.getAllProducts());
			return m;
		}catch(Exception ex){
			m.put("error", ex.getMessage());
			return m;
		}
	}
	
	@RequestMapping(value="/admin/product/add", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public  @ResponseBody boolean addNewProduct(@RequestBody Product product){
		
		/*List<Product> products = new ArrayList<>();
		if(session.getAttribute("products")!=null){
			products = (ArrayList<Product>)session.getAttribute("products");
		}
		products.add(product);*/		
		
		//System.out.println(product.getProductName());
		return productService.addNewProduct(product);
		//return ((Product)session.getAttribute("product")).getProductName();
		
	}
	
	@RequestMapping(value="/admin/product/{id}", method=RequestMethod.GET)
	public String updateProduct(@PathVariable("id") Long id, Map<String, Object> model){
		Product product = productService.findProductById(id);
		model.put("product", product);
		model.put("categories", categoryService.getAllCategories());
		return "admin/productupdate";
	}
		
	@RequestMapping(value="/admin/product/update", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody boolean updateProduct(@RequestBody Product product){
		return productService.updateProduct(product);
	}
	
	@RequestMapping(value="/admin/product/delete/{id}", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody boolean deleteProduct(@RequestBody @PathVariable("id") Long id){
		System.out.println("DELETE ID="+ id);
		return productService.deleteProduct(id);
	}

}
