<?php

if (function_exists('oci_connect')) {
    echo 'OCI8 is working!';
}
else {
    echo 'Whoopss...not working!';
}

//phpinfo();

?>
