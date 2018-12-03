<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/text', function () {
    return 'hello world';
});


Route::get('/json', function () {
    return ['name'=>'uday','age'=>40];
});


Route::get('/hello/{name}', function ($name) {
    return 'Your name is '.$name;
});


Route::get('/ctl','ClientController@index');

Route::get('/di','ClientController@di');

Route::get('/facades/db', function () {
    //alias of class
    return DB::select('select * from tbl');

});

Route::get('/facades/enc_dec', function () {
    //alias of class
    return Crypt::decrypt(Crypt::encrypt('uday'));
});
