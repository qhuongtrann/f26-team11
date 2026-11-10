package com.example.ErrandRunner.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.ErrandRunner.entity.review.Review;

public interface ReviewRepository extends JpaRepository<Review, Long> {

}