package com.epds.epdsorder.dto;

import java.util.Set;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrivilegesDto {
	private Long id;

    private String privileges_name;
    private Set<Long> users;
}
