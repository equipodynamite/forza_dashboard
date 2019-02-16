# Forza Dashboard
Financial and Operational Dashboard for Forza Gym's management and customers to track their progress. Developed for Web Development Lab by Team Dynamite Members in collaboration with Forza.

## Table of contents

- [Forza Dashboard](#forza-dashboard)
  - [Table of contents](#table-of-contents)
  - [Project Details](#project-details)
    - [Client Details](#client-details)
    - [The Team](#the-team)
    - [Environment URLS](#environment-urls)
    - [Management tools](#management-tools)
  - [Development](#development)
    - [Installation and Setup](#installation-and-setup)
    - [Running the stack for development](#running-the-stack-for-development)
    - [Stopping services](#stopping-services)
    - [Running specs](#running-specs)

## Project Details

### Client Details

| Name  | Email | Role | 
| ------------- | ------------- | ------------- |
| Guillermo Monrreal | guillermo@forzagravitygym.com | Product Owner |

### The Team

| Name  | Email | GitHub Handle | Role |
| ------ | ------ | ------ | ------- |
| Adán Villarreal | adanvillarreal0@gmail.com | [@adanvillarreal](https://github.com/adanvillarreal) | Backend Lead |
| Héctor Morales | hectormgdev@gmail.com | [@HectorMg](https://github.com/HectorMg) | Frontend Lead |
| Javier de la Garza | javierdelagarza96@gmail.com | [@javier96](https://github.com/javier96) | Lead Architect|
| José Eduardo Sánchez | gallo.sanchez23@gmail.com | [@gallosanchez23](https://github.com/gallosanchez23) | Testing Lead|


### Environment URLS

* **Production** - [https://www.not.yet](https://www.not.yet)

### Management tools

You should ask for access to this tools if you don't have it already:

* [Github repo](https://github.com/equipodynamite/forza_dashboard)
* [Heroku]()

## Development

### Installation and Setup

Before setting up our project, make sure you've installed the following tools:

+ [Git](https://git-scm.com/downloads)
+ [Docker (Choose your platform)](https://runnable.com/docker/getting-started/)
+ [Docker Compose](https://docs.docker.com/compose/install/)
+ [plis](https://github.com/IcaliaLabs/plis) (not necessary but highly recommended, it will save you a lot of typing and executing container commands)


1. Once you've covered the required third-party software installations, clone the repository to your machine, using either:

SSH:

```bash
git clone git@github.com:equipodynamite/forza_dashboard.git
```

or HTTPS:
```bash
git clone https://github.com/equipodynamite/forza_dashboard.git
```

2. You'll need to create the `.env`:

```bash
$ cd forza_dashboard
$ touch .env
```

This repository includes a template for this file (`example.env`), but you need the ENV variable values to run the project. 
***You need to get the content for this file from [@HectorMg](https://github.com/HectorMg).***

3. Run the web service in bash mode

**Remember**, anything you'd regularly do directly in the command line for Rails (`rails db:create`, `rails generate model`, `rails generate controller`, etc..), you must now do inside the `web` service's container. Git and Docker commands must happen outside the container's bash mode (regular shell). 

In order to enter bash mode for the `web` service, you can use any of the following commands:

`plis`:

```bash
$ plis run web bash
```

`docker-compose`:

```bash
$ docker-compose run web bash
```

4. Every time you start the application, it is important that you make sure the `mariadb` service is running, otherwise, Rails won't be able to connect to the database. This is usually achieved with the "global" `docker-compose up` or `plis start` command, but it can also be done in isolation. Also, the first time you do this, you must also create the database in the `web` service.

Starting the mariadb service in isolation and in the background:

`plis`:

```bash
$ plis start mariadb
```

`docker-compose`:

```bash
$ docker-compose up -d mariadb
```

Then enter the `web` service container to create the database:

`plis`:
```bash
$ plis run web bash
```


`docker-compose`:
```bash
$ docker-compose run web bash
```

When you're inside the container:

```bash
root@-:~ rails db:create
```

After completing this step for the first time, you'll only need to explicitly run the `mariadb` service when performing database-related operations and you won't have to create the database everytime you start the `web` service.

To exit a bash session inside a controler:

```bash
root@-:~ exit
```

### Running the stack for development

1. Fire up the terminal and run:

`plis`:

```bash
$ plis start web && plis attach web
```

`docker-compose`:

```bash
$ docker-compose up 
```

To start the application and keep the web server output on the command line (for debugging). Use `Ctrl+C` to exit an attached service (this also kills the service). The plis command can be broken up in two. Once a service is running, you can `plis attach [service]` to see the live logs. Otherwise, use the following command(s) to run all services in the background:

`plis`:

```bash
$ plis start
```
`docker-compose`:

```bash
$ docker-compose up -d 
```


### Stopping services

In order to stop `forza_dashboard` entirely you can execute:

`plis`:

```bash
$ plis stop
```

`docker-compose`:

```bash
$ docker-compose stop
```

or (to stop and remove all the containers)

`plis`:

```bash
$ plis down
```

`docker-compose`:

```bash
$ docker-compose down
```

If you only wish to stop one service (services are listed in `docker-compose.yml`) in particular:

`plis`:

```bash
$ plis stop [service_name]
```

`docker-compose`:

```bash
$ docker-compose stop web
```

### Running specs

To run specs, you can do:

`plis`:

```bash
$ plis run test rspec
```

`docker-compose`:

```bash
$ docker-compose run test rspec
```

Or for a specific file:

`plis`:

```bash
$ plis run test rspec spec/models/user_spec.rb
```

`docker-compose`:

```bash
$ docker-compose run test rspec spec/models/user_spec.rb
```

You can also do:

```bash
$ plis run test bash
```

And do all the `rspec` operations inside the container's bash console so you don't have to run the service's bash every time.










