# Brownfield Of Dreams

![agriculture-clouds-cropland-461960](https://user-images.githubusercontent.com/40776966/52017905-fa5b4500-24a5-11e9-87b5-e68f349174fd.jpg)

This is the base repo for a brownfield project used at Turing for Backend Mod 3.

Project Spec and Evaluation Rubric: https://github.com/turingschool-examples/brownfield-of-dreams

### About the Project

This is a Ruby on Rails application used to organize YouTube content used for online learning. Each tutorial is a playlist of video segments. Within the application an admin is able to create tags for each tutorial in the database. A visitor or registered user can then filter tutorials based on these tags.

A visitor is able to see all of the content on the application but in order to bookmark a segment they will need to register. Once registered a user can bookmark any of the segments in a tutorial page.

## Local Setup

First you'll need to setup an API key with YouTube and have it defined within `ENV['YOUTUBE_API_KEY']`. There will be one failing spec if you don't have this set up.

Clone down the repo
```
$ git clone
```

Install the gem packages
```
$ bundle install
```

Install node packages for stimulus
```
$ brew install node
$ brew install yarn
$ yarn add stimulus
```

Set up the database
```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

Run the test suite:
```ruby
$ bundle exec rspec
```

## API Setup
We need to run Figaro to create a hidden .yml file to store our API keys locally

```
$ bundle exec figaro install
```

Within config/application.yml, add the following keys:

YOUTUBE_API_KEY:
GITHUB_API_KEY:

GITHUB_OATH_CLIENT_ID:
GITHUB_OATH_CLIENT_SECRET:

PASSWORD: *random set of characters*

* FRIEND_1:     `friend from your github profile`
* FRIEND_2:     `friend from your github profile`
* NOT_FRIEND:   `non-friend from your github profile`
* REPO_1:       `repo from your github profile`
* ME:           `your github username`

## Contributors

* Justin Clark  [https://github.com/jpclark6](https://github.com/jpclark6)
* J Aaron Brooks Roberts  [https://github.com/abroberts5](https://github.com/abroberts5)

## Deployment

Our app is deployed on heroku at:

* [http://brownfield-of-dreams-1810.herokuapp.com](http://brownfield-of-dreams-1810.herokuapp.com/)

## Technologies
* [Stimulus](https://github.com/stimulusjs/stimulus)
* [will_paginate](https://github.com/mislav/will_paginate)
* [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on)
* [webpacker](https://github.com/rails/webpacker)
* [vcr](https://github.com/vcr/vcr)
* [selenium-webdriver](https://www.seleniumhq.org/docs/03_webdriver.jsp)
* [chromedriver-helper](http://chromedriver.chromium.org/)

### Versions
* Ruby 2.4.1
* Rails 5.2.0
