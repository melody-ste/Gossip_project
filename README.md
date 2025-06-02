# The Gossip Project

## Description

This is a Sinatra web application for our **Gossip Project**.

Inside this repository, you'll find:
- A `db` folder that stores the data in a CSV file,
- A `lib` folder containing the core logic:
  - A `views/` folder with all `.erb` view templates,
  - A `gossip.rb` file containing the `Gossip` class and related methods,
  - A `controller.rb` file that manages routes and user interaction,
- A `config.ru` file to launch the app with Rack.

## How to run 

To start the application:

1. Run `bundle install` to install dependencies.
2. Then launch the app with the command:  
   ```bash
   rerun 'rackup -p 4567'
3. Open your browser and go to http://localhost:4567 to see the website.
