package com.example.ErrandRunner.entity.provider;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.ErrandRunner.entity.customer.Customer;
import com.example.ErrandRunner.entity.customer.CustomerNotFoundException;
import com.example.ErrandRunner.entity.customer.CustomerRepository;
import com.example.ErrandRunner.exception.InvalidRequestException;

@Service
public class ErrandTaskService {

    private final ErrandTaskRepository taskRepository;
    private final ProviderRepository providerRepository;
    private final CustomerRepository customerRepository;

    public ErrandTaskService(ErrandTaskRepository taskRepository,
                             ProviderRepository providerRepository,
                             CustomerRepository customerRepository)
    {
        this.taskRepository = taskRepository;
        this.providerRepository = providerRepository;
        this.customerRepository = customerRepository;
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

    // ---- US-3: Place Order -------------------------------------------------

    public List<ErrandTask> findByCustomer(Long customerId)
    {
        return taskRepository.findByCustomer_CustomerIdOrderByTaskIdDesc(customerId);
    }

    /** Validates the order form, then saves a new task with status "Open". */
    public ErrandTask placeOrder(Long customerId, String title, String description,
                                 String category, String location, String feeText)
    {
        if (customerId == null)
        {
            throw new InvalidRequestException("Please choose who is placing this order.");
        }
        Customer customer = customerRepository.findById(customerId)
                .orElseThrow(() -> new CustomerNotFoundException(customerId));

        title = clean(title);
        description = clean(description);
        category = clean(category);
        location = clean(location);
        feeText = clean(feeText);

        if (title == null)       throw new InvalidRequestException("Please enter a task title.");
        if (description == null) throw new InvalidRequestException("Please describe what you need done.");
        if (location == null)    throw new InvalidRequestException("Please enter a location.");
        if (feeText == null)     throw new InvalidRequestException("Please enter a fee.");

        // Columns are plain varchar(255), so longer text would cause a database error.
        if (title.length() > 255)       throw new InvalidRequestException("Title must be 255 characters or fewer.");
        if (description.length() > 255) throw new InvalidRequestException("Description must be 255 characters or fewer (you typed " + description.length() + ").");
        if (location.length() > 255)    throw new InvalidRequestException("Location must be 255 characters or fewer.");
        if (category != null && category.length() > 255)
                                        throw new InvalidRequestException("Category must be 255 characters or fewer.");

        double fee;
        try
        {
            fee = Double.parseDouble(feeText);
        }
        catch (NumberFormatException e)
        {
            throw new InvalidRequestException("Fee must be a number, for example 15.00.");
        }
        if (Double.isNaN(fee) || Double.isInfinite(fee) || fee <= 0)
        {
            throw new InvalidRequestException("Fee must be greater than 0.");
        }
        if (fee > 100000)
        {
            throw new InvalidRequestException("Fee is too large. Please enter 100,000 or less.");
        }

        ErrandTask task = new ErrandTask();
        task.setTitle(title);
        task.setDescription(description);
        task.setCategory(category);
        task.setLocation(location);
        task.setFee(Math.round(fee * 100.0) / 100.0);
        task.setStatus("Open");
        task.setCustomer(customer);

        return taskRepository.save(task);
    }

    private static String clean(String s)
    {
        if (s == null) return null;
        s = s.trim();
        return s.isEmpty() ? null : s;
    }
}
