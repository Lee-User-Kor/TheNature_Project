package com.thenature.webtoon;

import lombok.Data;

//idx	int
//member_idx	int
//writer	varchar(20)
//title	varchar(255)
//content	varchar(255)
//thumbnail	varchar(255)
//add_date	date
@Data
public class WebtoonVO {

	private int idx;
	private int member_idx;
	private String writer;
	private String title;
	private String content;
	private String thumbnail;
	private String add_date;
	
	// about home like function
	private String isLike;
	// about like count function
	private int like_count;
	// about home cmt count
	private int cmt_count;
}
