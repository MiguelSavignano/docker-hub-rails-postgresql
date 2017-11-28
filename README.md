# Dockerize Rails for development

Ruby 2.3.1, bundle, node 8.9.1, postgresql-client.

Image with default lib for rails 5.1.4

This image not execute bundle install, you need to run bundle install after run the container

# Using docker-compose
```ỳml
version: '3'
services:
  web:
    image: miguelsavignano/rails_5.1.4_postgresql
    container_name: web
    stdin_open: true
    tty: true
    command: "bash ./web_start.sh"
    volumes:
      - .:/myapp
      - ./volumes/bundle:/usr/local/bundle
    ports:
      - "3000:3000"
    depends_on:
      - db
    network_mode: host
  db:
    image: postgres:9.5.9
    ports:
      - "5432:5432"
    volumes:
      - ./volumes/postgresql:/var/lib/postgresql/data
```

database.yml
```yml
....
  adapter: postgresql
  encoding: unicode
  host: 127.0.0.1
  username: postgres
  password:
....
```

# Use custom start script
create file web_start.sh with
```sh
bundle install
npm install
rm -f tmp/pids/server.pid
bundle exec rails server -p 3000 -b 0.0.0.0
```

# Notes

## Execute container bash terminal
use rails console, rails generators, or rake 
```sh
docker exec -it web bash
```

## Debugger Rails with bybug or pry
- you need to attach the in the container.
 important: if you close the terminal with CTRL + C you stop the container

```sh
docker attach web
```

