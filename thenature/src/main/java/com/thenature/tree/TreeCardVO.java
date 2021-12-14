package com.thenature.tree;

import lombok.Data;

@Data
public class TreeCardVO {
	private int idx;
	private String category;
	private String name;
	private int level;
	private String img_path;
	private String add_date;
	private String register;
}
