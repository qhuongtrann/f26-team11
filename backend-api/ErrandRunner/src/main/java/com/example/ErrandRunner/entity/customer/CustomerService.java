package com.example.ErrandRunner.entity.customer;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CustomerService {

    private final CustomerRepository repository;

    public CustomerService(CustomerRepository repository) {
        this.repository = repository;
    }

    public List<Customer> findAll() {
        return repository.findAll();
    }

    public Customer findById(Long id) {
        return repository.findById(id)
                .orElseThrow(() ->
                        new CustomerNotFoundException(id));
    }

    public Customer create(Customer customer) {
        return repository.save(customer);
    }

    public Customer update(Long id, Customer updated) {

        Customer existing = findById(id);

        existing.setName(updated.getName());
        existing.setEmail(updated.getEmail());
        existing.setPassword(updated.getPassword());
        existing.setAddress(updated.getAddress());

        return repository.save(existing);
    }

    public void delete(Long id) {

        findById(id);

        repository.deleteById(id);
    }
}