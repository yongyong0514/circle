package com.kh.circle.project.repository;

import java.util.List;

import com.kh.circle.project.entity.Project;

public interface ProjectDao {

	List<Project> projMain(Project project);

	List<Project> projIssMain(String pro_code);

}
