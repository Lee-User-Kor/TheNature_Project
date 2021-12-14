package com.thenature.member;

import lombok.Data;

//idx	int
//id	varchar(16)
//pw	varchar(255)
//name	varchar(20)
//tel	varchar(20)
//email	varchar(100)
//post	varchar(10)
//address	varchar(255)
//address_detail	varchar(255)
//grade	int
//join_date	date
//exit_date	date
//exit	varchar(1)
//agree_sns	varchar(1)
//agree_email	varchar(1)

@Data
public class MemberVO {

	private int idx;
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String email;
	private String post;
	private String address;
	private String address_detail;
	private int grade;
	private String join_date;
	private String exit_date;
	private String exit;
	private String agree_sns;
	private String agree_email;
	private String is_producer;
	
	//join
	private String email_first;
	private String email_second;
	
	//grade > 1 login time
	private String login_time;
}
