<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/users/init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
if(isset($user) && $user->isLoggedIn()){
}


$going = $_POST['going'];
$eventid = $_POST['eventid'];
$userid = $_POST['userid'];
$content1 = $db->query("SELECT * FROM attendees WHERE eventid = ? AND userid = ?", [$eventid, $userid]);
$results1 = $content1->results();
$z1 = $content1->results(true); //dump($z[0]);

error_reporting(E_ERROR | E_PARSE | E_CORE_ERROR);
?>

<div id="page-wrapper">
<div class="container">
<div class="row">

<?php
if ($z1) {

    $db->query("DELETE FROM attendees WHERE eventid = ? AND userid = ?", [$eventid, $userid]);
    echo '<div style="text-align:center;">Je hebt je succesvol uitgeschreven. Hopelijk tot het volgende evenement!<br /><br />Je wordt automatisch binnen 5 seconden teruggestuurd naar de vorige pagina.</div>';
    header("refresh:5;url=index.php");
    
} else {
    
    echo '<div style="text-align:center;">Je bent al uitgeschreven op dit evenement.<br /><br />Je wordt automatisch binnen 5 seconden teruggestuurd naar de vorige pagina.</div>';
    header("refresh:5;url=index.php");
    
}
?>
</div>
</div>
</div>
<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->


<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
