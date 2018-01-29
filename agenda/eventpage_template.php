<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/users/init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
if(isset($user) && $user->isLoggedIn()){
}

$currentPage = currentPage();
$content1 = $db->query("SELECT * FROM agenda WHERE page = ?", [$currentPage]);
$z1 = $content1->results(true);
$idNumber = $z1[0]['id'];
?>


<div id="page-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-md-12 center econtent" style="border-bottom: 2px solid black;">
                <?php include 'includes/info.php'; ?>
            </div>

        </div> <!-- /.row -->
        <div class="row">
            <div class="col-md-12 econtent">
                <div class="col-md-4 lside"><br />
                    <?php include 'includes/date.php'; ?>
                    <br /><hr>
                    <h3><b>Location:</b></h3>
                    <?php include 'includes/location.php'; ?>
                </div><br />
                <div class="col-md-8" >
                    <div class="col-md-6">
                        <h4><b>Extra Info:</b></h4>
                        <?php include 'includes/einfo.php'; ?>
                    </div>
                    <div class="col-md-6 center">
                        <h4><b>Price Info:</b></h4>
                        <?php include 'includes/price.php'; ?>
                    </div>
                </div>

            </div>
        </div>
        <div class="row econtent">
            <div class="col-md-12 fimg" style="height: 300px;">

            </div>
        </div>


    </div> <!-- /container -->

</div> <!-- /#page-wrapper -->

<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->


<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
