package com.axsos.logandreg.repositories;

	import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.logandreg.models.Role;


	@Repository
	public interface RoleRepository extends CrudRepository<Role, Long>{

	     List<Role> findAll();

	      Role findByName(String username);

	}

