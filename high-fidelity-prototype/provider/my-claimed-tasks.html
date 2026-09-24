<!DOCTYPE html>
<html lang="en">
  <head>
    <title>ErrandRunner - My Claimed Tasks</title>
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
    
    <style>
      
      .completed-card {
        opacity: 0.45;
        filter: brightness(0.75);
        background-color: #f1f1f1 !important;
        pointer-events: none; 
      }
      .completed-card .cancel-task-btn {
        pointer-events: auto; 
      }
    </style>
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
          
          <div class="col-lg-6 offset-lg-4">
            <ul class="navbar-nav list-unstyled d-flex flex-row gap-3 gap-lg-4 justify-content-center justify-content-lg-end flex-wrap align-items-center mb-0 fw-bold text-uppercase text-dark px-lg-3">
              <li class="nav-item">
                <a href="../customer/organic-1.0.0/index.html" class="nav-link">Home</a>
              </li>
              <li class="nav-item">
                <a href="runner-dashboard.html" class="nav-link">Browse Tasks</a>
              </li>
              <li class="nav-item active">
                <a href="my-claimed-tasks.html" class="nav-link text-primary">My Claimed Tasks</a>
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
        <div class="section-header mb-4">
          <h2 class="section-title">My Claimed Errand Tasks</h2>

        </div>

        <div id="claimedTaskList" class="row row-cols-1 row-cols-md-3 g-4">
          
        </div>
      </div>
    </section>

    
    <footer class="py-5">
      <div class="container-lg text-center">
        <p class="text-muted mb-0">© 2026 ErrandRunner. All rights reserved.</p>
      </div>
    </footer>

    
    <script>
      function loadClaimedTasks() {
        const container = document.getElementById('claimedTaskList');
        const claimed = JSON.parse(localStorage.getItem('claimedTasks') || '[]');
        
        if (claimed.length === 0) {
          container.innerHTML = '<div class="col-12"><p class="text-muted">No tasks claimed yet. Visit Browse Tasks to pick up neighborhood errands.</p></div>';
          return;
        }

        container.innerHTML = '';
        claimed.forEach((task, index) => {
          const isCompleted = task.status === 'Completed';
          const cardClass = isCompleted ? 'product-item h-100 completed-card' : 'product-item h-100';

          container.innerHTML += `
            <div class="col">
              <div class="${cardClass}">
                <figure>
                  <img src="${task.img}" alt="Task Thumbnail" class="tab-image">
                </figure>
                <div class="d-flex flex-column text-center">
                  <h3 class="fs-6 fw-normal">${task.title}</h3>
                  <div class="text-muted fs-7 mb-2">📍 ${task.location}</div>
                  <div class="d-flex justify-content-center align-items-center gap-2 my-2">
                    <span class="text-dark fw-semibold">${task.fee}</span>
                    <span class="badge border border-dark-subtle rounded-0 fw-normal px-1 fs-7 lh-1 ${isCompleted ? 'bg-success text-white' : 'text-body-tertiary'}">${task.status}</span>
                  </div>
                  
                  <div class="p-3 pt-0 text-start">
                    <div class="mb-2">
                      <label class="form-label fs-7 fw-bold">Order Status:</label>
                      <select class="form-select form-select-sm status-select" data-index="${index}" ${isCompleted ? 'disabled' : ''}>
                        <option value="In-Progress" ${task.status === 'In-Progress' ? 'selected' : ''}>In-Progress</option>
                        <option value="Completed" ${task.status === 'Completed' ? 'selected' : ''}>Completed</option>
                      </select>
                    </div>
                    <div class="mb-2">
                      <label class="form-label fs-7 fw-bold">Proof of Drop-off / Notes:</label>
                      <input type="text" class="form-control form-control-sm proof-input" data-index="${index}" value="${task.proof || ''}" placeholder="Confirmation notes/timestamp..." ${isCompleted ? 'disabled' : ''}>
                    </div>
                    <div class="d-grid gap-2 mt-2">
                      ${!isCompleted ? `<button class="btn btn-dark btn-sm save-progress-btn rounded-1" data-index="${index}">Save & Finalize</button>` : ''}
                      <button class="btn btn-outline-danger btn-sm cancel-task-btn rounded-1" data-index="${index}">${isCompleted ? 'Remove Finished Task' : 'Cancel Task'}</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          `;
        });

        
        document.querySelectorAll('.save-progress-btn').forEach(btn => {
          btn.addEventListener('click', function() {
            const idx = this.getAttribute('data-index');
            const card = this.closest('.product-item');
            const newStatus = card.querySelector('.status-select').value;
            const newProof = card.querySelector('.proof-input').value;

            if (newStatus === 'Completed' && !newProof.trim()) {
              alert('Please enter proof of drop-off / notes before marking as completed.');
              return;
            }

            claimed[idx].status = newStatus;
            claimed[idx].proof = newProof;
            localStorage.setItem('claimedTasks', JSON.stringify(claimed));
            alert('Task successfully finalized and marked as completed!');
            loadClaimedTasks();
          });
        });

        
        document.querySelectorAll('.cancel-task-btn').forEach(btn => {
          btn.addEventListener('click', function() {
            const idx = this.getAttribute('data-index');
            const msg = claimed[idx].status === 'Completed' 
              ? 'Remove this completed task from your active list?' 
              : 'Are you sure you want to cancel this claimed task? It will return to the open task board.';
              
            if (confirm(msg)) {
              claimed.splice(idx, 1);
              localStorage.setItem('claimedTasks', JSON.stringify(claimed));
              loadClaimedTasks();
            }
          });
        });
      }

      window.onload = loadClaimedTasks;
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>