<#ftl output_format="HTML">
<!DOCTYPE html>
<html>
<head>
    <title>Place an Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5" style="max-width: 640px;">

    <h2>Place an Order</h2>
    <p class="text-muted">Tell us what you need done and a runner can claim it.</p>

    <#if error??>
        <div class="alert alert-danger">${error}</div>
    </#if>

    <#if customers?size == 0>
        <div class="alert alert-info">There are no customer accounts yet, so an order can't be placed.</div>
    <#else>
    <form action="/orders" method="post">

        <div class="mb-3">
            <label class="form-label fw-bold">Ordering as</label>
            <select class="form-select" name="customerId" required>
                <option value="">-- choose your account --</option>
                <#list customers as c>
                    <option value="${c.customerId?c}" <#if "${(form.customerId)!''}" == "${c.customerId?c}">selected</#if>>${c.name} (${c.email})</option>
                </#list>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label fw-bold">Task title</label>
            <input type="text" class="form-control" name="title" maxlength="255" value="${(form.title)!''}" required>
        </div>

        <div class="mb-3">
            <label class="form-label fw-bold">Description</label>
            <textarea class="form-control" name="description" rows="4" maxlength="255" required>${(form.description)!''}</textarea>
        </div>

        <div class="mb-3">
            <label class="form-label fw-bold">Category <span class="text-muted fw-normal">(optional)</span></label>
            <input type="text" class="form-control" name="category" maxlength="255" value="${(form.category)!''}">
        </div>

        <div class="mb-3">
            <label class="form-label fw-bold">Location</label>
            <input type="text" class="form-control" name="location" maxlength="255" value="${(form.location)!''}" required>
        </div>

        <div class="mb-3">
            <label class="form-label fw-bold">Fee ($)</label>
            <input type="number" step="0.01" min="0.01" class="form-control" name="fee" value="${(form.fee)!''}" required>
        </div>

        <button type="submit" class="btn btn-primary">Submit order</button>
        <a href="/orders" class="btn btn-link">My orders</a>
    </form>
    </#if>

</div>
</body>
</html>
