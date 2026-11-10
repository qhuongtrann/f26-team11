package com.example.ErrandRunner.entity.customer;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;

import com.example.ErrandRunner.entity.provider.ErrandTask;

@Entity
@Table(name = "customers")
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long customerId;

    @NotBlank
    private String name;

    @NotBlank
    private String email;

    @NotBlank
    private String password;

    private String address;

    @JsonIgnore // avoids infinite JSON recursion: Customer -> tasks -> customer -> ...
    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
    private List<ErrandTask> tasks = new ArrayList<>();

    public Customer() {
    }

    public Long getCustomerId() {
        return customerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public List<ErrandTask> getTasks() {
    return tasks;
}

    public void setTasks(List<ErrandTask> tasks) {
    this.tasks = tasks;
}
}