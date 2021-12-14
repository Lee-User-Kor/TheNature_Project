package com.thenature.inquiry;

import lombok.Data;

@Data
public class QnaVO {
	private int idx;
	private int member_idx;
	private String writer;
	private String title;
	private String content;
	private String apply;
	private String apply_content;
	private String write_date;
}
