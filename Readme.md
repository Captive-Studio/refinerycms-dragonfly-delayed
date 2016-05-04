# Refinery CMS Dragonfly Delayed

Generate Images Thumbnails in background processing jobs

## Requirements

Refinery CMS 2.x

## Install

Open up your ``Gemfile`` and at the bottom, add this line:

```ruby
gem 'refinerycms-dragonfly-delayed'
```

Now, run ``bundle install``

Next, to install the blog plugin run:

    rails generate refinery:dragonfly_delayed

Run database migrations:

    rake db:migrate
    
## Running Jobs

* In your Procfile, add the following line to configure the worker process :

```
worker: rake jobs:work
```

* Configure a worker process on your hosting environment

