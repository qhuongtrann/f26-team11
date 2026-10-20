package com.example.ErrandRunner.provider;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class ProviderService {

    private final ProviderRepository repository;

    public ProviderService(ProviderRepository repository) 
    {
        this.repository = repository;
    }

    public List<Provider> findAll() 
    {
        return repository.findAll();
    }

    public Provider findById(Long id) 
    {
        return repository.findById(id)
                         .orElseThrow(() -> new ProviderNotFoundException(id));
    }

    public Provider create(Provider provider) 
    {
        return repository.save(provider);
    }

    public Provider update(Long id, Provider updated) 
    {

        Provider existing = findById(id);

        existing.setName(updated.getName());
        existing.setEmail(updated.getEmail());
        existing.setPassword(updated.getPassword());
        existing.setAge(updated.getAge());
        existing.setRating(updated.getRating());

        return repository.save(existing);
    }

    public void delete(Long id) 
    {

        findById(id);

        repository.deleteById(id);
    }
}