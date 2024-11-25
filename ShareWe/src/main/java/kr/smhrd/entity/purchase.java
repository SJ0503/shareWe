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
public class purchase {
	
	// 결제 고유번호 
    private int pc_num;

    // 게시글 고유번호 
    @NonNull private int c_num;

    // 이메일 
    @NonNull private String email;

    // 결제 상품 이름 
    @NonNull private String pc_name;

    // 결제 금액 
    @NonNull private int pc_price;

    // 카드 승인번호 
    @NonNull private int apply_num;

    // 결제 시간 
    private String pc_time;

    // 주문 상태 
    private int pc_state;
    
    // 수량
 	@NonNull private int pc_cnt;
 	
 	// 판매자 이메일 
    @NonNull private String pc_email;

	public purchase(@NonNull String email, @NonNull int pc_state, @NonNull String pc_email) {
		super();
		this.email = email;
		this.pc_state = pc_state;
		this.pc_email = pc_email;
	}
    
}
