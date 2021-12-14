package com.thenature.image;

import lombok.Data;

//idx	int
//table_name	varchar(50)
//table_idx	int
//img_path	varchar(255)
@Data
public class ImageVO {

	private int idx;
	private String table_name;
	private int table_idx;
	private String img_path;
}
