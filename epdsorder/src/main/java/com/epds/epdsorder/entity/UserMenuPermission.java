package com.epds.epdsorder.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@Entity
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserMenuPermission {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long permission_id;
	private long permission_role_id;
	private long menu_id;	
}
