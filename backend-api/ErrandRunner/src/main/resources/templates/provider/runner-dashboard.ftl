<!DOCTYPE html>
<html>

<head>
    <title>Runner Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="container mt-5">

<h1>Available Tasks</h1>

<table class="table table-striped">

    <thead>
    <tr>
        <th>Title</th>
        <th>Category</th>
        <th>Location</th>
        <th>Fee</th>
        <th>Status</th>
    </tr>
    </thead>

    <tbody>

    <#list tasks as task>

    <tr>
        <td>${task.title}</td>
        <td>${task.category!""}</td>
        <td>${task.location!""}</td>
        <td>${task.fee!""}</td>
        <td>${task.status!""}</td>
    </tr>

    </#list>

    </tbody>

</table>

</body>
</html>
