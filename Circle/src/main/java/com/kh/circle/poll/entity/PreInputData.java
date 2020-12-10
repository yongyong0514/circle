package com.kh.circle.poll.entity;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PreInputData {

	private Date startDate, endDate;
	private String title, joinMember, subDept, open, reply, editable;
	private String[] refer, attend;
	
}
