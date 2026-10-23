package com.example.ErrandRunner.entity.provider;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ErrandTaskRepository extends JpaRepository<ErrandTask, Long> 
{

    List<ErrandTask> findByCategoryIgnoreCase(String category);

    List<ErrandTask> findByStatusIgnoreCase(String status);
}