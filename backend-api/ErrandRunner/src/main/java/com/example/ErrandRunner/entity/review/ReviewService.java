package com.example.ErrandRunner.entity.review;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.ErrandRunner.entity.provider.ErrandTask;
import com.example.ErrandRunner.entity.provider.ErrandTaskRepository;
import com.example.ErrandRunner.entity.provider.Provider;
import com.example.ErrandRunner.entity.provider.ProviderRepository;
import com.example.ErrandRunner.entity.provider.TaskNotFoundException;
import com.example.ErrandRunner.exception.InvalidRequestException;
import com.example.ErrandRunner.repository.ReviewRepository;

@Service
public class ReviewService {

    private static final int MAX_COMMENT = 255; // default varchar(255) column

    private final ReviewRepository reviewRepository;
    private final ErrandTaskRepository taskRepository;
    private final ProviderRepository providerRepository;

    public ReviewService(ReviewRepository reviewRepository,
                         ErrandTaskRepository taskRepository,
                         ProviderRepository providerRepository) {
        this.reviewRepository = reviewRepository;
        this.taskRepository = taskRepository;
        this.providerRepository = providerRepository;
    }

    /** Returns why this task cannot be reviewed right now, or null if it can. */
    public String problemWith(ErrandTask task) {
        if (task.getStatus() == null || !task.getStatus().equalsIgnoreCase("Completed")) {
            return "This order isn't completed yet. You can leave a review once the runner finishes it.";
        }
        if (task.getProvider() == null) {
            return "This order has no runner attached, so there is nobody to review.";
        }
        if (reviewRepository.existsByTask_TaskId(task.getTaskId())) {
            return "You have already reviewed this order.";
        }
        return null;
    }

    @Transactional
    public Review create(Long taskId, Integer stars, String comment) {
        if (taskId == null) {
            throw new InvalidRequestException("Please choose which order you are reviewing.");
        }
        ErrandTask task = taskRepository.findById(taskId)
                .orElseThrow(() -> new TaskNotFoundException(taskId));

        String problem = problemWith(task);
        if (problem != null) {
            throw new InvalidRequestException(problem);
        }
        if (stars == null || stars < 1 || stars > 5) {
            throw new InvalidRequestException("Please choose a rating from 1 to 5 stars.");
        }

        String cleaned = comment == null ? null : comment.trim();
        if (cleaned != null && cleaned.isEmpty()) {
            cleaned = null; // commentary is optional
        }
        if (cleaned != null && cleaned.length() > MAX_COMMENT) {
            throw new InvalidRequestException(
                    "Comments can be at most " + MAX_COMMENT + " characters (you typed "
                    + cleaned.length() + ").");
        }

        Review review = new Review();
        review.setTask(task);
        review.setCustomer(task.getCustomer());
        review.setProvider(task.getProvider());
        review.setStars(stars);
        review.setComment(cleaned);
        Review saved = reviewRepository.save(review);

        // Keep the runner's overall rating current so runners "receive feedback".
        Provider provider = task.getProvider();
        Double avg = reviewRepository.averageStarsForProvider(provider.getProviderId());
        if (avg != null) {
            provider.setRating(Math.round(avg * 10.0) / 10.0);
            providerRepository.save(provider);
        }
        return saved;
    }
}
