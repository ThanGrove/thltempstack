A Temp THL Stack to test php and git and xml

To deploy, make swarm is init. Then do:

```shell
docker-compose build 
docker stack deploy --compose-file docker-compose.yml thlpts
```

(`thlpts` stand for thl-php-tomcat-solr) Then,use `ngrok` (https://ngrok.com/) to expose localhost:81 and take using that domain 
with the path `update.php`, add it as a web hook to the test xml repo 
setting the webhook path to something like:

```shell
http://0b9923kdce8c11c.ngrok.io/update.php
```

Whateverthe domain is given by ngrok.

Problems I've encountered are that the /var/www/thlxml folder needs to have its 
owner set to `www-data:www-data` which I have added to the PHP dockerfile. 

Currently, I have the PHP and XML containers sharing the XML data so that PHP can respond 
to the hook and update, but XML can display it in simulation of the current 
THL Site.

TODO: need to get it to index in Solr and/or hook it up to the real THL stack
