<!DOCTYPE html>
<html>

<head>

<title>My Claimed Tasks</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

</head>

<body class="container mt-5">

<h1>My Claimed Tasks</h1>

<a href="/provider/dashboard"
   class="btn btn-secondary mb-3">

Back to Dashboard

</a>

<table class="table table-striped">

<thead>
<tr>
<th>Title</th>
<th>Status</th>
<th>Actions</th>
</tr>
</thead>

<tbody>

<#list tasks as task>

<tr>

<td>${task.title}</td>

<td>${task.status}</td>

<td>

<form action="/provider/task/${task.taskId}/complete"
      method="post">

<button class="btn btn-success btn-sm">

Mark Completed

</button>

</form>

</td>

</tr>

</#list>

</tbody>

</table>

</body>

</html>