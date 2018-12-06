package com.app.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.entity.FileTwo;
@Repository
public interface EmpRepository2 extends JpaRepository<FileTwo, Integer>
{
	
}
