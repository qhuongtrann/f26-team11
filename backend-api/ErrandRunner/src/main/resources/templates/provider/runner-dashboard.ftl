<!DOCTYPE html>
<html lang="en">

<head>
    <title>ErrandRunner - Runner Dashboard</title>

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
                <a href="/" class="text-decoration-none">
                    <h2 class="text-primary fw-bold mb-0">
                        ErrandRunner
                    </h2>
                </a>
            </div>

            <div class="col-lg-9">
                <ul class="navbar-nav list-unstyled d-flex flex-row gap-4 justify-content-end align-items-center mb-0 fw-bold text-uppercase">

                    <li>
                        <a href="/provider/dashboard"
                           class="nav-link text-primary">
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

        <div class="section-header mb-4">
            <h2 class="section-title">
                Open Errand Tasks
            </h2>
        </div>

        <div class="row row-cols-1 row-cols-md-3 g-4">

            <#list tasks as task>

            <#if task.status?? && task.status?upper_case == "OPEN">

            <div class="col">

                <div class="product-item">

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

                            <span class="badge border border-dark-subtle rounded-0 fw-normal px-1 fs-7 lh-1 text-body-tertiary">
                                ${task.category!""}
                            </span>

                        </div>

                        <div class="button-area p-3 pt-0">

                            <div class="d-grid mt-2">

                                <a href="/provider/task/${task.taskId}"
                                   class="btn btn-primary rounded-1 p-2 fs-7">

                                    View Details

                                </a>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

            </#if>

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>