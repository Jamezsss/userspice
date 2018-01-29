<?php $cname = 'info'; ?>
<div class="article" id="e<?php echo $cname ?>"><h1><b><?php echo $z1[0]['title'] ?></b></h1><br /><?php echo $z1[0]['descr'] ?></div>

<?php
if ($user->isLoggedIn()) {
    if (hasPerm([2], $user->data()->id)) { 
        
        ?>
<div class="edit-btn" id="ee<?php echo $cname ?>"><br>
    <button class="btn btn-primary" onclick="edit('<?php echo $cname ?>')" type="button">Edit</button>
</div>
<div class="edit article hidden" id="<?php echo $cname ?>">
    <form class="form-group" id="postForm" action="<?php $_SERVER['DOCUMENT_ROOT']?>/agenda/processes/uinfo.php?id=<?php echo $z1[0]['id'] ?>" method="POST" enctype="multipart/form-data">
        <input class="form-control hidden" name="redirect" value="<?php echo $currentPage ?>">
        <h2><input class="form-control" name="title" value="<?php echo $z1[0]['title'] ?>"></h2>
        <textarea class="click2edit form-control" name="descr"><?php echo $z1[0]['descr'] ?></textarea>
        <button id="save" class="btn btn-primary" onclick="save('<?php echo $cname ?>')" type="submit">Save</button>
        <button id="save" class="btn btn-primary" onclick="cancel('<?php echo $cname ?>')" type="button">Cancel</button>

    </form>
</div>
<?php
    
}} ?>