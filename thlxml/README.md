
These lines needto be added to the  file:

```xml
<tomcat-users>
    <role rolename="manager-gui"/>
    <user username="tomcatadmin" password="tomcat2009" roles="admin,admin-gui,manager-gui"/>
</tomcat-users>
```

Tutorial on simple tomcat in docker:
https://github.com/softwareyoga/docker-tomcat-tutorial
