<!DOCTYPE html>
<html lang="en">

<head>
    <title>ErrandRunner - Post an Errand</title>

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
                        <a href="/customer/request"
                           class="nav-link text-primary">
                            Post Task
                        </a>
                    </li>

                    <li>
                        <a href="/provider/dashboard"
                           class="nav-link">
                            Provider Dashboard
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

            <div class="col-md-7">

                <div class="product-item p-4">

                    <h2 class="mb-4">
                        Request a Local Errand
                    </h2>

                    <p class="text-muted mb-4">
                        Post a task and nearby runners can claim it.
                    </p>

                    <form action="/tasks/create"
                          method="post">

                        <div class="mb-3">
                            <label class="form-label fw-bold">
                                Task Title
                            </label>

                            <input type="text"
                                   class="form-control"
                                   name="title"
                                   required>
                        </div>

                        <div class="mb-3">

                            <label class="form-label fw-bold">
                                Description
                            </label>

                            <textarea class="form-control"
                                      name="description"
                                      rows="4"
                                      required></textarea>

                        </div>

                        <div class="mb-3">

                            <label class="form-label fw-bold">
                                Category
                            </label>

                            <input type="text"
                                   class="form-control"
                                   name="category">

                        </div>

                        <div class="mb-3">

                            <label class="form-label fw-bold">
                                Location
                            </label>

                            <input type="text"
                                   class="form-control"
                                   name="location"
                                   required>

                        </div>

                        <div class="mb-4">

                            <label class="form-label fw-bold">
                                Fee
                            </label>

                            <input type="number"
                                   step="0.01"
                                   class="form-control"
                                   name="fee"
                                   required>

                        </div>

                        <div class="d-grid">

                            <button type="submit"
                                    class="btn btn-primary">

                                Submit Task

                            </button>

                        </div>

                    </form>

                </div>

            </div>

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