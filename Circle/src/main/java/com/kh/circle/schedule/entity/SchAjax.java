package com.kh.circle.schedule.entity;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SchAjax {
	private String id, title, SCH_UNIT_RPT;
	private String SCH_UNIT_ERPT;
	private String allDay;
	private String SCH_UNIT_CONT;
	private String SCH_UNIT_SEC;
	private String SCH_UNIT_STAT;
	private String SCH_UNIT_EMP;
	private String start, end,SCH_UNIT_WDAT,SCH_UNIT_MDAT;
	
}











