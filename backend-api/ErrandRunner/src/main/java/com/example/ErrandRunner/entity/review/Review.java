package com.example.ErrandRunner.entity.review;

import com.example.ErrandRunner.entity.customer.Customer;
import com.example.ErrandRunner.entity.provider.ErrandTask;
import com.example.ErrandRunner.entity.provider.Provider;

import jakarta.persistence.*;

// One review per task: the unique constraint is the database-level backstop.
@Entity
@Table(name = "reviews",
       uniqueConstraints = @UniqueConstraint(columnNames = "task_id"))
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reviewId;

    private Integer stars;

    private String comment;

    @ManyToOne
    @JoinColumn(name = "task_id")
    private ErrandTask task;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "provider_id")
    private Provider provider;

    public Review() {
    }

    public Long getReviewId() { return reviewId; }

    public Integer getStars() { return stars; }
    public void setStars(Integer stars) { this.stars = stars; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public ErrandTask getTask() { return task; }
    public void setTask(ErrandTask task) { this.task = task; }

    public Customer getCustomer() { return customer; }
    public void setCustomer(Customer customer) { this.customer = customer; }

    public Provider getProvider() { return provider; }
    public void setProvider(Provider provider) { this.provider = provider; }
}
