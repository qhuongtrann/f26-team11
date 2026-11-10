package com.example.ErrandRunner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.ErrandRunner.entity.review.Review;
import com.example.ErrandRunner.repository.ReviewRepository;

@Controller
@RequestMapping("/reviews")
public class ReviewController {

    @Autowired
    private ReviewRepository reviewRepository;

    @GetMapping("/new")
    public String showReviewForm() {
        return "review";
    }

    @PostMapping("/create")
    public String createReview(Review review) {

        reviewRepository.save(review);

        return "redirect:/";
    }
}