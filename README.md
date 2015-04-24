# heroku-buildpack-apache

1. Create a top level .apache folder in your Heroku project.
1. heroku buildpack:set https://github.com/lookfirst/heroku-buildpack-apache
1. If you want to specify the version of apache, add a file called .apache.cfg
  1. export APACHE_VERSION=2.4.12
1. Anything in the `.apache/conf` folder is copied over the apache default conf folder in /app/apache/conf.
  1. Anything with a suffix of .erb is processed through erb so that you can do variable replacement.
