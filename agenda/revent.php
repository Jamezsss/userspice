<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/users/init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
if(isset($user) && $user->isLoggedIn()){
}


$id = $_POST['agendaid'];
$title = $_POST['title'];

$content1 = $db->query("SELECT * FROM agenda WHERE id = ? AND title = ?", [$id, $title]);
$results1 = $content1->results();
$z2 = $content1->results(true); 


error_reporting(E_ERROR | E_PARSE | E_CORE_ERROR);
?>

<div id="page-wrapper">
<div class="container">
<div class="row">

<?php
if ($z2) {
  
    $db->delete('agenda',array('id','=',$id));
   // $db->query("DELETE FROM agenda WHERE agendaid = ? AND title = ?", [$agendaid, $title]);
    echo '<div style="text-align:center;">Je hebt het evenement succesvol verwijderd.<br /><br />Je wordt automatisch binnen 5 seconden teruggestuurd naar de vorige pagina.</div>';
    header("refresh:5;url=index.php");
    
} else {
    
    echo '<div style="text-align:center;">Evenement bestaat niet (meer).<br /><br />Je wordt automatisch binnen 5 seconden teruggestuurd naar de vorige pagina.</div>';
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
