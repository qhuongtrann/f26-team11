package com.example.ErrandRunner.mvc;

import com.example.ErrandRunner.entity.provider.ErrandTaskService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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

    @GetMapping("/test")
    public String test() {
        return "test";
    }
}