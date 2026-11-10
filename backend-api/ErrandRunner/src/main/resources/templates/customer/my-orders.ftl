<#ftl output_format="HTML">
<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="mb-0">My Orders</h2>
        <a href="/orders/new<#if customer??>?customerId=${customer.customerId?c}</#if>" class="btn btn-primary">Place an order</a>
    </div>

    <#if success??>
        <div class="alert alert-success">${success}</div>
    </#if>

    <form action="/orders" method="get" class="row g-2 mb-4">
        <div class="col-auto">
            <select class="form-select" name="customerId" onchange="this.form.submit()">
                <option value="">-- choose your account --</option>
                <#list customers as c>
                    <option value="${c.customerId?c}" <#if customer?? && customer.customerId == c.customerId>selected</#if>>${c.name} (${c.email})</option>
                </#list>
            </select>
        </div>
        <noscript><div class="col-auto"><button class="btn btn-outline-dark">Show</button></div></noscript>
    </form>

    <#if !customer??>
        <p class="text-muted">Choose your account to see your orders.</p>
    <#else>

        <#if (waitingForReview!0) gt 0>
            <div class="alert alert-warning">
                <strong>How did it go?</strong>
                You have ${waitingForReview} completed order<#if waitingForReview != 1>s</#if> waiting for a review.
                Use the <em>Leave a review</em> button below.
            </div>
        </#if>

        <#if rows?size == 0>
            <p class="text-muted">${customer.name} hasn't placed any orders yet.</p>
        <#else>
        <table class="table align-middle">
            <thead>
            <tr>
                <th>Title</th><th>Location</th><th>Category</th><th>Fee</th><th>Runner</th><th>Status</th><th>Review</th>
            </tr>
            </thead>
            <tbody>
            <#list rows as row>
                <tr>
                    <td>${row.task.title}</td>
                    <td>${(row.task.location)!"-"}</td>
                    <td>${(row.task.category)!"-"}</td>
                    <td>$${((row.task.fee)!0)?string["0.00"]}</td>
                    <td>${(row.task.provider.name)!"Not claimed yet"}</td>
                    <td>${(row.task.status)!"-"}</td>
                    <td>
                        <#if row.canReview>
                            <a class="btn btn-sm btn-warning" href="/reviews/new?taskId=${row.task.taskId?c}">Leave a review</a>
                        <#elseif row.stars??>
                            <span title="${row.stars} out of 5"><#list 1..5 as i>${(i <= row.stars)?then("★","☆")}</#list></span>
                        <#else>
                            <span class="text-muted">-</span>
                        </#if>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
        </#if>
    </#if>

</div>
</body>
</html>
