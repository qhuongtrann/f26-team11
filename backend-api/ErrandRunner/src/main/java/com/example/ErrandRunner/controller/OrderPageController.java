package com.example.ErrandRunner.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.ErrandRunner.entity.customer.Customer;
import com.example.ErrandRunner.entity.customer.CustomerNotFoundException;
import com.example.ErrandRunner.entity.customer.CustomerService;
import com.example.ErrandRunner.entity.provider.ErrandTask;
import com.example.ErrandRunner.entity.provider.ErrandTaskService;
import com.example.ErrandRunner.entity.review.Review;
import com.example.ErrandRunner.exception.InvalidRequestException;
import com.example.ErrandRunner.repository.ReviewRepository;

/** Customer pages: US-3 place an order, and the order list that prompts for US-2 reviews. */
@Controller
@RequestMapping("/orders")
public class OrderPageController {

    private final ErrandTaskService taskService;
    private final CustomerService customerService;
    private final ReviewRepository reviewRepository;

    public OrderPageController(ErrandTaskService taskService,
                               CustomerService customerService,
                               ReviewRepository reviewRepository) {
        this.taskService = taskService;
        this.customerService = customerService;
        this.reviewRepository = reviewRepository;
    }

    // ----- US-3: the order form ------------------------------------------

    @GetMapping("/new")
    public String showForm(@RequestParam(required = false) Long customerId, Model model) {
        model.addAttribute("customers", customerService.findAll());
        Map<String, Object> form = new HashMap<>();
        form.put("customerId", customerId == null ? "" : customerId.toString());
        model.addAttribute("form", form);
        return "customer/place-order";
    }

    @PostMapping
    public String placeOrder(@RequestParam(required = false) Long customerId,
                             @RequestParam(required = false) String title,
                             @RequestParam(required = false) String description,
                             @RequestParam(required = false) String category,
                             @RequestParam(required = false) String location,
                             @RequestParam(required = false) String fee,
                             Model model,
                             RedirectAttributes redirect) {
        try {
            taskService.placeOrder(customerId, title, description, category, location, fee);
            redirect.addFlashAttribute("success", "Your order was placed. A runner can now claim it.");
            return "redirect:/orders?customerId=" + customerId;
        } catch (InvalidRequestException | CustomerNotFoundException e) {
            // Show the message and keep what the user typed.
            Map<String, Object> form = new HashMap<>();
            form.put("customerId", customerId == null ? "" : customerId.toString());
            form.put("title", title == null ? "" : title);
            form.put("description", description == null ? "" : description);
            form.put("category", category == null ? "" : category);
            form.put("location", location == null ? "" : location);
            form.put("fee", fee == null ? "" : fee);
            model.addAttribute("form", form);
            model.addAttribute("customers", customerService.findAll());
            model.addAttribute("error", e.getMessage());
            return "customer/place-order";
        }
    }

    // ----- My orders (and the review prompt) ------------------------------

    @GetMapping
    public String myOrders(@RequestParam(required = false) Long customerId, Model model) {
        model.addAttribute("customers", customerService.findAll());

        if (customerId != null) {
            Customer customer = customerService.findById(customerId); // unknown id -> 404 page

            Map<Long, Review> reviewsByTask = new HashMap<>();
            for (Review r : reviewRepository.findByCustomer_CustomerId(customerId)) {
                if (r.getTask() != null) {
                    reviewsByTask.put(r.getTask().getTaskId(), r);
                }
            }

            List<OrderRow> rows = new ArrayList<>();
            int waiting = 0;
            for (ErrandTask t : taskService.findByCustomer(customerId)) {
                Review review = reviewsByTask.get(t.getTaskId());
                boolean completed = "Completed".equalsIgnoreCase(t.getStatus());
                boolean canReview = completed && t.getProvider() != null && review == null;
                if (canReview) waiting++;
                rows.add(new OrderRow(t, canReview, review == null ? null : review.getStars()));
            }

            model.addAttribute("customer", customer);
            model.addAttribute("rows", rows);
            model.addAttribute("waitingForReview", waiting);
        }
        return "customer/my-orders";
    }

    /** Getter-style class so FreeMarker can read it (it doesn't read record accessors reliably). */
    public static class OrderRow {
        private final ErrandTask task;
        private final boolean canReview;
        private final Integer stars;

        public OrderRow(ErrandTask task, boolean canReview, Integer stars) {
            this.task = task;
            this.canReview = canReview;
            this.stars = stars;
        }
        public ErrandTask getTask() { return task; }
        public boolean isCanReview() { return canReview; }
        public Integer getStars() { return stars; }
    }
}
