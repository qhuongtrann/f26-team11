<#ftl output_format="HTML">
<!DOCTYPE html>
<html>
<head>
    <title>${title!"Error"}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5" style="max-width: 640px;">
    <div class="alert alert-warning">
        <h4 class="alert-heading">${title!"Something went wrong"}</h4>
        <p class="mb-0">${message!"Please go back and try again."}</p>
    </div>
    <a href="/orders" class="btn btn-outline-dark">My orders</a>
    <a href="/orders/new" class="btn btn-dark">Place an order</a>
</div>
</body>
</html>
