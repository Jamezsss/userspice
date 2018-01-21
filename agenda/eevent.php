<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/users/init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
if(isset($user) && $user->isLoggedIn()){
}


$id = $_POST['agendaid'];
$title = $_POST['title'];
$day = $_POST['day'];
$month = $_POST['month'];
$year = $_POST['year'];
$time = $_POST['time'];
$descr = $_POST['descr'];
$fblink = $_POST['fblink'];

$content1 = $db->query("SELECT * FROM agenda WHERE id = ?", [$id]);
$results = $content1->results();
$z1 = $content1->results(true); //dump($z[0]);

error_reporting(E_ERROR | E_PARSE | E_CORE_ERROR);
?>

<div id="page-wrapper">
<div class="container">
<div class="row">

<?php
if ($z1) {

    $field = array('title' => $title, 'day' => $day, 'month' => $month, 'year' => $year, 'time' => $time, 'descr' => $descr, 'fblink' => $fblink); //column_name=>entry 
    $db->update('agenda', $id, $field);
    echo '<div style="text-align:center;">Evenement is succesvol gewijzigd.<br /><br />Je wordt automatisch binnen 5 seconden teruggestuurd naar de vorige pagina.</div>';
    header("refresh:5;url=index.php");

} else {

    echo '<div style="text-align:center;">Er is iets fout gegaan...</div';
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
