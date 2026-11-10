<#ftl output_format="HTML">
<!DOCTYPE html>
<html>
<head>
    <title>Leave a Review</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .star-rating { display: inline-flex; flex-direction: row-reverse; gap: .15rem; }
        .star-rating input { position: absolute; opacity: 0; }
        .star-rating label { font-size: 2.2rem; color: #ccc; cursor: pointer; line-height: 1; }
        .star-rating input:checked ~ label,
        .star-rating label:hover,
        .star-rating label:hover ~ label { color: #f5b301; }
        .star-rating input:focus-visible + label { outline: 2px solid #0d6efd; }
    </style>
</head>
<body>
<div class="container mt-5" style="max-width: 640px;">

    <h2>Leave a Review</h2>

    <div class="card mb-4">
        <div class="card-body">
            <h5 class="card-title mb-1">${task.title}</h5>
            <div class="text-muted">
                Runner: ${(task.provider.name)!"Not assigned"} &middot; Status: ${(task.status)!"-"}
            </div>
        </div>
    </div>

    <#if blocked??>
        <div class="alert alert-warning">${blocked}</div>
        <a href="<#if task.customer??>/orders?customerId=${task.customer.customerId?c}<#else>/orders</#if>" class="btn btn-outline-dark">Back to my orders</a>
    <#else>

        <#if error??>
            <div class="alert alert-danger">${error}</div>
        </#if>

        <form action="/reviews/create" method="post">
            <input type="hidden" name="taskId" value="${task.taskId?c}">

            <div class="mb-3">
                <label class="form-label fw-bold d-block">Rating</label>
                <div class="star-rating">
                    <#list 5..1 as i>
                        <input type="radio" id="star${i}" name="stars" value="${i}" <#if (stars!0) == i>checked</#if>>
                        <label for="star${i}" title="${i} star<#if i != 1>s</#if>">★</label>
                    </#list>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold" for="comment">Comment <span class="text-muted fw-normal">(optional)</span></label>
                <textarea class="form-control" id="comment" name="comment" rows="4" maxlength="255">${comment!""}</textarea>
            </div>

            <button type="submit" class="btn btn-primary">Submit review</button>
            <a href="<#if task.customer??>/orders?customerId=${task.customer.customerId?c}<#else>/orders</#if>" class="btn btn-link">Cancel</a>
        </form>
    </#if>

</div>
</body>
</html>
