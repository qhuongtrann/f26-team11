package com.example.ErrandRunner.entity.provider;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "providers")
public class Provider {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long providerId;

    @NotBlank
    private String name;

    @NotBlank
    private String email;

    @NotBlank
    private String password;

    private Integer age;

    private Double rating;

    public Provider() 
    {

    }

    public Long getProviderId() 
    {
        return providerId;
    }

    public String getName() 
    {
        return name;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getEmail() 
    {
        return email;
    }

    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getPassword() 
    {
        return password;
    }

    public void setPassword(String password) 
    {
        this.password = password;
    }

    public Integer getAge() 
    {
        return age;
    }

    public void setAge(Integer age) 
    {
        this.age = age;
    }

    public Double getRating() 
    {
        return rating;
    }

    public void setRating(Double rating) 
    {
        this.rating = rating;
    }
}