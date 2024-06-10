<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "ELC";

    $connect = new mysqli($servername, $username, $password, $dbname);


        $_username = mysqli_real_escape_string($connect, $_POST['username']);
        $_password = mysqli_real_escape_string($connect, $_POST['password']);

        $query = "INSERT INTO `registereduser` (`username`, `password`) VALUES ('$_username', '$_password')";
        $results = mysqli_query($connect, $query);

        if($results) {
            echo "User added successfully";
        } else {
            echo "Error: " . mysqli_error($connect);
        }
?>


