<!DOCTYPE html>
<html lang="en">

<head>
    <title>ErrandRunner - My Claimed Tasks</title>

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
                           class="nav-link text-primary">
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

        <div class="section-header mb-4">
            <h2 class="section-title">
                My Claimed Tasks
            </h2>
        </div>

        <div class="row row-cols-1 row-cols-md-3 g-4">

            <#list tasks as task>

            <div class="col">

                <div class="product-item h-100">

                    <figure>
                        <img src="/images/product-thumb-1.jpg"
                             alt="Task"
                             class="tab-image">
                    </figure>

                    <div class="d-flex flex-column text-center">

                        <h3 class="fs-6 fw-normal">
                            ${task.title}
                        </h3>

                        <div class="text-muted fs-7 mb-2">
                            📍 ${task.location!""}
                        </div>

                        <div class="d-flex justify-content-center align-items-center gap-2 my-2">

                            <span class="text-dark fw-semibold">
                                $${task.fee!""}
                            </span>

                            <#if task.status?upper_case == "CLAIMED">
                                <span class="badge bg-warning text-dark">
                                    ${task.status}
                                </span>
                            <#elseif task.status?upper_case == "COMPLETED">
                                <span class="badge bg-success">
                                    ${task.status}
                                </span>
                            <#else>
                                <span class="badge bg-secondary">
                                    ${task.status}
                                </span>
                            </#if>

                        </div>

                        <div class="p-3">

                            <form action="/provider/task/${task.taskId}/complete"
                                  method="post"
                                  class="mb-2">

                                <button type="submit"
                                        class="btn btn-success w-100">

                                    Mark Completed

                                </button>

                            </form>

                            <form action="/provider/task/${task.taskId}/cancel"
                                  method="post">

                                <button type="submit"
                                        class="btn btn-danger w-100">

                                    Cancel Task

                                </button>

                            </form>

                        </div>

                    </div>

                </div>

            </div>

            </#list>

        </div>

    </div>

</section>

<footer class="py-5">
    <div class="container-lg text-center">
        <p class="text-muted mb-0">
            © 2026 ErrandRunner. All rights reserved.
        </p>
    </div>
</footer>

</body>
</html>