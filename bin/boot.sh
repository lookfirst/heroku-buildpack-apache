#!/bin/bash

erb_function() {
	stripped="${0%.*}"
	erb $0 > $stripped
}

echo "Processing erb files..."
export -f erb_function
find /app/apache/conf -type f -name "*.erb" | xargs -n 1 bash -c 'erb_function "$@"'

for var in `env|cut -f1 -d=`; do
	echo "PassEnv \$var" >> /app/apache/conf/httpd.conf;
done

touch /app/apache/logs/error_log
touch /app/apache/logs/access_log
tail -F /app/apache/logs/error_log &
tail -F /app/apache/logs/access_log &

echo "Launching apache..."
exec /app/apache/bin/httpd -DNO_DETACH
