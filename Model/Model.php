<?php

class Model
{
    protected $connection = null;
    public function __construct()
    {
        try {
            $this->connection = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE_NAME);
            if (mysqli_connect_errno()) {
                throw new Exception("Could not connect to database.");
            }
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    protected function isUserExist(string $email, string $phone)
    {
        $query = "SELECT id FROM mod_admin WHERE vEmail = '{$email}' OR vPhone = '{$phone}' LIMIT 1";
        $response =  $this->connection->query($query);
        return $response->num_rows;
    }
    protected function createData($table, $data)
    {
        $key = array_keys($data);
        $val = array_values($data);
        $sql = "INSERT INTO $table (" . implode(', ', $key) . ") "
            . "VALUES ('" . implode("', '", $val) . "')";
        return $this->connection->query($sql);
    }
}
