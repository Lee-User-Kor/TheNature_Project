package com.thenature.webtoon;

import lombok.Data;


//idx	int
//bw_title	varchar(255)
//title	varchar(255)
//thumbnail	varchar(255)
//img_path	varchar(255)
//view_count	int
//add_date	date
//round	int
//writer varchar(45)
//member_idx	int
@Data
public class WebtoonDetailVO {

	private int idx;
	private String bw_title;
	private String title;
	private String thumbnail;
	private String img_path;
	private int view_count;
	private String add_date;
	private int round;
	private String writer;
	private int member_idx;
	
	// about home cmt count
	private int cmt_count;
}
