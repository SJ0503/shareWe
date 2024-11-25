package kr.smhrd.entity;

import java.io.File;

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
public class g_board {

	 // 게시글 고유번호 
    private int g_num;

    // 게시글 제목
    
    @NonNull private String g_title;
    
//     작성자 
    @NonNull private String g_writer;

    // 이메일 
    @NonNull private String email;

    // 이미지1 
    @NonNull private String g_img1;

//이미지2 
    @NonNull private String g_img2;

  // 이미지3 
    @NonNull private String g_img3;

    // 내용 
    @NonNull private String g_content;

    // 작성날짜 
    private String g_w_date;

    // 공동구매종료날짜 
    private String g_b_date;

    // 카테고리 
    @NonNull private String category;
    
    // 참여인원
    private int g_p_count;
    
    // 마감 여부
    private int g_end;

	public g_board(@NonNull String g_title, @NonNull String g_writer, @NonNull String email, @NonNull String g_img1,
			@NonNull String g_content, @NonNull String category) {
		super();
		this.g_title = g_title;
		this.g_writer = g_writer;
		this.email = email;
		this.g_img1 = g_img1;
		this.g_content = g_content;
		this.category = category;
	}

	public g_board(@NonNull String g_title, @NonNull String g_writer, @NonNull String email, @NonNull String g_img1,
			@NonNull String g_img2, @NonNull String g_content, @NonNull String category) {
		super();
		this.g_title = g_title;
		this.g_writer = g_writer;
		this.email = email;
		this.g_img1 = g_img1;
		this.g_img2 = g_img2;
		this.g_content = g_content;
		this.category = category;
	}

	public g_board(int g_num, @NonNull String g_title, @NonNull String g_writer, @NonNull String email,
			@NonNull String g_img1, @NonNull String g_img2, @NonNull String g_img3, @NonNull String g_content,
			@NonNull String category) {
		super();
		this.g_num = g_num;
		this.g_title = g_title;
		this.g_writer = g_writer;
		this.email = email;
		this.g_img1 = g_img1;
		this.g_img2 = g_img2;
		this.g_img3 = g_img3;
		this.g_content = g_content;
		this.category = category;
	}
	
	

}
