<?php

	class UserSession {
    
        public function __construct(){
        	if(session_status() == PHP_SESSION_NONE){
        		session_start();
            }
        }
        
        public function create($userId, $firstName, $lastName, $email){
        	$_SESSION["user"] = [
                'UserId'    => $userId,
                'FirstName' => $firstName,
                'LastName'  => $lastName,
                'Email'     => $email
            ];
        }
        public function isAuthenticated(){
            //si l'utilisateur est connecté = on a un index user dans $_SESSION et on a qqch dans $_SESSION["user"] = return true, sinon false
            if (array_key_exists('user', $_SESSION) && empty($_SESSION['user']) == false)
            {
                return true;
            }
            else 
            {
                return false;
            }
        }
        public function getFullName(){
            if ($this->isAuthenticated() == true)
            {
                return $_SESSION['user']['FirstName']." ".$_SESSION['user']['LastName'];
            }
        }
        public function getId(){
            if ($this->isAuthenticated() == true)
            {
                return $_SESSION['user']['UserId'];
            }
        }
        public function destroy()
        {
            $_SESSION = [];
            session_destroy();
        }
    }