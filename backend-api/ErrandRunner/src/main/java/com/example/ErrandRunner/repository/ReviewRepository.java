package com.example.ErrandRunner.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.ErrandRunner.entity.review.Review;

public interface ReviewRepository extends JpaRepository<Review, Long> {

    boolean existsByTask_TaskId(Long taskId);

    List<Review> findByCustomer_CustomerId(Long customerId);

    List<Review> findByProvider_ProviderIdOrderByReviewIdDesc(Long providerId);

    @Query("select avg(r.stars) from Review r where r.provider.providerId = :providerId")
    Double averageStarsForProvider(@Param("providerId") Long providerId);
}
