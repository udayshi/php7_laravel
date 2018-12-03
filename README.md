# Laravel
PHP 7.2 with laravel build for docker with xdebug,redis pdo. By default x-debug is disabled you can enabled/disable from docker-compose.yml  
```
    volumes:
        - "./manifest/config/nginx.conf:/etc/nginx/nginx.conf:ro"
        - "./manifest/config/x-debug.ini:/usr/local/etc/php/conf.d/x-debug.ini:ro"
        - "./manifest/config/supervisord.conf:/etc/supervisor/conf.d/supervisord.conf:ro"
        - "./manifest/app:/app"
```

## Useful Commands
```
composer create-project --prefer-dist laravel/laravel app
php artisan serve
composer install
php artisan down 
php artisan up

php artisan cache:clear

php artisan make:controller ClientController //app/Http/Controllers
php artisan make:model Client //app/Http/Client.php #Without migration
php artisan make:model Client -m #Also create migration file in database/
php artisan make:provider MyServiceProvider #app/Provider/  #Register on config/app.php provider
```
## Getting Started

 ```
 docker-compose up -d
 ```


## Connect to Container
 ```
 ./connect
 ```

## Build Container
 ```
 ./build.sh
 ```

## Configure X-Debug on PHPStorm
#### Preference -> PHP -> Servers
    1. + (ADD)
	   Name: Give the project Name
	   
	   Host: php.docker
	   

    2. Check Use path mappings
       
       Select the path of source where it mounted
       host_dir:/container_dir
       www/my_project:/app

#### Run -> Edit Configuration
    1. + (ADD) PHP Remote Debug
	    
	    Name: Give Debugger Name (Project Name Debug)
	   
	    Server: Select project which we have just created
	    
	    Idk key(session id): docker (if you change on x-debug.ini change it.
        
        
        
    