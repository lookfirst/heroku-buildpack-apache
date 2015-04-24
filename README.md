# heroku-buildpack-apache

## Welcome

Oddly, there isn't a good buildpack just for apache. I looked around and didn't find anything that compiled apache from source code and used the latest version of apache (or let you specify a version).

I needed a specific build that included support for webdav and I wanted to ensure that the compiled output was cached so that only the first deployment is slow.

## Instructions

1. Create a top level `.apache` folder in your Heroku project.
1. `heroku buildpack:set https://github.com/lookfirst/heroku-buildpack-apache`
  1. You may want to use this in conjunction with the [buildpack-multi](https://github.com/ddollar/heroku-buildpack-multi).
1. If you want to specify the version of apache, add a file called .apache.cfg
  1. `export APACHE_VERSION=2.4.12`
1. Put Apache configuration into `.apache/conf`
  1. The contents of this folder is copied over the apache default conf folder in `/app/apache/conf`
  1. Anything with a suffix of `.erb` is processed through `erb` for variable replacement.

## TODO

1. Make it easy to set the `./configure` settings via `.apache.cfg`
