<!DOCTYPE html>
<html>
<head>
    <title>Leave Review</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body>

<div class="container mt-5">

    <h2>Leave a Review</h2>

    <form action="/reviews/create" method="post">

        <div class="mb-3">
            <label class="form-label">
                Rating
            </label>

            <select class="form-control" name="stars">

                <option value="1">1 Star</option>
                <option value="2">2 Stars</option>
                <option value="3">3 Stars</option>
                <option value="4">4 Stars</option>
                <option value="5">5 Stars</option>

            </select>
        </div>

        <div class="mb-3">

            <label class="form-label">
                Comment
            </label>

            <textarea class="form-control"
                      rows="4"
                      name="comment"></textarea>

        </div>

        <button type="submit"
                class="btn btn-primary">

            Submit Review

        </button>

    </form>

</div>

</body>
</html>