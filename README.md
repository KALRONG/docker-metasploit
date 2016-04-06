Metasploit in Docker
====================

Debian Stretch based metasploit docker image.

Important consideration:
-----

By default this image connect to a postres server called postgres-msf, I run a separated docker the official postgres image.

IT WILL WORK EVEN WITHOUT THE SERVER BUT YOU WILL SEE AN ERROR TRYING TO CONNECT TO THE DB AT START.

This are the settings used by default, you need to create the user and the DB on the postgres server:

```
development: &pgsql
  adapter: postgresql
  database: msf_database
  username: msf_user
  password: pleasechangeme
  host: postgres-msf
  port: 5432
  pool: 200
  timeout: 5

production: &production
  <<: *pgsql
```

If you want to change any of this you can either connect to the docker and modify the database.yml inside:

```
docker run -it kalrong/metasploit-framework /bin/bash
```

Or you can clone the git repository, modify the database.yml file and build the image yourself:

```
docker build -t kalrong/metasploit-framework .
```

Updates:
--------

I will try to keep the image as updated as possible, if you want to request and update simply open an issue on the github and I will run the build asap.
