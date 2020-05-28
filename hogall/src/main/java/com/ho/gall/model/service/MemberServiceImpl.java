package com.ho.gall.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ho.gall.model.dao.MemberDao;
import com.ho.gall.model.vo.Member;
import com.ho.gall.model.vo.Participating;
import com.ho.gall.model.vo.WinningBid;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;

	@Override
	public Member login(Member m) {
		Member result=dao.login(m);
		return result;
	}

	@Override
	public int signup(Member m) {
		int result=dao.signup(m);
		return result;
	}

	@Override
	public Member idCheck(String id) {
		Member result=dao.idCheck(id);
		return result;
	}

	@Override
	public Member nickNameCheck(String nickName) {
		Member result=dao.nickNameCheck(nickName);
		return result;
	}

	@Override
	public String idFinder(Map<String, Object> map) {
		String id=dao.idFinder(map);
		return id;
	}

	@Override
	public List<Participating> bid(String id) {
		List<Participating> list = dao.bid(id);
		return list;
	}

	@Override
	public List<WinningBid> winning(String id) {
		List<WinningBid> list = dao.winning(id);
		return list;
	}

	@Override
	public int bidCount(String id) {
		int bidCount = dao.bidCount(id);
		return bidCount;
	}

	@Override
	public int winCount(String id) {
		int winCount = dao.winCount(id);
		return winCount;
	}

	@Override
	public Member selectPw(String id) {
		Member m = dao.selectPw(id);
		return m;
	}

	@Override
	public int inforChange(Member m) {
		int result = dao.inforChange(m);
		return result;
	}

	@Override
	public List<Member> setting() {
		
		List<Member> result = dao.setting();
		
		return result;
	}

	@Override
	public int memberOff(Map<String,Object> map) {
		
		int result = dao.memberOff(map);
		return result;
	}
	
	
	
	
	
	

}
