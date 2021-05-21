package com.team4.localer.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.ShipDAO;
import com.team4.localer.vo.ShipVO;

@Service
public class ShipServiceImpl implements ShipService {
	@Inject
	ShipDAO shipDAO;

	@Override
	public int shipInsert(ShipVO shipVO) {
		return shipDAO.shipInsert(shipVO);
	}

}
