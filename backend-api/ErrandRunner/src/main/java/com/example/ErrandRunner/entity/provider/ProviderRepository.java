package com.example.ErrandRunner.entity.provider;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProviderRepository extends JpaRepository<Provider, Long>
{
    Optional<Provider> findByEmail(String email);
}