package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
@NoArgsConstructor
public class subscribe {
	// 회원 email
	private String email;

	// 무료 UP 횟수
	private int free_cnt;

	// 유료 UP 횟수
	private int paid_cnt;
	
}
