package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
@NoArgsConstructor
@RequiredArgsConstructor
// 결제 내역 
public class payment {

	// 결제 고유번호
	private int p_num;

	// 이메일
	@NonNull private String email;

	// 결제 상품 이름
	@NonNull private String p_name;

	// 결제 금액
	@NonNull private int p_amount;

	// 카드 승인번호
	@NonNull private int apply_num;
	
	// 구독권 횟수
	@NonNull private int p_cnt;
}
