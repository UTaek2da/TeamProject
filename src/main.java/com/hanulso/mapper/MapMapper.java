package com.hanulso.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hanulso.domain.CorVO;
import com.hanulso.domain.ProductSearchConditionVO;
import com.hanulso.domain.ProductVO;

@Mapper
public interface MapMapper {
	
	public List<ProductVO> map_view_list();

	public ProductVO map_modal_view(int pno);
	
	public List<ProductVO> getList0(ProductSearchConditionVO pscvo);
	public List<CorVO> getList0TopCor(ProductSearchConditionVO pscvo);
	
	public List<CorVO> getList1(ProductSearchConditionVO pscvo);
	
}
