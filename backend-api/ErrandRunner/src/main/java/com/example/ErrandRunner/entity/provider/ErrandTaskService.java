package com.example.ErrandRunner.entity.provider;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class ErrandTaskService {

    private final ErrandTaskRepository taskRepository;
    private final ProviderRepository providerRepository;

    public ErrandTaskService(ErrandTaskRepository taskRepository, ProviderRepository providerRepository) 
    {

        this.taskRepository = taskRepository;
        this.providerRepository = providerRepository;
    }

    public List<ErrandTask> search(String category, String status) 
    {

        if (category != null) 
            {
                return taskRepository.findByCategoryIgnoreCase(category);
            }

        if (status != null) 
            {
                return taskRepository.findByStatusIgnoreCase(status);
            }


        return taskRepository.findAll();
    }

    public ErrandTask findById(Long id) 
    {

        return taskRepository.findById(id)
                             .orElseThrow(() -> new TaskNotFoundException(id));
    }

    public ErrandTask create(ErrandTask task) 
    {

        return taskRepository.save(task);
    }

    public ErrandTask update(Long id, ErrandTask updated) 
    {

        ErrandTask existing = findById(id);

        existing.setTitle(updated.getTitle());
        existing.setDescription(updated.getDescription());
        existing.setCategory(updated.getCategory());
        existing.setLocation(updated.getLocation());
        existing.setFee(updated.getFee());
        existing.setStatus(updated.getStatus());
        existing.setProofNotes(updated.getProofNotes());

        return taskRepository.save(existing);
    }

    public void delete(Long id) 
    {

        findById(id);

        taskRepository.deleteById(id);
    }

    public ErrandTask claimTask(Long taskId, Long providerId) 
    {

        ErrandTask task = findById(taskId);

        Provider provider = providerRepository.findById(providerId)
                .orElseThrow(() -> new ProviderNotFoundException(providerId));

        task.setProvider(provider);

        task.setStatus("CLAIMED");

        return taskRepository.save(task);
    }
}