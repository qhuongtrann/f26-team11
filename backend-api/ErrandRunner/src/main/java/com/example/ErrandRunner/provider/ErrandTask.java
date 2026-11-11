package com.example.ErrandRunner.provider;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "tasks")
public class ErrandTask {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long taskId;

    @NotBlank
    private String title;

    @NotBlank
    private String description;

    private String category;

    private String location;

    private Double fee;

    private String status;

    private String proofNotes;

    @ManyToOne
    @JoinColumn(name = "provider_id")
    private Provider provider;

    public ErrandTask() 
    {

    }

    public Long getTaskId() 
    {
        return taskId;
    }

    public String getTitle() 
    {
        return title;
    }

    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getDescription() 
    {
        return description;
    }

    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getCategory() 
    {
        return category;
    }

    public void setCategory(String category) 
    {
        this.category = category;
    }

    public String getLocation() 
    {
        return location;
    }

    public void setLocation(String location) 
    {
        this.location = location;
    }


    public Double getFee() 
    {
        return fee;
    }

    public void setFee(Double fee) 
    {
        this.fee = fee;
    }

    public String getStatus() 
    {
        return status;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getProofNotes() 
    {
        return proofNotes;
    }

    public void setProofNotes(String proofNotes) 
    {
        this.proofNotes = proofNotes;
    }

    public Provider getProvider() 
    {
        return provider;
    }

    public void setProvider(Provider provider) 
    {
        this.provider = provider;
    }
}