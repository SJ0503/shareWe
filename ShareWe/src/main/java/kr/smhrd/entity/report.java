package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
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
public class report {

	// 신고 고유번호
    private int rp_num;

    // 신고자 이메일
    @NonNull
    private String email;
    
    // 신고 이메일
    @NonNull
    private String rp_email;

    // 누적횟수 
    private int rp_cnt;

    // 내용
    @NonNull
    private String rp_content;

    // 게시판 고유번호
    @NonNull private int b_num;
    
    // 리뷰 고유번호
    private int r_num;
	
    // 신고글 제목
    @NonNull
    private String r_title;
    
    
    
    public report(@NonNull String email, @NonNull String rp_email, @NonNull int b_num, @NonNull String r_title) {
		super();
		this.email = email;
		this.rp_email = rp_email;
		this.b_num = b_num;
		this.r_title = r_title;
	}



	@Builder
    private report(String email, int b_num){
        this.email = email;
        this.b_num = b_num;
    }
    
}
