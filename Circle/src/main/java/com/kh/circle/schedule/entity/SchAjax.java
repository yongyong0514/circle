package com.kh.circle.schedule.entity;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class SchAjax {
	private String id; 
	private String title;
	private String repeat;
	private String endRepeat;
	private String allDay;
	private String content;
	private String security;
	private String stat;
	private String writer;
	private String start;
	private String end;
	private String writeDate;
	private String modifyDate;
	private String backgroundColor;
	private String writerName;
	
}











