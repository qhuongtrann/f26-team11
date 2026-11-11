<!DOCTYPE html>
<html lang="en">
  <head>
    <title>ErrandRunner - Runner Dashboard</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../customer/organic-1.0.0/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="../customer/organic-1.0.0/style.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
  </head>
  <body>

    
    <header>
      <div class="container-fluid">
        <div class="row py-3 border-bottom">
          <div class="col-sm-4 col-lg-2 text-center text-sm-start d-flex gap-3 justify-content-center justify-content-md-start">
            <div class="d-flex align-items-center my-3 my-sm-0">
              <a href="../customer/organic-1.0.0/index.html" class="text-decoration-none">
                <h2 class="text-primary fw-bold mb-0">ErrandRunner</h2>
              </a>
            </div>
          </div>
          
          <div class="col-sm-6 offset-sm-2 offset-md-0 col-lg-5">
            <div class="search-bar row bg-light p-2 rounded-4">
              <div class="col-md-3 d-none d-md-block">
                <select class="form-select border-0 bg-transparent" id="categoryFilter">
                  <option value="all">All Services</option>
                  <option value="groceries">Groceries & Shopping</option>
                  <option value="delivery">Delivery & Transport</option>
                  <option value="pet">Pet Care</option>
                  <option value="home">Home Assistance & Organizing</option>
                  <option value="yard">Yard Work & Outdoor Chores</option>
                </select>
              </div>
              <div class="col-11 col-md-8">
                <form id="search-form" class="text-center">
                  <input type="text" class="form-control border-0 bg-transparent" placeholder="Search available neighborhood tasks">
                </form>
              </div>
              <div class="col-1">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z"/></svg>
              </div>
            </div>
          </div>

          <div class="col-lg-4">
            <ul class="navbar-nav list-unstyled d-flex flex-row gap-3 gap-lg-4 justify-content-center justify-content-lg-end flex-wrap align-items-center mb-0 fw-bold text-uppercase text-dark px-lg-3">
              <li class="nav-item">
                <a href="../customer/organic-1.0.0/index.html" class="nav-link">Home</a>
              </li>
              <li class="nav-item active">
                <a href="runner-dashboard.html" class="nav-link text-primary">Browse Tasks</a>
              </li>
              <li class="nav-item">
                <a href="my-claimed-tasks.html" class="nav-link">My Claimed Tasks</a>
              </li>
            </ul>
          </div>
          
          <div class="col-sm-8 col-lg-1 d-flex gap-5 align-items-center justify-content-center justify-content-sm-end">
            <ul class="d-flex justify-content-end list-unstyled m-0">
              <li>
                <a href="#" class="p-2 mx-1" title="User Profile">
                  <svg width="24" height="24"><use xlink:href="#user"></use></svg>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </header>
    
    
    <section class="py-5 bg-light">
      <div class="container-lg">
        <div class="section-header d-flex flex-wrap justify-content-between mb-4">
          <h2 class="section-title">Open Errand Tasks</h2>

        </div>

        
        <div class="row row-cols-1 row-cols-md-3 g-4" id="taskBoard">
          
          <!-- Task 1 -->
          <div class="col task-card" data-id="task-1" data-category="groceries">
            <div class="product-item">
              <figure>
                <a href="#" title="Task Details">
                  <img src="../customer/organic-1.0.0/images/product-thumb-1.jpg" alt="Task Thumbnail" class="tab-image">
                </a>
              </figure>
              <div class="d-flex flex-column text-center">
                <h3 class="fs-6 fw-normal">Weekly Grocery Delivery from Trader Joe's</h3>
                <div class="text-muted fs-7 mb-2">📍 Greensboro, NC</div>
                <div class="d-flex justify-content-center align-items-center gap-2 my-2">
                  <span class="text-dark fw-semibold">$25.00</span>
                  <span class="badge border border-dark-subtle rounded-0 fw-normal px-1 fs-7 lh-1 text-body-tertiary">RECURRING</span>
                </div>
                <div class="button-area p-3 pt-0">
                  <div class="d-grid mt-2">
                    <button class="btn btn-primary rounded-1 p-2 fs-7 claim-btn" data-id="task-1" data-title="Weekly Grocery Delivery from Trader Joe's" data-location="Greensboro, NC" data-fee="$25.00" data-img="../customer/organic-1.0.0/images/product-thumb-1.jpg">Claim Errand</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Task 2 -->
          <div class="col task-card" data-id="task-2" data-category="delivery">
            <div class="product-item">
              <figure>
                <a href="#" title="Task Details">
                  <img src="../customer/organic-1.0.0/images/product-thumb-2.jpg" alt="Task Thumbnail" class="tab-image">
                </a>
              </figure>
              <div class="d-flex flex-column text-center">
                <h3 class="fs-6 fw-normal">Post Office Package Drop-off</h3>
                <div class="text-muted fs-7 mb-2">📍 Clemmons, NC</div>
                <div class="d-flex justify-content-center align-items-center gap-2 my-2">
                  <span class="text-dark fw-semibold">$15.00</span>
                  <span class="badge border border-dark-subtle rounded-0 fw-normal px-1 fs-7 lh-1 text-body-tertiary">URGENT</span>
                </div>
                <div class="button-area p-3 pt-0">
                  <div class="d-grid mt-2">
                    <button class="btn btn-primary rounded-1 p-2 fs-7 claim-btn" data-id="task-2" data-title="Post Office Package Drop-off" data-location="Clemmons, NC" data-fee="$15.00" data-img="../customer/organic-1.0.0/images/product-thumb-2.jpg">Claim Errand</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Task 3 -->
          <div class="col task-card" data-id="task-3" data-category="delivery">
            <div class="product-item">
              <figure>
                <a href="#" title="Task Details">
                  <img src="../customer/organic-1.0.0/images/product-thumb-3.jpg" alt="Task Thumbnail" class="tab-image">
                </a>
              </figure>
              <div class="d-flex flex-column text-center">
                <h3 class="fs-6 fw-normal">Pharmacy Prescription Pickup</h3>
                <div class="text-muted fs-7 mb-2">📍 Greensboro, NC</div>
                <div class="d-flex justify-content-center align-items-center gap-2 my-2">
                  <span class="text-dark fw-semibold">$20.00</span>
                  <span class="badge border border-dark-subtle rounded-0 fw-normal px-1 fs-7 lh-1 text-body-tertiary">URGENT</span>
                </div>
                <div class="button-area p-3 pt-0">
                  <div class="d-grid mt-2">
                    <button class="btn btn-primary rounded-1 p-2 fs-7 claim-btn" data-id="task-3" data-title="Pharmacy Prescription Pickup" data-location="Greensboro, NC" data-fee="$20.00" data-img="../customer/organic-1.0.0/images/product-thumb-3.jpg">Claim Errand</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Task 4 -->
          <div class="col task-card" data-id="task-4" data-category="pet">
            <div class="product-item">
              <figure>
                <a href="#" title="Task Details">
                  <img src="../customer/organic-1.0.0/images/product-thumb-4.jpg" alt="Task Thumbnail" class="tab-image">
                </a>
              </figure>
              <div class="d-flex flex-column text-center">
                <h3 class="fs-6 fw-normal">Pet Food & Supply Run</h3>
                <div class="text-muted fs-7 mb-2">📍 Highpoint, NC</div>
                <div class="d-flex justify-content-center align-items-center gap-2 my-2">
                  <span class="text-dark fw-semibold">$18.00</span>
                  <span class="badge border border-dark-subtle rounded-0 fw-normal px-1 fs-7 lh-1 text-body-tertiary">STANDARD</span>
                </div>
                <div class="button-area p-3 pt-0">
                  <div class="d-grid mt-2">
                    <button class="btn btn-primary rounded-1 p-2 fs-7 claim-btn" data-id="task-4" data-title="Pet Food & Supply Run" data-location="Highpoint, NC" data-fee="$18.00" data-img="../customer/organic-1.0.0/images/product-thumb-4.jpg">Claim Errand</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Task 5 -->
          <div class="col task-card" data-id="task-5" data-category="home">
            <div class="product-item">
              <figure>
                <a href="#" title="Task Details">
                  <img src="../customer/organic-1.0.0/images/product-thumb-10.jpg" alt="Task Thumbnail" class="tab-image">
                </a>
              </figure>
              <div class="d-flex flex-column text-center">
                <h3 class="fs-6 fw-normal">Heavy Box Lifting & Moving</h3>
                <div class="text-muted fs-7 mb-2">📍 Mocksville, NC</div>
                <div class="d-flex justify-content-center align-items-center gap-2 my-2">
                  <span class="text-dark fw-semibold">$40.00</span>
                  <span class="badge border border-dark-subtle rounded-0 fw-normal px-1 fs-7 lh-1 text-body-tertiary">STANDARD</span>
                </div>
                <div class="button-area p-3 pt-0">
                  <div class="d-grid mt-2">
                    <button class="btn btn-primary rounded-1 p-2 fs-7 claim-btn" data-id="task-5" data-title="Heavy Box Lifting & Moving" data-location="Mocksville, NC" data-fee="$40.00" data-img="../customer/organic-1.0.0/images/product-thumb-10.jpg">Claim Errand</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Task 6 -->
          <div class="col task-card" data-id="task-6" data-category="yard">
            <div class="product-item">
              <figure>
                <a href="#" title="Task Details">
                  <img src="../customer/organic-1.0.0/images/product-thumb-11.jpeg" alt="Task Thumbnail" class="tab-image">
                </a>
              </figure>
              <div class="d-flex flex-column text-center">
                <h3 class="fs-6 fw-normal">Yard Cleanup & Leaf Raking</h3>
                <div class="text-muted fs-7 mb-2">📍 Winston-Salem, NC</div>
                <div class="d-flex justify-content-center align-items-center gap-2 my-2">
                  <span class="text-dark fw-semibold">$35.00</span>
                  <span class="badge border border-dark-subtle rounded-0 fw-normal px-1 fs-7 lh-1 text-body-tertiary">STANDARD</span>
                </div>
                <div class="button-area p-3 pt-0">
                  <div class="d-grid mt-2">
                    <button class="btn btn-primary rounded-1 p-2 fs-7 claim-btn" data-id="task-6" data-title="Yard Cleanup & Leaf Raking" data-location="Winston-Salem, NC" data-fee="$35.00" data-img="../customer/organic-1.0.0/images/product-thumb-11.jpeg">Claim Errand</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </section>

    
    <footer class="py-5">
      <div class="container-lg text-center">
        <p class="text-muted mb-0">© 2026 ErrandRunner. All rights reserved.</p>
      </div>
    </footer>

    
    <script>
      function checkClaimedStatus() {
        const claimed = JSON.parse(localStorage.getItem('claimedTasks') || '[]');
        const claimedIds = claimed.map(t => t.id);

        document.querySelectorAll('.task-card').forEach(card => {
          const taskId = card.getAttribute('data-id');
          if (claimedIds.includes(taskId)) {
            card.style.display = 'none'; 
          }
        });
      }

      document.getElementById('categoryFilter').addEventListener('change', function() {
        const selectedCategory = this.value;
        const claimed = JSON.parse(localStorage.getItem('claimedTasks') || '[]');
        const claimedIds = claimed.map(t => t.id);
        
        document.querySelectorAll('.task-card').forEach(card => {
          const taskId = card.getAttribute('data-id');
          const matchesCat = (selectedCategory === 'all' || card.getAttribute('data-category') === selectedCategory);
          if (matchesCat && !claimedIds.includes(taskId)) {
            card.style.display = 'block';
          } else {
            card.style.display = 'none';
          }
        });
      });

      document.querySelectorAll('.claim-btn').forEach(btn => {
        btn.addEventListener('click', function() {
          const task = {
            id: this.getAttribute('data-id'),
            title: this.getAttribute('data-title'),
            location: this.getAttribute('data-location'),
            fee: this.getAttribute('data-fee'),
            img: this.getAttribute('data-img'),
            status: 'In-Progress',
            proof: ''
          };
          let claimed = JSON.parse(localStorage.getItem('claimedTasks') || '[]');
          claimed.push(task);
          localStorage.setItem('claimedTasks', JSON.stringify(claimed));
          
          alert('Task successfully claimed! It has been removed from the open board.');
          window.location.href = 'my-claimed-tasks.html';
        });
      });

      window.onload = checkClaimedStatus;
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>