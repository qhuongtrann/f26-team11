package com.example.ErrandRunner.entity.provider;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/providers")
public class ProviderController {

    private final ProviderService service;

    public ProviderController(ProviderService service) 
    {
        this.service = service;
    }

    @GetMapping
    public List<Provider> getAll() 
    {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public Provider getOne(@PathVariable Long id) 
    {
        return service.findById(id);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Provider create(@Valid @RequestBody Provider provider) 
    {
        return service.create(provider);
    }

    @PutMapping("/{id}")
    public Provider update(@PathVariable Long id, @Valid @RequestBody Provider provider) 
    {
        return service.update(id, provider);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) 
    {
        service.delete(id);
    }
}