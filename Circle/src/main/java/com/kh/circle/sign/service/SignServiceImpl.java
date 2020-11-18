package com.kh.circle.sign.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.circle.sign.repository.SignDao;
import com.kh.circle.sign.vo.SignWrite;

@Service
public class SignServiceImpl implements SignService {

	@Inject
	private SignDao signDao;
	
	@Override
	public void write(SignWrite signWrite) throws Exception {
		signDao.signWrite(signWrite);
	}

}
