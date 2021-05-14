package com.team4.localer.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.SellerDAO;

@Service
public class SellerImpl implements SellerService {
	@Inject
	SellerDAO sellerDAO;
	
	
}
