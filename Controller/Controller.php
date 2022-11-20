<?php

class Controller extends Model
{
    use Helper;

    public function __call($name, $arguments)
    {
        header("HTTP/1.1 404 Not Found");
    }

    public function loginUserAction()
    {
        $postData  = $this->getPostQueryParams();
        $postParam = [
            'email'     => 'vEmail',
            'password'  => 'vPassword',
        ];
        $prepareData = [];
        $err = false;
        foreach ($postData as $k => $val) {
            if (empty($val)) {
                $err = true;
            }
            $prepareData[$postParam[$k]] = $val;
        }
        if ($err == true) $this->sendOutput(['message' => "required parameter empty"], 429);
        try {
            $response = $this->selectData('mod_admin', ["id", "vName AS `name`", "vPhone AS `phone`,vPassword AS `password`"], $prepareData);
            if ($response && is_object($response)) {
                if ($response->num_rows > 0) {
                    $responseData = $response->fetch_assoc();
                    $this->sendOutput(["data" => (object) $responseData, "message" => "Login :)"], 200);
                } else {
                    $this->sendOutput(['message' => "Invalid User", "data" => (object) []], 401);
                }
            }
        } catch (Exception $e) {
            $this->sendOutput(["message" => "Something Went Wrong"], 500);
        }
    }

    public function fetchRoomAction()
    {
        try {
            $response = $this->selectData('pg_rooms', ["id", "vPGname AS `name`", "tPGLocation AS address", "vPGsqfeet AS sqfeet", "vPGRent AS rent", "tBedRooms AS bedroom", "tBathrooms AS bathroom", "tKitchen AS kitchen", "tParking AS parking", "tAbout AS about", "tImage AS imageUrl"]);
            if ($response->num_rows > 0) {
                $responseData = [];
                while ($data = $response->fetch_object()) {
                    $responseData[] = $data;
                }
                $this->sendOutput(["data" => $responseData, "message" => ":)"], 200);
            } else {
                $this->sendOutput(['message' => "No Pg", "data" => (object) []], 404);
            }
        } catch (Exception $e) {
            $this->sendOutput(["message" => "Something Went Wrong"], 500);
        }
    }

    public function addUserAction()
    {
        $postData  = $this->getPostQueryParams();
        $postParam = [
            'fullname' => "vName",
            'email' => "vEmail",
            'phone' => "vPhone",
            'password' => "vPassword"
        ];
        $prepareData = [];
        $err = false;
        foreach ($postData as $k => $val) {
            if (empty($val)) {
                $err = true;
            }
            $prepareData[$postParam[$k]] = $val;
        }

        if ($err == true) $this->sendOutput(['message' => "required parameter empty"], 429);

        try {
            if ($this->isUserExist($prepareData['vEmail'], $prepareData['vPhone']) < 1) {
                $insert_id = $this->createData('mod_admin', $prepareData);
            } else {
                $this->sendOutput(['message' => "User already exist"], 200);
            }
        } catch (Exception $e) {
            $this->sendOutput(['message' => "Something went wrong"], 500);
        }

        if ($insert_id and $insert_id > 0) {
            $this->sendOutput(['message' => "register sucessfully", "data" => $postData], 200);
        }
        $this->sendOutput(['message' => "required parameter empty"], 429);
    }
}
