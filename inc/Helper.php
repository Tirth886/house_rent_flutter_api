<?php

trait Helper
{
    public function getQueryParams(string $key = "")
    {
        if (isset($_GET[$key])) return $_GET[$key];
        return $_GET;
    }
    public function getPostQueryParams(string $key = "")
    {
        if (isset($_POST[$key])) return $_POST[$key];
        return $_POST;
    }
    public function sendOutput(array|Object $data = [],  int $code = 200)
    {
        header_remove('Set-Cookie');
        header('Content-Type: application/json; charset=utf-8');
        http_response_code($code);

        $format = [
            "message" => "",
            "data"    => [],
        ];
        $data = array_merge($format,$data);

        echo json_encode($data);
        exit;
    }
}
