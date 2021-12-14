package com.thenature.member;

import lombok.Data;

//idx	int
//member_idx	int
//point	int
//content	varchar(255)
//point_what	varchar(1)
//point_date	date

@Data
public class PointVO {
	private int idx;
	private int member_idx;
	private int point;
	private String content;
	private String point_what;
	private String point_date;
}
