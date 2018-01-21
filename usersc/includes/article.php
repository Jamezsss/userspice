<div class="article" id="e<?php echo $idNumber; ?>"><h2><?php echo $title; ?></h2><br /><?php echo $content; ?></div>

<?php
if ($user->isLoggedIn()) {
    if (hasPerm([2], $user->data()->id)) { ?>
<div class="edit-btn" id="ee<?php echo $idNumber; ?>"><br>
    <button class="btn btn-primary" onclick="edit(<?php echo $idNumber; ?>)" type="button">Edit</button>
</div>
<div class="edit article hidden" id="<?php echo $idNumber; ?>">
    <form class="form-group" id="postForm" action="<?php $_SERVER['DOCUMENT_ROOT']?>/usersc/cupdate.php?id=<?php echo $idNumber; ?>" method="POST" enctype="multipart/form-data">
        <h2><input class="form-control" name="title" value="<?php echo $title; ?>"></h2>
        <textarea class="click2edit form-control" name="content"><?php echo $content; ?></textarea>
        <button id="save" class="btn btn-primary" onclick="save($idNumber)" type="submit">Save</button>
        <button id="save" class="btn btn-primary" onclick="cancel($idNumber)" type="button">Cancel</button>

    </form>
</div>
<?php
    
}} ?>
