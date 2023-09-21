package com.epds.epdsorder.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.epds.epdsorder.entity.Privileges;

@Repository
public interface PrivilegesRepository extends JpaRepository<Privileges,Long>{
	

}
