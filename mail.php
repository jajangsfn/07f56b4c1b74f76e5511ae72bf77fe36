<?php
// Load Composer's autoloader
require 'vendor/autoload.php';

// Import PHPMailer classes into the global namespace
// These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

class Mail {
    public $to;
    public $msg;

    public function __construct($to,$msg) {
        $this->to = $to;
        $this->msg = $msg;
    }

    public function send_mail() {
        //Create a new PHPMailer instance
        $mail = new PHPMailer();

        //Tell PHPMailer to use SMTP
        $mail->isSMTP();

        //Set the hostname of the mail server
        $mail->Host = 'smtp.gmail.com';
        // use
        // $mail->Host = gethostbyname('smtp.gmail.com');
        // if your network does not support SMTP over IPv6

        //Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
        $mail->Port = 587;

        //Set the encryption mechanism to use - STARTTLS or SMTPS
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;

        //Whether to use SMTP authentication
        $mail->SMTPAuth = true;

        //Username to use for SMTP authentication - use full email address for gmail
        $mail->Username = 'sofian.informatika@gmail.com';

        //Password to use for SMTP authentication
        $mail->Password = 'Rahasia1211';

        //Set who the message is to be sent from
        $mail->setFrom('sofian.informatika@gmail.com', 'First Last');


        //Set who the message is to be sent to
        $mail->addAddress($this->to, 'John Doe');

        //Set the subject line
        $mail->Subject = 'PHPMailer GMail SMTP test';

        //Read an HTML message body from an external file, convert referenced images to embedded,
        //convert HTML into a basic plain-text alternative body
        //Send HTML or Plain Text email
        $mail->isHTML(true);

        $mail->Subject = "Subject Text";
        $mail->Body = "<i>".$this->msg."</i>";

        //Replace the plain text body with one created manually
        $mail->AltBody = 'This is a plain-text message body';

        //send the message, check for errors
        if (!$mail->send()) {
            echo json_encode(array(
                            "msg"=>'Mailer Error: ' . $mail->ErrorInfo,
                            "result"=>false)
                        );
        } else {
            echo json_encode(array("msg"=>'Message sent!',"result"=>true));
        }
    }
}
?>