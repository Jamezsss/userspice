<div class="article" id="e<?php echo $idNumber ?>">
    <div class="day"><b><?php echo $z1[0]['day'] ?></b></div>
    <div class="month"><?php echo $z1[0]['month'] ?></div>
    <div class="year"><b><?php echo $z1[0]['year'] ?></b></div>
    <div class="time"><?php echo $z1[0]['time'] ?></div>
</div>

<?php
if ($user->isLoggedIn()) {
    if (hasPerm([2], $user->data()->id)) { ?>
<div class="edit-btn" id="ee<?php echo $idNumber ?>"><br>
    <button class="btn btn-primary" onclick="edit(<?php echo $idNumber ?>)" type="button">Edit</button>
</div>
<div class="edit article hidden" id="<?php echo $idNumber ?>">
    <form class="form-group" id="postForm" action="<?php $_SERVER['DOCUMENT_ROOT']?>/agenda/processes/udate.php?id=<?php echo $z1[0]['id'] ?>" method="POST" enctype="multipart/form-data">
        <input class="form-control hidden" name="redirect" value="<?php echo $currentPage ?>">
        <input class="form-control" name="day" value="<?php echo $z1[0]['day'] ?>">
        <input class="form-control" name="month" value="<?php echo $z1[0]['month'] ?>">
        <input class="form-control" name="year" value="<?php echo $z1[0]['year'] ?>">
        <input class="form-control" name="time" value="<?php echo $z1[0]['time'] ?>">
        <button id="save" class="btn btn-primary" onclick="save($idNumber)" type="submit">Save</button>
        <button id="save" class="btn btn-primary" onclick="cancel($idNumber)" type="button">Cancel</button>

    </form>
</div>
<?php
    
}} ?>