package com.example.ErrandRunner;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.example.ErrandRunner")
public class ErrandRunnerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ErrandRunnerApplication.class, args);
    }

}