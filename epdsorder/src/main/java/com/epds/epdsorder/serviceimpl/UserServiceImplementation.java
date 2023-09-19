package com.epds.epdsorder.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epds.epdsorder.entity.User;
import com.epds.epdsorder.repository.UserRepository;
import com.epds.epdsorder.service.UserService;

@Service
public class UserServiceImplementation implements UserService {
	@Autowired
	private UserRepository userRepository;
	

	@Override
	public List<User> getAllUser() {
		
		return this.userRepository.findAll();
	}

}
