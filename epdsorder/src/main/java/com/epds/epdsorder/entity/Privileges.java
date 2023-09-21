package com.epds.epdsorder.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class Privileges {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	private String privileges_name;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "user_privileges_permissions",joinColumns = {
			@JoinColumn(columnDefinition = "privileges_id",referencedColumnName =  "id")
	},
	inverseJoinColumns= {
			@JoinColumn(columnDefinition = "user_id",referencedColumnName = "id")
	}
			)
	//@JsonManagedReference
	private Set<User> users;
	
}
