package com.team4.localer.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.MemberDAO;

@Service
public class MemberServiceImp implements MemberService {
	@Inject
	MemberDAO dao;
}