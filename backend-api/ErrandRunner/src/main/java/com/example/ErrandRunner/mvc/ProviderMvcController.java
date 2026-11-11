package com.example.ErrandRunner.mvc;

import com.example.ErrandRunner.entity.provider.ErrandTaskService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ProviderMvcController {

    private final ErrandTaskService taskService;

    public ProviderMvcController(ErrandTaskService taskService) {
        this.taskService = taskService;
    }

    @GetMapping("/provider/dashboard")
    public String dashboard(Model model) {

        model.addAttribute(
                "tasks",
                taskService.search(null, null));

        return "provider/runner-dashboard";
    }

    @GetMapping("/provider/task/{id}")
    public String taskDetails(
            @PathVariable Long id,
            Model model) {

        model.addAttribute(
                "task",
                taskService.findById(id));

        return "provider/task-details";
    }
}