package com.epds.epdsorder.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class MenuIteam {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long menu_id;
	private String menu_name;
	private String menu_discription;
	private String menu_url;

}
