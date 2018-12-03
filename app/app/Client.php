<?php

namespace App;



class Client
{
    private $clients=[['name'=>'google'],['name'=>'aws'],['name'=>'microsoft']];

    public function all(){
        return $this->clients;
    }
}
