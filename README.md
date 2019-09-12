# README for z72hdn07

## Development Setup



## Deployment (HEROKU)

```
$ heroku create z72hdn07

$ heroku git:remote -a z72hdn07

$ heroku buildpacks:set heroku/ruby -a z72hdn07

$ heroku buildpacks:set heroku/nodejs -a z72hdn07

$ heroku addons:create heroku-postgresql:hobby-dev -a z72hdn07

$ git push heroku master
```
