<!DOCTYPE html>
<html>

<head>
    <title>Task Details</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="container mt-5">

<h1>${task.title}</h1>

<hr>

<p>
<strong>Description:</strong>
${task.description}
</p>

<p>
<strong>Category:</strong>
${task.category!""}
</p>

<p>
<strong>Location:</strong>
${task.location!""}
</p>

<p>
<strong>Fee:</strong>
$${task.fee!""}
</p>

<p>
<strong>Status:</strong>
${task.status!""}
</p>

<#if task.status == "OPEN">

<form action="/provider/task/${task.taskId}/claim"
      method="post">

    <button class="btn btn-success">
        Claim Task
    </button>

</form>

</#if>

<br>

<a href="/provider/dashboard"
   class="btn btn-secondary">

    Back to Dashboard

</a>

</body>
</html>