# Observations and Measurements Database (OBOE)

This is the first application for the
[*Observations and Measurement Tutorial*](http://railstutorial.org/)
initiated by [Joshua Madin](http://acropora.bio.mq.edu.au/joshua-madin).

The project was built on Michael Hartl's sample_app_rails_4 from github, using these commands:

    $ cd /tmp
    $ git clone https://github.com/railstutorial/sample_app_rails_4.git
    $ cd sample_app_rails_4
    $ cp config/database.yml.example config/database.yml
    $ bundle install
    $ bundle exec rake db:migrate

# Projects

Projects are a way of separating datasets.  This simply has a name and an "enterer", who is just one of the users defined in the Hartl tutorial.

    $ rails generate scaffold Project project_name:string user_id:references
    $ bundle exec rake db:migrate

# Entities

Entities are things that can be observed and measured, such as corals, time, locations, etc.
  
    $ rails generate scaffold Entity entity_name:string
    $ bundle exec rake db:migrate

# Traits

Traits (or characteristics) are aspects of entities that can be measured, such as height, color, name, etc.

    $ rails generate scaffold Trait trait_name:string
    $ bundle exec rake db:migrate

# Standards

Standards relate a measurement value to a prescribed scale or category, such as metre, pH, rank, etc.

    $ rails generate scaffold Standard standard_name:string
    $ bundle exec rake db:migrate

# Observations

Observations are made of entities, and are required to make measurements of traits.

    $ rails generate scaffold Observation project:references entity:references
    $ bundle exec rake db:migrate

# Measurements

Measurements bind a value and standard to a trait of an observed entity.  Note that we do not consider values here, because we are creating a measurement "template".  Data (values) come in later.

    $ rails generate scaffold Measurement observation:references trait:references #value:string
    $ bundle exec rake db:migrate

    $ rails generate migration add_standard_to_measurement standard:references
    $ bundle exec rake db:migrate

# Context

Observations can provide context for oner another.  For example, a location can provide context for a coral.

    $ rails generate scaffold Context project:references observation:references has_context:references
    $ bundle exec rake db:migrate

# Data row

Traits (or characteristics) are aspects of entities that can be measured, such as height, color, name, etc.  A data row belongs to a project and is used to bind together sets of measurements (data points).

    $ rails generate scaffold row project:references
    $ bundle exec rake db:migrate

# Data point

A data point belongs to a data row (so a project) and references a measurement, giving it a value.  Note that the standard is given above in the measurement model.  This needs some thought, because it means that one can't be flexible about the measurement standard used.  Also, a data point should ecentually bind a resource (i.e., where the value came from, such as a report or scientific paper).

    $ rails generate scaffold point row:references measurement:references value:string
    $ bundle exec rake db:migrate


# Git and Heroku

    $ git remote add origin https://github.com/jmadin/oboe.git

    $ git add .
    $ git commit -m "New commit."
    $ git push -u origin master

    $ bundle install --without production
    $ git commit -a -m "Update Gemfile.lock for Heroku."
    $ heroku login
    $ heroku create
    $ rake assets:precompile
    
    $ RAILS_ENV=production rake assets:precompile
    
    $ git commit -a -m "Add precompiled assets for Heroku."

    $ git push heroku master
    $ heroku run rake db:migrate

    $ heroku rename obme
    $ heroku open


git remote add heroku git@heroku.com:agile-headland-8674.git