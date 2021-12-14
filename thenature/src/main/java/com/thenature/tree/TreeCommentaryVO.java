package com.thenature.tree;

import lombok.Data;

@Data
public class TreeCommentaryVO {
	private int idx;
	private int member_idx;
	private String writer;
	private String tree_name;
	private String tree_name_english;
	private String tree_name_scientific;
	private String tree_kind01;
	private String tree_kind02;
	private String tree_kind03;
	private String tree_kind04;
	private String tree_locate;
	private String tree_size;
	private String content;
	private String thumnail;
	private String add_date;
	private String tree_audio;
}
