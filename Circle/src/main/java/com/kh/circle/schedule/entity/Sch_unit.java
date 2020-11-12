package com.kh.circle.schedule.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Sch_unit {
	private String code, name, sdat, edat, rpt, rpto, erpt, aday, cont, sec, wdat, mdat, stat, wrtr;
	
}
