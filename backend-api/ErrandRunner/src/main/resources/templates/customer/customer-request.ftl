<form action="/tasks/create" method="post">

    <div class="mb-3">
        <label class="form-label fw-bold">Task Title</label>
        <input type="text"
               class="form-control"
               name="title"
               required>
    </div>

    <div class="mb-3">
        <label class="form-label fw-bold">Description</label>
        <textarea class="form-control"
                  name="description"
                  rows="4"
                  required></textarea>
    </div>

    <div class="mb-3">
        <label class="form-label fw-bold">Category</label>
        <input type="text"
               class="form-control"
               name="category">
    </div>

    <div class="mb-3">
        <label class="form-label fw-bold">Location</label>
        <input type="text"
               class="form-control"
               name="location"
               required>
    </div>

    <div class="mb-3">
        <label class="form-label fw-bold">Fee</label>
        <input type="number"
               step="0.01"
               class="form-control"
               name="fee"
               required>
    </div>

    <button type="submit"
            class="btn btn-primary">
        Submit Task
    </button>

</form>