<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Client;
class ClientController extends Controller
{
    private $c;

    function __construct(Client $c){
        $this->c=$c;
    }


    function index(){
        return 'Hello form controller';
    }

    function di(){

            return $this->c->all();
    }
}
