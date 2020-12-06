package com.kh.circle.post.contorller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.circle.login.entity.EmpInfo;
import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.entity.PostSearch;
import com.kh.circle.post.service.PostRepService;
import com.kh.circle.post.service.PostService;

@Controller
@RequestMapping("/reply")
public class PostRepController {

}
