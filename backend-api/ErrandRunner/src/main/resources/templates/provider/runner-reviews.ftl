<#ftl output_format="HTML">
<!DOCTYPE html>
<html>
<head>
    <title>Reviews for ${provider.name}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5" style="max-width: 720px;">

    <h2>Reviews for ${provider.name}</h2>

    <#if average??>
        <p class="fs-5">
            <span style="color:#f5b301"><#list 1..5 as i>${(i <= average + 0.5)?then("★","☆")}</#list></span>
            ${average?string["0.0"]} out of 5 &middot; ${reviews?size} review<#if reviews?size != 1>s</#if>
        </p>
    <#else>
        <p class="text-muted">No reviews yet.</p>
    </#if>

    <#list reviews as r>
        <div class="card mb-3">
            <div class="card-body">
                <div style="color:#f5b301"><#list 1..5 as i>${(i <= (r.stars)!0)?then("★","☆")}</#list></div>
                <h6 class="mt-1">${(r.task.title)!"Order"}</h6>
                <p class="mb-1"><#if (r.comment)?has_content>${r.comment}<#else><span class="text-muted">No comment left.</span></#if></p>
                <small class="text-muted">&mdash; ${(r.customer.name)!"A customer"}</small>
            </div>
        </div>
    </#list>

</div>
</body>
</html>
