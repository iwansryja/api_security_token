<?php
$tns = "  
(DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = yourip)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVICE_NAME = orcl)
    )
  )
       ";
$db_username = "youname";
$db_password = "yourpassword";
try{
    $conn = new PDO("oci:dbname=".$tns,$db_username,$db_password);
}catch(PDOException $e){
    echo ($e->getMessage());
}
?>
