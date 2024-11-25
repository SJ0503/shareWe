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
public class review {

	// 리뷰 고유번호 
    private int r_num;

    // 이메일 
    @NonNull private String email;

    // 평점 
    @NonNull private double r_score;

    // 내용 
    @NonNull private String r_content;

    // 게시글 고유번호 
    @NonNull private int c_num;
    
    // 리뷰 작성 날짜
    private String r_date;
	
}
