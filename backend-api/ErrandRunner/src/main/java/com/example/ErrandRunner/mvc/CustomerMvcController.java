package com.example.ErrandRunner.mvc;

import com.example.ErrandRunner.entity.provider.ErrandTask;
import com.example.ErrandRunner.entity.provider.ErrandTaskService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CustomerMvcController {

    private final ErrandTaskService taskService;

    public CustomerMvcController(ErrandTaskService taskService) {
        this.taskService = taskService;
    }

    @GetMapping("/customer/request")
    public String customerRequestPage() {
        return "customer/customer-request";
    }

    @PostMapping("/tasks/create")
    public String createTask(
            @ModelAttribute ErrandTask task) {

        task.setStatus("OPEN");

        taskService.create(task);

        return "redirect:/provider/dashboard";
    }
}