<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/users/init.php';
require_once $abs_us_root . $us_url_root . 'users/includes/header.php';
require_once $abs_us_root . $us_url_root . 'users/includes/navigation.php';
if (isset($user) && $user->isLoggedIn()) {
    
}


$currentPage = 'galleries/' . currentPage();
$content1 = $db->query("SELECT * FROM pages WHERE page = ?", [$currentPage]);
$z1 = $content1->results(true);
?>

<link rel="stylesheet" href="../usersc/css/blueimp-gallery.css">
<link rel="stylesheet" href="../usersc/css/blueimp-gallery-indicator.css">
<link rel="stylesheet" href="../usersc/css/blueimp-gallery-video.css">

<div id="page-wrapper">
    <div class="container">
        <div class="row" style="text-align: center;">

            <h1><?php echo $z1[0]['title']; ?></h1><br />

            <!-- The Gallery as inline carousel, can be positioned anywhere on the page -->
            <div id="blueimp-gallery-carousel" class="blueimp-gallery blueimp-gallery-carousel">
                <div class="slides"></div>
                <h3 class="title"></h3>
                <a class="prev"><span class="glyphicon glyphicon-chevron-left gg"></span></a>
                <a class="next"><span class="glyphicon glyphicon-chevron-right gg"></span></a>
                <a class="play-pause"></a>
            </div>
            <br>

            <!-- The container for the list of example images -->

            <div id="links" class="links">
                <div class="row">
                    <?php
                    $content = $db->query("SELECT * FROM gallery WHERE gname = ?", [$z1[0]['title']]);
                    $count = $content->count();
                    if ($count > 0) {
                        $results = $content->results();
                    }
                    foreach ($results as $r):
                        ?>

                        <a href="<?php echo $r->ilink; ?>" title="<?php echo $r->gname; ?>" data-gallery="">
                            <div class="col-sm-3 col-xs-6" style="padding:5px;">
                                <img  class="img-thumbnail" src="<?php echo $r->ilink; ?>" alt="<?php echo $r->gname; ?>"></div>
                        </a>
<?php endforeach; ?>

                </div></div>
            <!-- The Gallery as lightbox dialog, should be a child element of the document body -->
            <div id="blueimp-gallery" class="blueimp-gallery">
                <div class="slides"></div>
                <h3 class="title"></h3>
                <a class="prev"><span class="glyphicon glyphicon-chevron-left gg"></span></a>
                <a class="next"><span class="glyphicon glyphicon-chevron-right gg"></span></a>
                <a class="close"><span class="glyphicon glyphicon-remove gg"></span></a>
                <a class="play-pause"></a>
                <ol class="indicator"></ol>
            </div>
            
            <?php
            if ($user->isLoggedIn()) {
                if (hasPerm([2], $user->data()->id)) {
                    ?>
            <li><a href="rgallery.php?pname=<?php echo "/", currentPage();?>&gname=<?php echo $z1[0]['title']?>">Remove Gallery</a></li>
                    <hr><div class="col-md-4 col-md-offset-4">
                        <fieldset>
                            <h2>Upload evenement foto's</h2><br />
                            <p>Kies alle foto's die je wilt uploaden en druk op "Versturen" </p>
                            <p>Let op! Je kan in totaal 128mb maximaal aan foto's tegelijk uploaden.</p>
                            <form name="form3" enctype="multipart/form-data" method="post" action="<?php $_SERVER['DOCUMENT_ROOT'] ?>/usersc/upload.php">
                                <p><input class="hidden" type="text" name="gname" value="<?php echo $z1[0]['pname']; ?>" /></p><br />
                                <p><input class="form-control" type="file" size="32" name="my_field[]" value="" multiple/></p><br />
                                <p class="button"><input type="hidden" name="action" value="addgallery" />
                                    <input class="btn btn-primary" type="submit" name="Submit" value="Versturen" /></p>
                            </form>
                        </fieldset>
                    </div>
    <?php }
} ?>
        </div>
    </div>
</div>

<script src="../usersc/js/blueimp-helper.js"></script>
<script src="../usersc/js/blueimp-gallery.js"></script>
<script src="../usersc/js/blueimp-gallery-fullscreen.js"></script>
<script src="../usersc/js/blueimp-gallery-indicator.js"></script>
<script src="../usersc/js/blueimp-gallery-video.js"></script>
<script src="../usersc/js/blueimp-gallery-vimeo.js"></script>
<script src="../usersc/js/blueimp-gallery-youtube.js"></script>
<script src="../usersc/js/jquery.blueimp-gallery.js"></script>
<script>
    blueimp.Gallery(
            document.getElementById('links').getElementsByTagName('a'),
            {
                container: '#blueimp-gallery-carousel',
                carousel: true
            }
    );

</script>
<?php
require_once $abs_us_root . $us_url_root . 'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls  
