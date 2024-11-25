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
public class c_favorite {

	// 찜 식별자 
    private int c_f_num;

    // 이메일 
    @NonNull private String email;

    // 게시글 고유번호 
    @NonNull private int c_num;

    // 찜 날짜 
    private String c_f_date;
	
}
