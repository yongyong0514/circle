package com.kh.circle.poll.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AttendedServey {
	private String  empNo;
	private List<AttendedServeyMember> attendedServeyMember;
}
