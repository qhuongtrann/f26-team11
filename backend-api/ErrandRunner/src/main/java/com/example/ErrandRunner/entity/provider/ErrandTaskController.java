package com.example.ErrandRunner.entity.provider;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/tasks")
public class ErrandTaskController {

    private final ErrandTaskService service;

    public ErrandTaskController(ErrandTaskService service) 
    {
        this.service = service;
    }

    @GetMapping
    public List<ErrandTask> getAll(
            @RequestParam(required = false) String category,
            @RequestParam(required = false) String status) 
    {

        return service.search(category, status);
    }

    @GetMapping("/{id}")
    public ErrandTask getOne(@PathVariable Long id) 
    {

        return service.findById(id);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ErrandTask create(@Valid @RequestBody ErrandTask task) 
    {

        return service.create(task);
    }

    @PutMapping("/{id}")
    public ErrandTask update(
            @PathVariable Long id,
            @Valid @RequestBody ErrandTask task) 
    {

        return service.update(id, task);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) 
    {

        service.delete(id);
    }

    @PutMapping("/{taskId}/claim/{providerId}")
    public ErrandTask claimTask(
            @PathVariable Long taskId,
            @PathVariable Long providerId) 
    {

        return service.claimTask(taskId, providerId);
    }
}