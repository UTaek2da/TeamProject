package com.hanulso.mapper;

import com.hanulso.domain.ProductVO;

public interface ProductMapper {

	public void product_insert(ProductVO pvo);
	
	public ProductVO product_view(int pno);
	
}
