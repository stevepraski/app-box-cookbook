<!DOCTYPE html>
<head>
<title>Guest Registration</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<h2>Guest Registration</h2>
<ul>
<form name="insert" action="index.php" method="POST" >
<li>Guest Name:</li><li><input type="text" name="guest_name" /></li>
<li><input type="submit" name="submit"/></li>
</form>
</ul>
<h2>Previous Guests</h2>
<table style="width:75%">
  <tr>
    <th>Guest ID</th>
    <th>Guest Name</th>
  </tr>
<?php
function db_connect() {
  static $connection;
  if(!isset($connection)) {
    $config = parse_ini_file('../config.ini'); 
    $connection = pg_connect(
      "host=" . $config['server'] . " " .
      "user=" . $config['username'] . " " .
      "password=" . $config['password'] . " " .
      "dbname=" . $config['dbname']);
    $sql = "CREATE TABLE IF NOT EXISTS GUESTS (
    id SERIAL PRIMARY KEY NOT NULL,
    guest_name CHAR(50) NOT NULL)";
    pg_query($connection, $sql);
  }
  return $connection;
}
$conn = db_connect();
$result = pg_query($conn, "SELECT * FROM GUESTS");
while ($row = pg_fetch_assoc($result)) {
    echo "<tr>";
    echo "<td>" . $row['id'] . "</td>";
    echo "<td>" . $row['guest_name'] . "</td>";
    echo "</tr>";
}
?>
</table>
</body>
</html>
<?php

if (isset($_POST['submit'])) {
$conn = db_connect();
$sql = "INSERT INTO GUESTS (guest_name) VALUES ('$_POST[guest_name]')";
$result = pg_query($conn, $sql);
echo "<meta http-equiv='refresh' content='0'>";
}
?>
