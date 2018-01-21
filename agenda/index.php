<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/users/init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
if(isset($user) && $user->isLoggedIn()){
}
?>
<div id="page-wrapper">
<div class="container"><?php
    if ($user->isLoggedIn()) {
        if (hasPerm([2], $user->data()->id)) {
            ?>

            <div class="row" style="text-align:center;">



                <button class="btn btn-primary" data-toggle="modal" data-target="#ne">Create new event</button>
                <div class = "modal fade" id = "ne" tabindex = "-1" role = "dialog" aria-labelledby = "myModalLabel">
                    <div class = "modal-dialog">
                        <div class = "modal-content">
                            <div class = "modal-header">
                                <button type = "button" class = "close" data-dismiss = "modal">x</button>
                                <h2 class = "modal-title">New Event</h2>
                            </div>
                            <div class = "modal-body"><br>

                                <form action="newevent.php" method="POST">
                                    <h4>Title:</h4>
                                    <input class="form-control" type="text" name="title"><br /><br />
                                    <div class="form-group">
                                        <label for="day"><h4>Day:</h4></label>
                                        <select class="form-control" id="day" name="day">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                            <option>7</option>
                                            <option>8</option>
                                            <option>9</option>
                                            <option>10</option>
                                            <option>11</option>
                                            <option>12</option>
                                            <option>13</option>
                                            <option>14</option>
                                            <option>15</option>
                                            <option>16</option>
                                            <option>17</option>
                                            <option>18</option>
                                            <option>19</option>
                                            <option>20</option>
                                            <option>21</option>
                                            <option>22</option>
                                            <option>23</option>
                                            <option>24</option>
                                            <option>25</option>
                                            <option>26</option>
                                            <option>27</option>
                                            <option>28</option>
                                            <option>29</option>
                                            <option>30</option>
                                            <option>31</option>
                                        </select>
                                    </div>
<div class="form-group">
                                        <label for="month"><h4>Month:</h4></label>
                                        <select class="form-control" id="month" name="month">
                                            <option>Januari</option>
                                            <option>Februari</option>
                                            <option>March</option>
                                            <option>April</option>
                                            <option>May</option>
                                            <option>June</option>
                                            <option>July</option>
                                            <option>August</option>
                                            <option>September</option>
                                            <option>October</option>
                                            <option>November</option>
                                            <option>December</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="year"><h4>Year:</h4></label>
                                        <select class="form-control" id="year" name="year">
                                            <option>2018</option>
                                            <option>2019</option>
                                            <option>2020</option>
                                            <option>2021</option>
                                            <option>2022</option>
                                            <option>2023</option>
                                            <option>2024</option>
                                            <option>2025</option>
                                            <option>2026</option>
                                            <option>2027</option>
                                            <option>2028</option>
                                        </select>
                                    </div>

                                    <h4>Time:</h4>
                                    <input class="form-control" type="text" name="time"><br /><br />

                                    <h4>Short event description</h4>
                                    <textarea class="form-control" rows="5" type="text" name="descr"></textarea><br /><br />

                                    <h4>Facebook Event Link:</h4>
                                    <input class="form-control" type="text" value="https://facebook.com/vulpine.events/" name="fblink"><br /><br /><br />

                                    <button class = "btn btn-primary"  type="submit">Confirm</button></form>
                            </div>
                            <div class="modal-footer">


                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <br />

            <?php
        }
    }
    ?>

    <div class="row">
        <div class="col-xs-12 col-md-offset-2 col-md-8">
            <ul class="event-list">
                <?php
                $content = $db->query("SELECT * FROM agenda");
                $count = $content->count();
                if ($count > 0) {
                    $results = $content->results();
                }
                foreach ($results as $r):
                    ?>
                    <li>
                        <time datetime="<?php echo $r->datetime; ?>"><br />
                            <span class="day"><?php echo $r->day; ?></span>
                            <span class="month"><?php echo $r->month; ?></span>
                            <span class="year"><?php echo $r->year; ?></span>
                            <span class="time"><?php echo $r->time; ?></span><br />
                        </time>

                        <div class="info">
                            <h2 class="title"><?php echo $r->title; ?></h2><br />
                            <p class="desc"><?php echo $r->descr; ?></p><br />
                            <ul>
                                <?php
                                if ($user->isLoggedIn()) {
                                    
                                } else {
                                    ?>
                                    <li><a href="https://vulpine.events/users/join.php" style="color:#ffe43c"><span class="glyphicon glyphicon-pencil"></span> Login/Register. *</a></li>
                                    <?php
                                }


                                if ($user->isLoggedIn()) {
                                    if (hasPerm([1], $user->data()->id)) {
                                        $userid = $user->data()->id;

                                        $eventid = $r->id;

                                        $content = $db->query("SELECT * FROM attendees WHERE eventid = ? AND userid = ?", [$eventid, $userid]);
                                        $results = $content->results();
                                        $z = $query->results(true); //dump($z[0]);



                                        if ($z[0]) {
                                            ?>
                                            <li data-toggle="modal" data-target="#c<?php echo $r->id; ?>"><span class="glyphicon glyphicon-remove"></span>  Cancel my registration</li>
                                        <?php } else {
                                            ?>
                                            <li data-toggle="modal" data-target="#<?php echo $r->id; ?>"><span class="glyphicon glyphicon-ok"></span>  I'm going!</li>
                                            <?php
                                        }
                                    }
                                }
                                ?>           

                            </ul>
                        </div>
                        <div class="social">
                            <ul>
                                <li class="facebook" style="width:50%;"><a href="<?php echo $r->fblink; ?>"><span class="fa fa-facebook"></span></a></li>
                                <?php
                                if ($user->isLoggedIn()) {
                                    if (hasPerm([2], $user->data()->id)) {
                                        ?>
                                
                                
                                
                <div class = "modal fade" id = "e<?php echo $r->id; ?>" tabindex = "-1" role = "dialog" aria-labelledby = "myModalLabel">
                    <div class = "modal-dialog">
                        <div class = "modal-content">
                            <div class = "modal-header">
                                <button type = "button" class = "close" data-dismiss = "modal">x</button>
                                <h2 class = "modal-title">Edit event</h2>
                            </div>
                            <div class = "modal-body"><br>

                                <form action="eevent.php" method="POST">
                                    <h4>Title:</h4>
                                    <input class="form-control" type="text" name="title" value="<?php echo $r->title; ?>"><br /><br />
                                    <div class="form-group">
                                        <label for="day"><h4>Day:</h4></label>
                                        <select class="form-control" id="day" name="day"  value="">
                                            <option value="<?php echo $r->day; ?>" selected disabled hidden><?php echo $r->day; ?></option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                            <option>7</option>
                                            <option>8</option>
                                            <option>9</option>
                                            <option>10</option>
                                            <option>11</option>
                                            <option>12</option>
                                            <option>13</option>
                                            <option>14</option>
                                            <option>15</option>
                                            <option>16</option>
                                            <option>17</option>
                                            <option>18</option>
                                            <option>19</option>
                                            <option>20</option>
                                            <option>21</option>
                                            <option>22</option>
                                            <option>23</option>
                                            <option>24</option>
                                            <option>25</option>
                                            <option>26</option>
                                            <option>27</option>
                                            <option>28</option>
                                            <option>29</option>
                                            <option>30</option>
                                            <option>31</option>
                                        </select>
                                    </div>
<div class="form-group">
                                        <label for="month"><h4>Month:</h4></label>
                                        <select class="form-control" id="month" name="month" value="<?php echo $r->month; ?>">
                                            <option>Januari</option>
                                            <option>Februari</option>
                                            <option>March</option>
                                            <option>April</option>
                                            <option>May</option>
                                            <option>June</option>
                                            <option>July</option>
                                            <option>August</option>
                                            <option>September</option>
                                            <option>October</option>
                                            <option>November</option>
                                            <option>December</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="year"><h4>Year:</h4></label>
                                        <select class="form-control" id="year" name="year" <?php echo $r->year; ?>>
                                            <option>2018</option>
                                            <option>2019</option>
                                            <option>2020</option>
                                            <option>2021</option>
                                            <option>2022</option>
                                            <option>2023</option>
                                            <option>2024</option>
                                            <option>2025</option>
                                            <option>2026</option>
                                            <option>2027</option>
                                            <option>2028</option>
                                        </select>
                                    </div>

                                    <h4>Time:</h4>
                                    <input class="form-control" type="text" name="time" value="<?php echo $r->time; ?>"><br /><br />
                                    
                                    <h4>Short Description:</h4>
                                    <textarea class="form-control" rows="5" type="text" name="descr"><?php echo $r->descr; ?></textarea><br /><br />

                                    <h4>Facebook Event Link:</h4>
                                    <input class="form-control" type="text" value="<?php echo $r->fblink; ?>" name="fblink"><br /><br /><br />
                                    
                                    <input class="form-control hidden" type="text" name="agendaid" value="<?php echo $r->id; ?>">
                                    
                                    <button class="btn btn-remove" style="width:100%;" type="submit">Update Event</button></form>
                            </div>
                            <div class="modal-footer">


                            </div>

                        </div>
                    </div>
                </div>
                                        <button class="btn btn-remove google-plus a" style="width:100%;border-radius:0%;" data-toggle="modal" data-target="#e<?php echo $r->id; ?>"><span class="fa fa-pencil"></span></button>
                                    <?php } ?>
                                    <?php if (hasPerm([2], $user->data()->id)) {
                                        ?>
                                        <form action="revent.php" method="POST">
                                            <input name="agendaid" value="<?php echo $r->id; ?>" class="hidden">
                                            <input name="title" value="<?php echo $r->title; ?>" class="hidden">
                                            <button class="btn btn-remove google-plus a" style="width:100%;border-radius:0%;" type="submit"><span class="fa fa-remove"></span></button>
                                        </form> <?php
                                    }
                                }
                                ?>
                            </ul>
                        </div>
                    </li>
                    <div class = "modal fade" id = "<?php echo $r->id; ?>" tabindex = "-1" role = "dialog" aria-labelledby = "myModalLabel">
                        <div class = "modal-dialog">
                            <div class = "modal-content">
                                <div class = "modal-header">
                                    <button type = "button" class = "close" data-dismiss = "modal">x</button>
                                    <h2 class = "modal-title">Be warned!</h2>
                                </div>
                                <div class = "modal-body"><br>
                                    <p>By clicking confirm you register for this event. Please read the event rules carefully before registering! </p>
                                </div>
                                <div class="modal-footer">


                                    <form action="attend.php" method="POST">
                                        <input name="userid" value="<?php echo $user->data()->id; ?>" class="hidden">
                                        <input name="eventid" value="<?php echo $r->id; ?>" class="hidden">
                                        <input  name="going" value="y" class="hidden">
                                        <button class = "btn btn-primary"  type="submit">Confirm</button>
                                        <button type = "button" class = "btn btn-primary" data-dismiss = "modal">Close</button></form>


                                </div>
                            </div>
                        </div>
                    </div>
                    <div class = "modal fade" id = "c<?php echo $r->id; ?>" tabindex = "-1" role = "dialog" aria-labelledby = "myModalLabel">
                        <div class = "modal-dialog">
                            <div class = "modal-content">
                                <div class = "modal-header">
                                    <button type = "button" class = "close" data-dismiss = "modal">x</button>
                                    <h2 class = "modal-title">Be Warned!</h2>
                                </div>
                                <div class = "modal-body"><br>
                                    <p>By clicking confirm you'll cancel your registration for this event. Please read the above cancelation rules/fees carefully if present! </p>
                                </div>
                                <div class="modal-footer">
                                    <h3></h3>
                                    <p> </p>


                                    <form action="unattend.php" method="POST">
                                        <input name="userid" value="<?php echo $user->data()->id; ?>" class="hidden">
                                        <input name="eventid" value="<?php echo $r->id; ?>" class="hidden">
                                        <input  name="going" value="y" class="hidden">
                                        <button class = "btn btn-default"  type="submit">Confirm cancelation</button>
                                        <button type = "button" class = "btn btn-default" data-dismiss = "modal">Close</button></form>


                                </div>
                            </div>
                        </div>
                    </div>
<?php endforeach; ?>
            </ul>
        </div>
    </div>
    <?php
    if ($user->isLoggedIn()) {
        
    } else {
        ?>
        <p style="text-align:center;">* If you join our website and register, you can register for events with 1 click!</p>
<?php } ?>
    <div class="row">
        <div class="col-md-12">



            <style>
                .modal-content {
                    background-color: #333;
                    width: 100%;
                    border: 2px solid #600;
                    justify-content: center;
                    align-items: center;

                    outline: 0;
                    text-align: center;
                    overflow: visible;
                }
                .modal-footer {
                    align-items: center;
                    text-align: center;
                }
            </style>
        </div>
    </div>
</div>
</div>

<!-- Place any per-page javascript here -->
<script>
    $(document).ready(function () {
        $("#flip").click(function () {
            $("#panel").slideDown("slow");
        });
        $("#close").click(function () {
            $("#panel").slideUp("slow");
        });
    });
</script>
<script>
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>

<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->


<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
