# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version<br>`ruby 3.2.2 (2023-03-30 revision e51014f9c0) [arm64-darwin21]ruby 3.2.2 (2023-03-30 revision e51014f9c0) [arm64-darwin21]`

* System dependencies
  ```ruby
  group :development, :test do
    # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
    gem "debug", platforms: %i[ mri mingw x64_mingw ]
    gem "pry"
    gem "rspec-rails"
    gem "capybara"
    gem "launchy" # save_and_open_page
    gem "simplecov"
    gem 'shoulda-matchers', '~> 5.0'
  end

  group :test do
    gem 'orderly'
  end
  ```

* Configuration
  ```bash
  bundle install
  ```

* Database creation/initialization
  ```bash
  rails db:{drop,create,migrate,seed}
  ```

* How to run the test suite
  ```bash
  bundle exec rspec
  ```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
