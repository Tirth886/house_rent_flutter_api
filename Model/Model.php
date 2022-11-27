<?php

class Model
{
    use Helper;
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
    protected function selectData(string $table, array|string $from, array $condition = [])
    {
        if (empty($from)) return;

        if (is_array($from)) {
            $from = implode(",", $from);
        } else {
            return;
        }

        $query = " SELECT {$from} FROM {$table} ";
        $length = count($condition);
        $i = 1;
        if ($length > 0) {
            $query .= " WHERE ";
        }
        $cond = "AND";
        foreach ($condition as $k => $v) {
            if ($length == $i) {
                $cond = "";
            }
            $query .= " {$k} = '{$v}' {$cond} ";
            $i++;
        }
        return $this->connection->query($query);
    }
    protected function isUserExist(string $email, string $phone): int
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

    protected function pgPrice(int $rid): int|float
    {
        $query = "SELECT vPGRent as price FROM pg_rooms WHERE id = '{$rid}' LIMIT 1";
        $response = $this->connection->query($query);
        if ($response->num_rows > 0) {
            $response = $response->fetch_object();
            return (float) $response->price;
        } else {
            return 0;
        }
    }
}
