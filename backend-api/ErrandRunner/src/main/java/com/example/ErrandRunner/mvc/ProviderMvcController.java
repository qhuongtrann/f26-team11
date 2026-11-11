package com.example.ErrandRunner.mvc;

import com.example.ErrandRunner.entity.provider.ErrandTask;
import com.example.ErrandRunner.entity.provider.ErrandTaskService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

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

    @PostMapping("/provider/task/{id}/claim")
    public String claimTask(
            @PathVariable Long id) {

        taskService.claimTask(id, 1L);

        return "redirect:/provider/dashboard";
    }

    @GetMapping("/provider/claimed")
    public String claimedTasks(Model model) {

        model.addAttribute(
                "tasks",
                taskService.search(null, "CLAIMED"));

        return "provider/my-claimed-tasks";
    }

    @PostMapping("/provider/task/{id}/complete")
    public String completeTask(
            @PathVariable Long id) {

        ErrandTask task = taskService.findById(id);

        task.setStatus("COMPLETED");

        taskService.update(id, task);

        return "redirect:/provider/claimed";
    }
}