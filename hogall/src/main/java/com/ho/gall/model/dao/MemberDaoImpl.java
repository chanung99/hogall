package com.ho.gall.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ho.gall.model.vo.Member;
import com.ho.gall.model.vo.Participating;
import com.ho.gall.model.vo.WinningBid;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Member login(Member m) {
		Member result=session.selectOne("member.login",m);
		
		return result;
	}

	@Override
	public int signup(Member m) {
		int result=session.insert("member.signup",m);
		return result;
	}

	@Override
	public Member idCheck(String id) {
		Member result=session.selectOne("member.idCheck",id);
		return result;
	}

	@Override
	public Member nickNameCheck(String nickName) {
		Member result=session.selectOne("member.nickNameCheck",nickName);
		return result;
	}

	@Override
	public String idFinder(Map<String, Object> map) {
		String id=session.selectOne("member.idFinder",map);
		return id;
	}

	@Override
	public List<Participating> bid(String id) {
		List<Participating> list = session.selectList("member.myPageBid",id);
		return list;
	}

	@Override
	public List<WinningBid> winning(String id) {
		List<WinningBid> list = session.selectList("member.myPageWin",id);
		return list;
	}

	@Override
	public int bidCount(String id) {
		int bidCount = session.selectOne("member.bidCount",id);
		return bidCount;
	}

	@Override
	public int winCount(String id) {
		int winCount = session.selectOne("member.winCount",id);
		return winCount;
	}

	@Override
	public Member selectPw(String id) {
		Member m = session.selectOne("member.selectPw",id);
		return m;
	}

	@Override
	public int inforChange(Member m) {
		int result = session.update("member.inforChange",m);
		return result;
	}

	@Override
	public List<Member> setting() {
		List<Member> result = session.selectList("member.setting");
		return result;
	}

	@Override
	public int memberOff(Map<String,Object> map) {
		int result = session.update("member.memberOff",map);
		return result;
	}
	
	
	
	
	
	
	
}
