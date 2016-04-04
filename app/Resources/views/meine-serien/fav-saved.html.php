<!DOCTYPE>

<html>
<head>
</head>
<body>




<?php
$usr= $this->get('security.context')->getToken()->getUser();
print_r($usr);
?>


</body>
</html>
