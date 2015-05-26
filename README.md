== README

This rails application emulates parking with flexible levels amount and flexible parking spaces for motobikes and cars.

Empty space for vehicle is possible by find the vehicle, clicking for necessary link for details and click 'Leave'.

* Ruby version: 2.1.1

* Rails version: 4.1.5

* How to run:
```
  bundle install
  rake db:create
  rake db:migrate
  rake db:populate # to populate db with fake data
  rails s
```

* Database: uses usual sqlite - keeping it simple

* How to run the test suite: run ```rspec```
