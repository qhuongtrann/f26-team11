<!DOCTYPE html>
<html>

<head>
    <title>Runner Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="container mt-5">

<h1>Available Tasks</h1>

<a href="/provider/claimed"
   class="btn btn-dark mb-3">
    My Claimed Tasks
</a>

<table class="table table-striped">

<thead>
<tr>
    <th>Title</th>
    <th>Category</th>
    <th>Location</th>
    <th>Fee</th>
    <th>Status</th>
    <th>Actions</th>
</tr>
</thead>

<tbody>

<#list tasks as task>

<#if task.status?? && task.status?upper_case == "OPEN">

<tr>
    <td>${task.title}</td>
    <td>${task.category!""}</td>
    <td>${task.location!""}</td>
    <td>${task.fee!""}</td>
    <td>${task.status!""}</td>

    <td>
        <a href="/provider/task/${task.taskId}"
           class="btn btn-primary btn-sm">
            View Details
        </a>
    </td>
</tr>

</#if>

</#list>

</tbody>

</table>

</body>
</html>