# JSCLook

 This application displays joint stock companies from Poland. There you can see data such as stock indices, shareholder list, etc.

##  Currently the site is under construction, but you can see a beta version on [jsclook.herokuapp.com](https://jsclook.herokuapp.com/)

App is build on Ruby 3.1.2

## Installation:

1. Download repository

2. Install Ruby, for more information visit [https://www.ruby-lang.org/](https://www.ruby-lang.org/).  
   You need to have also `nodejs` and `yarn`:  
   
     [https://nodejs.org/](https://nodejs.org/)  
     [https://yarnpkg.com/](https://yarnpkg.com/)

3. Install gems. Go to main directory of this repository and run from command line:

    If you do not have installed bundler already, install it by running command:

       gem install bundler

    then install gems :

       bundle install

4. App needs PostgreSQL database, you can find it at [https://www.postgresql.org/](https://www.postgresql.org/)

5. When you have installed PostgreSQL then create user with password for app, in PostgreSQL:

       username: jsclook
       password: 'jsclookRails'

     user and password are set in `/config/database.yml`

    Information how to create user in PostgreSQL you can find by read PostgreSQL documentation.

6.  Database creation:

    go to main directory of this repository and run from command line:

        bin/rails db:setup
      
7. Instal esbuild and bootstrap:

   go to main directory of this repository and run from command line:
   
        bin/rails javascript:install:esbuild
        bin/rails css:install:bootstrap
        
8. Edit `"scripts"` in `package.json` :

       "scripts": {
          "build": "esbuild app/javascript/*.* --bundle --sourcemap --outdir=app/assets/builds --public-path=assets --loader:.js=jsx",
          "build:css": "sass ./app/assets/stylesheets/application.bootstrap.scss ./app/assets/builds/application.css --no-source-map --load-path=node_modules"
       }

9. Now start the server by running the following command from command line in the app's main directory:

       bin/rails server

    app should start server on your local machine,

    you can access site from your browser http://localhost:3000/.

---------------------------------------------------------------------
Data sources: [GPW](gpw.pl) , [Money.pl](money.pl)
