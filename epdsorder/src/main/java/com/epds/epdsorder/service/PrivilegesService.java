package com.epds.epdsorder.service;

import com.epds.epdsorder.dto.PrivilegesDto;
import com.epds.epdsorder.entity.Privileges;

public interface PrivilegesService {
	boolean addPrivileges(PrivilegesDto privilegesDto);

	Privileges findPrivilegesByUserId(long userid);
}
