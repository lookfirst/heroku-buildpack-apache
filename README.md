# heroku-buildpack-apache

This is a [Heroku buildpack](https://devcenter.heroku.com/articles/buildpacks) for [apache httpd](http://httpd.apache.org/) that enables you to easily specify the version, compilation arguments and configuration files. The output of the compilation step is cached to speed up future deployments.

This buildpack only handles compiling and configuring Apache, so you may want to use this in conjunction with  [buildpack-multi](https://github.com/ddollar/heroku-buildpack-multi).

## Usage

1. `heroku buildpack:set https://github.com/lookfirst/heroku-buildpack-apache`
1. Create a top level `.apache` folder in your Heroku project
1. Add a file called `.apache.cfg` to the `.apache` folder
  1. Specify a version: `export APACHE_VERSION=2.4.12`
  1. Customize apache compile `configure` arguments: `export CONFIGURE_ARGS="--enable-foo"`
    1. Do not specify `--prefix`
1. Put Apache configuration into the `.apache/conf` folder
  1. The contents of this folder are copied over the apache configuration folder in `/app/apache/etc/apache2`
  1. Anything with a suffix of `.erb` is processed through `erb` for environment variable replacement (`<%= ENV["PORT"] %>`)
1. Push your project to heroku: `git push heroku master`
