<?php 
class Koneksi {
    public $conn;
    public function __construct() {
        $dsn = "pgsql:host=localhost;port=5432;dbname=odeo2;user=postgres;password=postgres";
        $this->conn = new PDO($dsn);
    }

    public function test() {
        if($this->conn){
            echo "Connected to the <strong></strong> database successfully!";
        }else {
            echo "failed";
        }
           
    }

    public function get_data($qry) {
        return $this->conn->query($qry);
    }

    public function insert_data($data) {
        $stmt = $this->conn->prepare("INSERT INTO oauth_email (destination,msg_body,user_id,created_date,updated_date)
                                    VALUES(:destination,:msg_body,:user_id,:created_date,:updated_date)");
        
        // pass values to the statement
        $stmt->bindValue(':destination', $data['to']);
        $stmt->bindValue(':msg_body', $data['msg']);
        $stmt->bindValue(':user_id', $data['user_id']);
        $stmt->bindValue(':created_date', date('Y-m-d H:i:s'));
        $stmt->bindValue(':updated_date', date('Y-m-d H:i:s'));
        
        // execute the insert statement
        $stmt->execute();
    }

    public function insert_account($data) {
        $stmt = $this->conn->prepare("INSERT INTO oauth_users (username,password,first_name,last_name,email)
                                    VALUES(:username,:password,:first_name,:last_name,:email)");
        
        // pass values to the statement
        $stmt->bindValue(':username', $data['username']);
        $stmt->bindValue(':password', password_hash(trim($data['password']),PASSWORD_BCRYPT));
        $stmt->bindValue(':first_name', $data['first_name']);
        $stmt->bindValue(':last_name', $data['last_name']);
        $stmt->bindValue(':email', $data['email']);
        
        // execute the insert statement
        $stmt->execute();
    }
}

?>