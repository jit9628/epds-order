package com.epds.epdsorder.serviceimpl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epds.epdsorder.dto.UserMenuPermissionDto;
import com.epds.epdsorder.entity.UserMenuPermission;
import com.epds.epdsorder.repository.UserMenuPermissionRepository;
import com.epds.epdsorder.service.UserMenuPermissionService;

@Service
public class UserMenuPermissionServiceImpl implements UserMenuPermissionService {

	@Autowired
	private ModelMapper mapper;
	@Autowired
	private UserMenuPermissionRepository menuPermissionRepository;

	@Override
	public boolean addPermission(UserMenuPermissionDto userMenuPermissionDto) {
		UserMenuPermission userMenuPermission = this.mapper.map(userMenuPermissionDto, UserMenuPermission.class);
		UserMenuPermission save = this.menuPermissionRepository.save(userMenuPermission);
		System.out.println(save);
		return (save instanceof UserMenuPermission) ? true : false;

		/*
		 * if(save instanceof UserMenuPermission ) { return true;
		 * 
		 * }
		 */

	}

}
