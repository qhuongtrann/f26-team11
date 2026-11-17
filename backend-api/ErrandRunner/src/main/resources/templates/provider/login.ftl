<!DOCTYPE html>
<html lang="en">

<head>
    <title>Runner Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-5">

            <div class="card shadow">

                <div class="card-body p-4">

                    <h2 class="mb-4">
                        Runner Login
                    </h2>

                    <a href="/" class="btn btn-outline-secondary mb-3">
                        Home
                    </a>

                    <#if error??>
                        <div class="alert alert-danger">
                            ${error}
                        </div>
                    </#if>

                    <form action="/provider/login"
                          method="post">

                        <div class="mb-3">
                            <label>Email</label>

                            <input type="email"
                                   name="email"
                                   class="form-control"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label>Password</label>

                            <input type="password"
                                   name="password"
                                   class="form-control"
                                   required>
                        </div>

                        <button type="submit"
                                class="btn btn-success w-100">
                            Login
                        </button>

                    </form>

                    <hr>

                    <a href="/provider/register">
                        Don't have an account? Register here
                    </a>

                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>