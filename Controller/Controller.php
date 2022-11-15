<?php

class Controller extends Model
{
    use Helper;

    public function __call($name, $arguments)
    {
        header("HTTP/1.1 404 Not Found");
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
