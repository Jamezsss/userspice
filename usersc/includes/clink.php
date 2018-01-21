<?php
$data1 = $db->query("SELECT * FROM articles WHERE ID = '$idNumber' ");
$result = $data1->results();
$z = $data1->results(true); //dump($z[0]);
$title = $z[0]["title"];
$content = $z[0]["content"];
?>
