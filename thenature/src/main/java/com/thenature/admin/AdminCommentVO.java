package com.thenature.admin;

import lombok.Data;

@Data
public class AdminCommentVO {
	private int idx;
	private String table_name;
	private int table_idx;
	private String post_title;
	private String comment;
	private int member_idx;
	private String writer;
	private String write_date;
}
