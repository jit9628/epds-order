package com.epds.epdsorder.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RestController;

import com.epds.epdsorder.entity.MenuIteam;
@Repository
public interface MenuIteamRepository extends JpaRepository<MenuIteam, Long> {

}
