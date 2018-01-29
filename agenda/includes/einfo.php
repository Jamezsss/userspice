<?php $cname = 'infoe'; ?>
<div class="article" id="e<?php echo $cname ?>"><?php echo $z1[0]['einfo'] ?></div>

<?php
if ($user->isLoggedIn()) {
    if (hasPerm([2], $user->data()->id)) { 
        
        ?>
<div class="edit-btn" id="ee<?php echo $cname ?>"><br>
    <button class="btn btn-primary" onclick="edit('<?php echo $cname ?>')" type="button">Edit</button>
</div>
<div class="edit article hidden" id="<?php echo $cname ?>">
    <form class="form-group" id="postForm" action="<?php $_SERVER['DOCUMENT_ROOT']?>/agenda/processes/ueinfo.php?id=<?php echo $z1[0]['id'] ?>" method="POST" enctype="multipart/form-data">
        <input class="form-control hidden" name="redirect" value="<?php echo $currentPage ?>">
        <textarea class="click2edit form-control" name="einfo"><?php echo $z1[0]['einfo'] ?></textarea>
        <button id="save" class="btn btn-primary" onclick="save('<?php echo $cname ?>')" type="submit">Save</button>
        <button id="save" class="btn btn-primary" onclick="cancel('<?php echo $cname ?>')" type="button">Cancel</button>

    </form>
</div>
<?php
    
}} ?>