package com.epds.epdsorder.dto;

import java.util.HashSet;
import java.util.Set;

import com.epds.epdsorder.entity.User;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserMenuPermissionDto {
	
	private long permission_id;
	private long permission_role_id;
	private long menu_id;
	private Set<Long> user_premission_id;

}
