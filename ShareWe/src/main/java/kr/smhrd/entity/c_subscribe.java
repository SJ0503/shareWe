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
public class c_subscribe {
	
	// 구독 고유번호 
    private int sub_num;

    // 이메일 
    @NonNull private String email;

    // 기업명 
    @NonNull private String c_name;
    
}
