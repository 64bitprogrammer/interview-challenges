<?php
require_once 'credentials.php';
// MySQL connection file along with necessary functions for DB access.
// error_reporting(E_ALL);
// ini_set('display_errors', 1);
session_start();

$host = 'localhost';

$conn = mysqli_connect($host, DB_USERNAME, DB_PASSWORD, DATABASE) or die("Failed to create db connection");

?>