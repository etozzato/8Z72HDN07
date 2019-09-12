# README for z72hdn07

[Live demo on Heroku](https://z72hdn07.herokuapp.com)

## Development Setup

#### Requirements

* ruby-2.6.3
* bundler
* node >= 6.5.0

```
# clone the repository and bundle
$ git clone git@github.com:etozzato/Z72HDN07.git
$ cd Z72HDN07/

$ bundle install
$ yarn install --check-files

# create your dotenv file and edit database_username and database_password
$ cp .env.development.sample .env.development

# create and migrate the database
$ bundle exec rake db:create db:migrate

$ rails s
```

## Testing Setup

#### Requirements

* capybara
* Selenium::WebDriver - [HOW TO INSTALL](https://github.com/mozilla/geckodriver)
* bundler
* node >= 6.5.0


```
# create your dotenv file and edit database_name,
# database_username and database_password for TEST
$ cp .env.development.sample .env.test

# create and migrate the testing database
$ RAILS_ENV=test bundle exec rake db:create db:migrate

# enjoy the test coverage
$ rspec spec -fd
```

## Deployment (HEROKU)

```
# create the app (sorry, name is taken)
$ heroku create z72hdn07

# add the remote from the app
$ heroku git:remote -a z72hdn07

# set the buildpacks
$ heroku buildpacks:set heroku/ruby -a z72hdn07

$ heroku buildpacks:set heroku/nodejs -a z72hdn07

# provision the database
$ heroku addons:create heroku-postgresql:hobby-dev -a z72hdn07

# push to the remote for deployment
$ git push heroku master
```
#### Heroku notes:

To activate AWS storage, change the line in `production.rb` from `:local` to `:amazon`, on Heroku `:local` storage works for demo purposes, but the storage is ephemeral and might be wiped between deployments

```
config.active_storage.service = :local
# config.active_storage.service = :amazon
```

Also, don't forget to set the required variables:

```
access_key_id
secret_access_key
region
bucket
```
