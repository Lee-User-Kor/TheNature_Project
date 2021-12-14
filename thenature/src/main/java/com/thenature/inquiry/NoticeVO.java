package com.thenature.inquiry;

import lombok.Data;

//idx	int
//member_idx	int
//writer	varchar(20)
//title	varchar(255)
//content	varchar(1000)
//view_count	int
//write_date	date

@Data
public class NoticeVO {
	private int idx;
	private int member_idx;
	private String writer;
	private String title;
	private String content;
	private int view_count;
	private String write_date;
}
