package com.example.cus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.cus.dto.OffCusDetailDto;
import com.example.cus.dto.OffCusListDto;
import com.example.cus.mapper.OffCusMapper;
import com.example.cus.vo.Customer;
import com.example.cus.web.request.OffCusModifyForm;
import com.example.cus.web.request.OffCusRegisterForm;
import com.example.utils.Pagination;

@Service
@Transactional
public class OffCusService {

	@Autowired
	private OffCusMapper customerMapper;
	
	// 고객등록
	public void registerCustomer(OffCusRegisterForm customerRegisterForm) {
		
		Customer customer = new Customer();

		BeanUtils.copyProperties(customerRegisterForm, customer);
		
		String id = UUID.randomUUID().toString();
		String type = "off";
		String deleted = "N";
		customer.setId(id);
		customer.setType(type);
		customer.setDeleted(deleted);
		
		customerMapper.insertCustomer(customer);
	}

	// 고객목록&페이징처리
	public Map<String, Object> getCustomers(int page, String keyword) {
		Map<String, Object> param = new HashMap<String, Object>();
		if (!keyword.isBlank()) {
			param.put("keyword", keyword);
		}

		int totalRows = customerMapper.getTotalRows(param);
		Pagination pagination = new Pagination(page, totalRows);
		
		param.put("begin", pagination.getBegin());
		param.put("end", pagination.getEnd());
		
		List<OffCusListDto> customers = customerMapper.getCustomers(param);
		
		Map<String, Object> result = new HashMap<>();
		result.put("customers", customers);
		result.put("pagination", pagination);
		
		return result;
	}

	// 게시글 상세정보
	public OffCusDetailDto getCustomerDetail(String customerId) {
		OffCusDetailDto cusDetailDto = customerMapper.getCustomerDetailById(customerId);
		
		return cusDetailDto;
	}

	// 고객수정
	public Customer updateCustomer(OffCusModifyForm customerModifyForm) {
		Customer customer = customerMapper.getCustomerById(customerModifyForm.getId());
		BeanUtils.copyProperties(customerModifyForm, customer);
		
		customerMapper.updateCustomer(customer);
		
		return customer;
	}

	// 고객삭제
	public void deleteCustomers(List<String> custIds) {
		for (String custId : custIds) {
			Customer customer = customerMapper.getCustomerById(custId);
			customer.setDeleted("Y");
			customerMapper.updateCustomer(customer);
		}
	}

}
