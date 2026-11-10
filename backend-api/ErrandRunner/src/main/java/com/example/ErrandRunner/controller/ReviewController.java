package com.example.ErrandRunner.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.ErrandRunner.entity.provider.ErrandTask;
import com.example.ErrandRunner.entity.provider.ErrandTaskService;
import com.example.ErrandRunner.entity.provider.Provider;
import com.example.ErrandRunner.entity.provider.ProviderService;
import com.example.ErrandRunner.entity.review.Review;
import com.example.ErrandRunner.entity.review.ReviewService;
import com.example.ErrandRunner.exception.InvalidRequestException;
import com.example.ErrandRunner.repository.ReviewRepository;

/** US-2: customers leave a review (1-5 stars + optional comment); runners see theirs. */
@Controller
@RequestMapping("/reviews")
public class ReviewController {

    private final ReviewService reviewService;
    private final ReviewRepository reviewRepository;
    private final ErrandTaskService taskService;
    private final ProviderService providerService;

    public ReviewController(ReviewService reviewService,
                            ReviewRepository reviewRepository,
                            ErrandTaskService taskService,
                            ProviderService providerService) {
        this.reviewService = reviewService;
        this.reviewRepository = reviewRepository;
        this.taskService = taskService;
        this.providerService = providerService;
    }

    @GetMapping("/new")
    public String showReviewForm(@RequestParam Long taskId, Model model) {
        ErrandTask task = taskService.findById(taskId); // unknown id -> 404 page
        model.addAttribute("task", task);
        model.addAttribute("blocked", reviewService.problemWith(task));
        return "customer/review-form";
    }

    @PostMapping("/create")
    public String createReview(@RequestParam Long taskId,
                               @RequestParam(required = false) Integer stars,
                               @RequestParam(required = false) String comment,
                               Model model,
                               RedirectAttributes redirect) {
        try {
            Review saved = reviewService.create(taskId, stars, comment);
            redirect.addFlashAttribute("success", "Thanks! Your review was saved.");
            Long customerId = saved.getCustomer() == null ? null : saved.getCustomer().getCustomerId();
            return customerId == null ? "redirect:/orders" : "redirect:/orders?customerId=" + customerId;
        } catch (InvalidRequestException e) {
            ErrandTask task = taskService.findById(taskId);
            model.addAttribute("task", task);
            model.addAttribute("blocked", reviewService.problemWith(task));
            model.addAttribute("error", e.getMessage());
            model.addAttribute("stars", stars);
            model.addAttribute("comment", comment == null ? "" : comment);
            return "customer/review-form";
        }
    }

    /** What a runner has been told by customers (real data from the reviews table). */
    @GetMapping("/provider/{providerId}")
    public String runnerReviews(@PathVariable Long providerId, Model model) {
        Provider provider = providerService.findById(providerId); // unknown id -> 404 page
        List<Review> reviews = reviewRepository.findByProvider_ProviderIdOrderByReviewIdDesc(providerId);
        Double average = reviewRepository.averageStarsForProvider(providerId);
        model.addAttribute("provider", provider);
        model.addAttribute("reviews", reviews);
        if (average != null) {
            model.addAttribute("average", Math.round(average * 10.0) / 10.0);
        }
        return "provider/runner-reviews";
    }
}
