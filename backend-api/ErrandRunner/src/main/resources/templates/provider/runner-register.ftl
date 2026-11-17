<!DOCTYPE html>
<html lang="en">
<head>
    <title>ErrandRunner - Runner Registration</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="bg-light">

<header>
    <div class="container-fluid">
        <div class="row py-3 border-bottom bg-white">

            <div class="col-md-6">
                <a href="/" class="text-decoration-none">
                    <h2 class="text-success fw-bold mb-0">
                        ErrandRunner
                    </h2>
                </a>
            </div>

            <div class="col-md-6 text-end">
                <a href="/" class="btn btn-outline-secondary">
                    Home
                </a>
            </div>

        </div>
    </div>
</header>

<section class="py-5">

    <div class="container">

        <div class="row justify-content-center">

            <div class="col-md-6">

                <div class="card shadow">

                    <div class="card-body p-5">

                        <h2 class="mb-3">
                            Become a Runner
                        </h2>

                        <p class="text-muted">
                            Create a runner account to start claiming errands.
                        </p>

                        <form action="/provider/register"
                              method="post">

                            <div class="mb-3">
                                <label class="form-label">
                                    Full Name
                                </label>

                                <input type="text"
                                       name="name"
                                       class="form-control"
                                       required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">
                                    Email
                                </label>

                                <input type="email"
                                       name="email"
                                       class="form-control"
                                       required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">
                                    Password
                                </label>

                                <input type="password"
                                       name="password"
                                       class="form-control"
                                       required>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">
                                    Age
                                </label>

                                <input type="number"
                                       name="age"
                                       class="form-control"
                                       required>
                            </div>

                            <button type="submit"
                                    class="btn btn-success w-100">
                                Register Account
                            </button>

                            <div class="text-center mt-3">
                                <a href="/provider/login">
                                    Already have an account? Log In
                                </a>
                            </div>

                        </form>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>