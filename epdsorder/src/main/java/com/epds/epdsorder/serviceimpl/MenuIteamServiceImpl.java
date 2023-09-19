package com.epds.epdsorder.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epds.epdsorder.entity.MenuIteam;
import com.epds.epdsorder.repository.MenuIteamRepository;
import com.epds.epdsorder.service.MenuIteamService;

@Service
public class MenuIteamServiceImpl implements MenuIteamService {

	 @Autowired
	private MenuIteamRepository iteamRepository;
	
	@Override
	public boolean addMenuItem(MenuIteam menuIteam) {
		return(this.iteamRepository.save(menuIteam) instanceof MenuIteam)?true:false;
		
		//return false;
	}

}
