package com.thenature.video;

import lombok.Data;

@Data
public class TreeVideoVO {

	private int idx;
	private int member_idx;
	private String writer;
	private String title;
	private String video_path;
	private String add_date;
	private String content;
	private String thumbnail;
}
