<?php
echo $_POST['username'];
echo $_GET['username'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<form action="index.php" method="POST">
<input type="text" name="username">
<input type="submit" value="submit">
</form>
</body>
</html>
