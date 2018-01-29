<?php
require_once  $_SERVER['DOCUMENT_ROOT'] . '/users/init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
if(isset($user) && $user->isLoggedIn()){
}

$redirect = $_POST['redirect'];
$price = $_POST['price'];
$id = $_GET['id'];

$fields = array('price' => $price);
$db->update('agenda', $id, $fields);

error_reporting(E_ERROR | E_PARSE | E_CORE_ERROR);

if ($db) {
    header("Location:../" . $redirect);
}// End of if profile is ok 
else {

    $msg = " Database problem, please contact site admin ";
}

?>

<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->


<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
