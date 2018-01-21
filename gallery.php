<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/users/init.php';
require_once $abs_us_root . $us_url_root . 'users/includes/header.php';
require_once $abs_us_root . $us_url_root . 'users/includes/navigation.php';
if (isset($user) && $user->isLoggedIn()) {
    
}
?>
<div id="page-wrapper">
    <div class="container">
        <div class="row" style="text-align: center; justify-content: center;">
            <div class="col-md-12">

                <h1>Vulpine Events Galerij</h1><br />

                <?php
                $gpage = '1';
                $content = $db->query("SELECT * FROM pages WHERE gpage = ?", [$gpage]);
                $count = $content->count();
                if ($count > 0) {
                    $results = $content->results();
                }
                foreach ($results as $r):
                    $pname = $r->title;
                    $content1 = $db->query("SELECT * FROM gallery WHERE gname = ?", [$pname]);
                    $results1 = $content1->results();
                    $z1 = $content1->results(true);
                    ?>

                    <a href="<?php echo $r->page; ?>" title="<?php echo $r->title; ?>">
                        <div class="col-sm-3 col-xs-6" style="padding:5px;">
                            <img  class="img-thumbnail" src="galleries/<?php echo $z1[0]['ilink'] ?>" alt="<?php echo $r->title; ?>"><br /><?php echo $r->title; ?></div>
                    </a>
                <?php endforeach; ?>
            </div>
            <?php
            if ($user->isLoggedIn()) {
                if (hasPerm([2], $user->data()->id)) {
                    ?>
                    <div class="col-md-12"><hr><br />
                        <h2>Maak een nieuwe galerij aan</h2><br />

                        <div class="col-md-4 col-md-offset-4">

                            <fieldset>
                                <p>Kies de galerij naam en alle foto's die je wilt uploaden en klik op "Versturen" </p>
                                <br />
                                <h3>Galerij Naam:</h3><br />
                                <form name="form3" enctype="multipart/form-data" method="post" action="usersc/upload.php">
                                    <p><input class="form-control" type="text" name="gname" placeholder="'Furwalk Oss 06-2013' of 'Camping Trip 08-2016'" /></p><br />
                                    <p><input class="form-control" type="file" size="32" name="my_field[]" value="" multiple/></p><br />
                                    <p>Let op! Je kan in totaal 128mb maximaal aan foto's tegelijk uploaden. Wil je toch nog extra foto's? Deze kan je op de aangemaakte galerij onderaan de pagina alsnog uploaden.</p><br />
                                    <p class="button"><input type="hidden" name="action" value="cgallery" />
                                        <input class="btn btn-primary" type="submit" name="Submit" value="Versturen" /></p>
                                </form>
                            </fieldset>
                        </div>

                    </div>
                <?php }
            } ?>
        </div>
    </div>
</div>
<!-- footers -->
<?php require_once $abs_us_root . $us_url_root . 'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls    ?>

<!-- Place any per-page javascript here -->

