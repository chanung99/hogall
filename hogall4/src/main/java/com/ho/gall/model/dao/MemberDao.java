package com.ho.gall.model.dao;

import java.util.List;
import java.util.Map;

import com.ho.gall.model.vo.Member;
import com.ho.gall.model.vo.Message;
import com.ho.gall.model.vo.Participating;
import com.ho.gall.model.vo.WinningBid;

public interface MemberDao {
	
	public Member login(Member m);
	public int signup(Member m);
	public Member idCheck(String id);
	public Member nickNameCheck(String nickName);
	public String idFinder(Map<String, Object> map);
	public List<Participating> bid(String id);
	public List<WinningBid> winning(String id);
	public int bidCount(String id);
	public int winCount(String id);
	public Member selectPw(String id);
	public int inforChange(Member m);
	public List<Member> setting();
	public int memberOff(Map<String,Object> map);
	public int memberOn(String id);
	public String reason(String id);
	public int messageGo(Message ms);
	public List<Message> receiver(String id);
	public List<Message> caller(String id);

}
