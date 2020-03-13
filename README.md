# laravel-swoole-docker

Laravel swoole docker includes:

1. composer
2. PHP swoole extention

# Usage

## Use composer command

### Windows Container (CMD)
```
docker run --rm -i -t %cd%:/app cloudeasy/laravel-swoole-docker composer create-project --prefer-dist laravel/laravel myProject
```
### Linux Container
```
docker run --rm -i -t `pwd`:/app cloudeasy/laravel-swoole-docker composer create-project --prefer-dist laravel/laravel myProject
```

## Use Laravel artisan

### Basic (Linux)
```
docker run --rm -i -t `pwd`:/app cloudeasy/laravel-swoole-docker php artisan [command]
```

## Run Swoole

### Windows command
```
docker run -p 1215:1215 -v %cd%:/app cloudeasy/laravel-swoole-docker php artisan swoole:http start
```
### Linux command
```
docker run -p 1215:1215 -v pwd:/app cloudeasy/laravel-swoole-docker php artisan swoole:http start
```
