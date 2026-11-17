<!DOCTYPE html>
<html lang="en">

<head>
    <title>ErrandRunner - Task Details</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet" href="/css/vendor.css">
    <link rel="stylesheet" href="/styles.css">
</head>

<body>

<header>
    <div class="container-fluid">
        <div class="row py-3 border-bottom">

            <div class="col-lg-3">
                <h2 class="text-primary fw-bold mb-0">
                    ErrandRunner
                </h2>
            </div>

            <div class="col-lg-9">
                <ul class="navbar-nav list-unstyled d-flex flex-row gap-4 justify-content-end align-items-center mb-0 fw-bold text-uppercase">
                    <li>
                        <a href="/provider/dashboard"
                           class="nav-link">
                            Browse Tasks
                        </a>
                    </li>

                    <li>
                        <a href="/provider/claimed"
                           class="nav-link">
                            My Claimed Tasks
                        </a>
                    </li>
                </ul>
            </div>

        </div>
    </div>
</header>

<section class="py-5 bg-light">

    <div class="container-lg">

        <div class="row justify-content-center">

            <div class="col-md-8">

                <div class="product-item">

                    <figure>
                        <img src="/images/product-thumb-1.jpg"
                             alt="Task"
                             class="tab-image">
                    </figure>

                    <div class="text-center">

                        <h2>${task.title}</h2>

                        <p class="mt-3">
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

                        <#if task.status?upper_case == "OPEN">

                        <form action="/provider/task/${task.taskId}/claim"
                              method="post">

                            <button type="submit"
                                    class="btn btn-primary mt-3">
                                Claim Task
                            </button>

                        </form>

                        </#if>

                        <a href="/provider/dashboard"
                           class="btn btn-secondary mt-3">
                            Back to Dashboard
                        </a>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>

</body>
</html>