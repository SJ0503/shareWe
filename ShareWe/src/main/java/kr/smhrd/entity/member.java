package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class member{
	
	// 회원 식별번호 
    private int type;

    // 이메일 
    private String email;

    // 비밀번호 
    private String pw;

    // 이름 
    private String name;

    // 닉네임 
    private String nick;

    // 주소 
    private String address;

    // 전화번호 
    private String tel;
	
    // 신고 누적 횟수
    private int rp_cnt;
}
