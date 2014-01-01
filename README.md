# Ruby on Rails Tutorial: sample application

This is the sample application for
[*Ruby on Rails Tutorial: Learn Web Development with Rails*](http://railstutorial.org/)
by [Michael Hartl](http://michaelhartl.com/). You can use this reference implementation to help track down errors if you end up having trouble with code in the tutorial. In particular, as a first debugging check I suggest getting the test suite to pass on your local machine:

    $ cd /tmp
    $ git clone https://github.com/railstutorial/sample_app_rails_4.git
    $ cd sample_app_rails_4
    $ cp config/database.yml.example config/database.yml
    $ bundle install
    $ bundle exec rake db:migrate
    $ bundle exec rake db:test:prepare
    $ bundle exec rspec spec/

If the tests don't pass, it means there may be something wrong with your system. If they do pass, then you can debug your code by comparing it with the reference implementation.


rails generate scaffold Entity entity_name:string
bundle exec rake db:migrate

rails generate scaffold Trait trait_name:string
bundle exec rake db:migrate

rails generate scaffold Standard standard_name:string
bundle exec rake db:migrate

rails generate scaffold Observation project:references entity:references
bundle exec rake db:migrate

rails generate scaffold Measurement observation:references trait:references value:string
bundle exec rake db:migrate

rails generate migration add_standard_to_measurement standard:references
bundle exec rake db:migrate

rails generate scaffold Context project:references observation:references has_context:references
bundle exec rake db:migrate

rails generate scaffold D measurement:references value:string
bundle exec rake db:migrate

rails generate scaffold row project:references
bundle exec rake db:migrate

rails generate scaffold point row:references measurement:references value:string
bundle exec rake db:migrate
