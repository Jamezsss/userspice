<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/users/init.php';
require_once $abs_us_root . $us_url_root . 'users/includes/header.php';
require_once $abs_us_root . $us_url_root . 'users/includes/navigation.php';
if (isset($user) && $user->isLoggedIn()) {
    
}


$pname = $_GET['pname'];
$gname = $_GET['gname'];


$content = $db->query("SELECT * FROM gallery WHERE gname = ?", [$gname]);
$count = $content->count();
if ($count > 0) {
    $results = $content->results();
}
foreach ($results as $r):
    $ilink = $r->ilink;
    
    unlink($ilink);
        $db->query("DELETE FROM gallery WHERE gname = ?", [$gname]);
        $db->query("DELETE FROM pages WHERE title = ?", [$gname]);
        unlink('../galleries' . $pname);
    

endforeach;
header('Location: ../index.php');
?>
<!-- footers -->
<?php require_once $abs_us_root . $us_url_root . 'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls  ?>

<!-- Place any per-page javascript here -->


<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; // currently just the closing /body and /html  ?>



