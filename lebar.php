<?php
include 'bdd_connection.php';

if(!empty($_POST)){
$errors = '';
$myemail = 'karasadwali@gmail.com';
if(empty($_POST['name'])  ||
   empty($_POST['email']) ||
   empty($_POST['message']))
{
    $errors .= "\n Error: all fields are required";
}
$name = $_POST['name'];
$email_address = $_POST['email'];
$message = $_POST['message'];
if (!preg_match(
"/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/i",
$email_address))
{
    $errors .= "\n Error: Votre address mail est invalide";
}

if( empty($errors))
{
// $to = $myemail;
// $email_subject = "Contact form submission: $name";
// $email_body = "Vous avez reçu un nouveau message. ".
// " le détail:\n Name: $name \n ".
// "Email: $email_address\n Message \n $message";

// $test = mail($to,$email_subject,$email_body);
$to      = 'karasadwali@gmail.com';
$subject = $name;
$message = $message;
$headers = 'From: '.$email_address . "\r\n" .
    'Reply-To:'.$email_address . "\r\n" .
    'X-Mailer: PHP/' . phpversion();

    $test =mail($to, $subject, $message, $headers);

}
}



$template="lebar";

include 'layout.phtml';