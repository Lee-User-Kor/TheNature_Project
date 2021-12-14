package com.thenature.comment;

import lombok.Data;


//idx	int
//table_name	varchar(100)
//table_idx		int
//member_idx	int
//writer	varchar(20)
//content	varchar(100)
//write_date	date
@Data
public class CommentVO {
	
	private int idx;
	private String table_name;
	private int table_idx;
	private int member_idx;
	private String writer;
	private String content;
	private String write_date;
	
	// about admin_main
	private String bw_title;
	private int round;
	
	private String post_title;
}
