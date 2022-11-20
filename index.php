<?php

require __DIR__ . "/inc/index.php";

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = explode('/', $uri);
if ((isset($uri[2]) && $uri[2] != 'v1') || !isset($uri[3])) {
    header("HTTP/1.1 404 Not Found");
    exit();
}
$controller = new Controller();
$strMethodName = $uri[3] . 'Action';
$controller->{$strMethodName}();
