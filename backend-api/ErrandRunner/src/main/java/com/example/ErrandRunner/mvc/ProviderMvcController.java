package com.example.ErrandRunner.mvc;

import com.example.ErrandRunner.entity.provider.ErrandTask;
import com.example.ErrandRunner.entity.provider.ErrandTaskService;
import com.example.ErrandRunner.entity.provider.Provider;
import com.example.ErrandRunner.entity.provider.ProviderService;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProviderMvcController {

    private final ErrandTaskService taskService;
    private final ProviderService providerService;

    public ProviderMvcController(
            ErrandTaskService taskService,
            ProviderService providerService) {

        this.taskService = taskService;
        this.providerService = providerService;
    }

    @GetMapping("/provider/register")
    public String registerPage(Model model) {

        model.addAttribute("provider", new Provider());

        return "provider/runner-register";
    }

    @PostMapping("/provider/register")
    public String registerProvider(
            @ModelAttribute Provider provider,
            HttpSession session) {

        provider.setRating(0.0);

        Provider savedProvider =
                providerService.create(provider);

        session.setAttribute(
                "providerId",
                savedProvider.getProviderId());

        return "redirect:/provider/dashboard";
    }

    @GetMapping("/provider/dashboard")
    public String dashboard(
            @RequestParam(required = false) String status,
            Model model) {

        model.addAttribute(
                "tasks",
                taskService.search(null, status));

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
            @PathVariable Long id,
            HttpSession session) {

        Long providerId =
                (Long) session.getAttribute("providerId");

        if (providerId == null) {
            return "redirect:/provider/register";
        }

        taskService.claimTask(
                id,
                providerId);

        return "redirect:/provider/claimed";
    }

    @GetMapping("/provider/claimed")
    public String claimedTasks(
            HttpSession session,
            Model model) {

        Long providerId =
                (Long) session.getAttribute("providerId");

        if (providerId == null) {
            return "redirect:/provider/register";
        }

        Provider provider =
                providerService.findById(providerId);

        model.addAttribute(
                "provider",
                provider);

        model.addAttribute(
                "tasks",
                taskService.findTasksByProvider(providerId));

        return "provider/my-claimed-tasks";
    }

    @PostMapping("/provider/task/{id}/complete")
    public String completeTask(
            @PathVariable Long id) {

        ErrandTask task =
                taskService.findById(id);

        task.setStatus("COMPLETED");

        taskService.update(id, task);

        return "redirect:/provider/claimed";
    }

    @PostMapping("/provider/task/{id}/cancel")
    public String cancelTask(
            @PathVariable Long id) {

        ErrandTask task =
                taskService.findById(id);

        task.setStatus("OPEN");

        task.setProvider(null);

        taskService.update(id, task);

        return "redirect:/provider/dashboard";
    }

    @GetMapping("/provider/login")
    public String loginPage() {

        return "provider/login";
    }

    @PostMapping("/provider/login")
    public String login(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) 
    {

        try 
        {

            Provider provider = providerService.findByEmail(email);

            if (!provider.getPassword().equals(password)) 
                {

                    model.addAttribute("error","Invalid password");

                    return "provider/login";
                }

            session.setAttribute("providerId", provider.getProviderId());

            return "redirect:/provider/dashboard";

        }
        catch (Exception e) 
        {

            model.addAttribute("error", "Account not found");
            return "provider/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) 
    {
        session.invalidate();
        return "redirect:/";
    }
}