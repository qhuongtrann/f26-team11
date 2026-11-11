<h2>My Orders</h2>

<table class="table">

    <thead>
    <tr>
        <th>Title</th>
        <th>Location</th>
        <th>Category</th>
        <th>Fee</th>
        <th>Status</th>
    </tr>
    </thead>

    <tbody>

    <#list tasks as task>

        <tr>
            <td>${task.title}</td>
            <td>${task.location}</td>
            <td>${task.category}</td>
            <td>$${task.fee}</td>
            <td>${task.status}</td>
        </tr>

    </#list>

    </tbody>

</table>