<?php include '../connection.php';
if (!isset($_SESSION['admin_id'])) {
  header("Location:../index.php");
}

if (isset($_GET['stat']) && isset($_GET['stat']) != '') {
  $stat = $_GET['stat'];
  $theid = $_GET['catId'];
  $sql = "UPDATE tbl_category SET status = $stat where category_id=$theid";
  $conn->query($sql);
}

?>

<!doctype html>

<html lang="en">
<?php include '../components/head.php' ?>

<body class=" layout-fluid">

  <div class="page">
    <!-- Navbar -->
    <?php include '../components/navbaradmin.php' ?>
    <?php include '../components/sidebar.php' ?>
    <div class="page-wrapper">
      <!-- Page header -->
      <div class="page-header d-print-none">
        <div class="container-xl">
          <div class="row g-2 align-items-center">
            <div class="col">
              <!-- Page pre-title -->
              <div class="page-pretitle">
                Overview
              </div>
              <h2 class="page-title">
                Category Panel
              </h2>
            </div>
            <!-- Page title actions -->
            <div class="col-auto ms-auto d-print-none">
              <div class="btn-list">
                <a href="#" class="btn btn-primary d-none d-sm-inline-block add">
                  <!-- Download SVG icon from http://tabler-icons.io/i/plus -->
                  <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                    <path d="M12 5l0 14" />
                    <path d="M5 12l14 0" />
                  </svg>
                  Create new category
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Page body -->
      <div class="page-body">
        <div class="container-xl">
          <div class="card">
            <div class="card-status-bottom bg-success"></div>
            <div class="card-body">
              <div id="listjs">
                <div class="d-flex align-items-center justify-content-between">
                  <div></div>
                  <div class="flex-shrink-0">
                    <input class="form-control listjs-search" id="search-input" placeholder="Search" style="max-width: 200px;" />
                  </div>
                </div>
                <br>
                <div id="pagination-container"></div>
                <div id="table-default" class="table-responsive">
                  <table class="table" id="tables">
                    <thead>
                      <tr>
                        <th>
                          <button class="table-sort" data-sort="sort-id">
                            #
                          </button>
                        </th>
                        <th>
                          <button class="table-sort" data-sort="sort-category">
                            Category Name
                          </button>
                        </th>
                        <th>
                          <button class="table-sort" data-sort="sort-status">
                            Status
                          </button>
                        </th>
                        <th>
                          <button class="table-sort">
                            Action
                          </button>
                        </th>
                        <th class="d-none"></th>
                        <th class="d-none"></th>
                      </tr>
                    </thead>
                    <tbody class="table-tbody">
                      <?php
                      $sql = "SELECT * from tbl_category order by category_id asc";
                      $rs = $conn->query($sql);
                      $i = 1;
                      foreach ($rs as $row) { ?>
                        <tr>
                          <td class="sort-id"><?php echo $i++ ?></td>
                          <td class="sort-category text-capitalize"><?php echo $row['category_name'] ?></td>
                          <td class="sort-status">
                            <?php
                            if ($row['status'] == 1) {
                              echo " <a href='?stat=0&catId=".$row['category_id']."'><span class='badge badge-sm bg-green text-white text-uppercase ms-auto'>Active</span></a>";
                            } else if ($row['status'] == 0) {
                              echo " <a href='?stat=1&catId=".$row['category_id']."'><span class='badge badge-sm bg-red text-white text-uppercase ms-auto'>Inactive</span></a>";
                            }
                            ?>

                          </td>
                          <td>
                            <a href="#" class="badge bg-yellow edit">
                              <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                <path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0" />
                                <path d="M6 21v-2a4 4 0 0 1 4 -4h3.5" />
                                <path d="M18.42 15.61a2.1 2.1 0 0 1 2.97 2.97l-3.39 3.42h-3v-3l3.42 -3.39z" />
                              </svg>

                            </a>
                          </td>
                          <td class="d-none"><?php echo $row['category_id'] ?></td>
                          <td class="d-none"><?php echo $row['status'] ?></td>
                        </tr>

                      <?php } ?>


                    </tbody>
                  </table>
                  <br>
                  <div class="btn-toolbar">
                    <p class="mb-0" id="listjs-showing-items-label">Showing 0 items</p>
                    <ul class="pagination ms-auto mb-0"></ul>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
      <?php include '../components/footer.php' ?>
    </div>
  </div>
  <?php include '../components/modal.php' ?>
  <?php include '../components/script.php' ?>

</body>
<?php include '../dist/xx_close_api_admin.php' ?>

</html>

<script>
  $(document).ready(function() {
    let id = 0;
    $(document).on('click', '.add', function() {
      $('#modal-category').modal('show');
      $('#categoryName').val('');
      $('.md-title').html('Insert Category');
      $('.my-switch').css('display', 'none');
    });

    $(document).on('click', '.edit', function() {
      let stat = '';
      $tr = $(this).closest('tr');
      var data = $tr.children("td").map(function() {
        return $(this).text();
      }).get();
      if (data[5] == 1) {
        stat = 'checked'
      } else {
        stat = ''
      }
      id = data[4];
      $('#modal-category').modal('show');
      $('#categoryName').val(data[1])
      $('.md-title').html('Update Category');
      $('.my-switch').css('display', 'block');
      $('#categoryStatus').prop('checked', stat);
    });



    $(document).on('click', '#submit', function(e) {
      e.preventDefault();
      let checkStatus = 0;
      var description = $('#categoryName').val();
      var status = $('#categoryStatus').prop('checked');
      if (status) {
        checkStatus = 1;
      } else {
        checkStatus = 0;
      }
      swal({
          title: "Are you sure?",
          text: "You want to add this data?",
          icon: "warning",
          buttons: true,
          dangerMode: true,
        })
        .then((isConfirm) => {
          if (isConfirm) {
            if (id === 0) {
              $.ajax({
                method: "POST",
                url: "../ajax/category.php",
                data: {
                  description: description,
                  action: 'ADD'
                },
                success: function(response) {
                  response = JSON.parse(response);
                  if (response.error) {
                    swal("Error", response.error, "error");
                  } else {
                    swal(response.success, {
                      icon: "success",
                    }).then((value) => {
                      location.reload();
                    });

                  }
                },
                error: function(xhr, status, error) {
                  swal("Error", error, "error");
                }
              });


            } else {
              $.ajax({
                method: "POST",
                url: "../ajax/category.php",
                data: {
                  id: id,
                  description: description,
                  status: checkStatus,
                  action: 'UPDATE'
                },
                success: function(response) {
                  response = JSON.parse(response);
                  if (response.error) {
                    swal("Error", response.error, "error");
                  } else {
                    swal(response.success, {
                      icon: "success",
                    }).then((value) => {
                      location.reload();
                    });

                  }
                },
                error: function(xhr, status, error) {
                  swal("Error", error, "error");
                }
              });
            }

          }
        });
    });



  });
</script>