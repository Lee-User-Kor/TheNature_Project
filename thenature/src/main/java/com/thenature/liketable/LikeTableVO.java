package com.thenature.liketable;

import lombok.Data;


//idx	int
//member_idx	int
//table_name	varchar(50)
//table_idx	int
@Data
public class LikeTableVO {
	
	private int idx;
	private int member_idx;
	private String table_name;
	private int table_idx;
}
