package com.epds.epdsorder.serviceimpl;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epds.epdsorder.dto.PrivilegesDto;
import com.epds.epdsorder.entity.Privileges;
import com.epds.epdsorder.entity.User;
import com.epds.epdsorder.repository.PrivilegesRepository;
import com.epds.epdsorder.repository.UserRepository;
import com.epds.epdsorder.service.PrivilegesService;
@Service
public class PrivilegesServiceImpl implements PrivilegesService{
	@Autowired
	private PrivilegesRepository privilegesRepository;
	@Autowired
	private ModelMapper mapper;
	@Autowired
	private UserRepository userRepository;

	@Override
	public boolean addPrivileges(PrivilegesDto privilegesDto) {
		Set<User> usr=new HashSet<User>();
		Set<Long> users = privilegesDto.getUsers();
		for(Long u:users) {
			usr.add(this.userRepository.findById(u).get());	
		}
			
	Privileges privilegesEntity = this.mapper.map(privilegesDto, Privileges.class);
	privilegesEntity.setUsers(usr);
	Privileges save = this.privilegesRepository.save(privilegesEntity);
	return (save instanceof Privileges)?true:false;
	}

	@Override
	public Privileges findPrivilegesByUserId(long userid) {
	Privileges findById = this.privilegesRepository.findById(userid).get();
		return findById;
	}

}
