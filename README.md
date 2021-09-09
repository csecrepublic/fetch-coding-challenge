# Fetch Rewards - Coding Challenge
## Description
This site allows the user to earn and spend points associated with a particular partner.

There are 3 paths: */points* (homepage), */add,* and */spend.* A GET request for */add* and */spend* will yield forms for adding and spending points, respectively (can also be accessed by the Add and Spend Points buttons on the homepage). A POST request for */add* and */spend* will return the user to the homepage with updated points values, assuming all form fields are valid. HTML form validation is provided in the ERB files. (Note: for the */add* page, the user can choose to add their own timestamp or use the current time. There is no "seconds" field for user input because it did not seem practical for the user.)

There are 2 tables in the database. The **Payers** table contains information about each payer and the number of points connected to them. The **PayerTransactions** table contains information about each transaction, including the payer, the number of points, and the timestamp. When the user adds points, the controller checks the Payers table for an existing payer, and either updates their points or creates a new record. 

When the user spends points, the controller orders the PayerTransactions table by timestamp and loops through each record in the table. If the payer with the oldest transaction timestamp has enough points to spend, the payer's points are updated in the Payers table and the loop is terminated; otherwise, the loop moves onto the next transaction. If no payers have enough points to spend, or if the PayerTransactions table is empty, the controller returns an error message.

## Technologies
* Ruby
* Sinatra
* ActiveRecord

I initially planned to use Ruby on Rails for this project, but I realized I didn't need that level of robustness. Sinatra is a much lighter-weight framework that also offers well-documented database support through ActiveRecord.

## No connection issue
When the app is run locally, it fails to establish a connection with the Payers table. I have tried a couple things to remedy this: I checked Stack Overflow to see if anyone had had similar problems, and most of the answers said that a table will not establish a connection until it's being used. I tried to establish a connection by creating a new Payer record in IRB, but I was getting the same error. Any call to a rake command would produce an error as well. I tried following a few beginner's tutorials to make sure my `config` and `environment` files were set up correctly, and I triple-checked all my file paths. 

Originally, I mapped out the program with POROs (plain old Ruby objects) so that I could get the site up and running and really understand my algorithm before transferring everything to ActiveRecord, which is a newer framework for me. The site was working fine (though obviously not storing any information after each HTTP request), so I know the issue is with the database.

## Other issues & ideas
* More robust form validation
* Refactor controller code into models

## Instructions
1. [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/). You can check if Ruby is already installed by running `ruby -v` in the terminal.
2. Download the zip file of this project (or clone the repository).
3. Navigate to the project and run `bundle install` in the terminal.
4. Run the app locally by typing `shotgun`. (If this gives you an error, you may need to restart the terminal or run `bundle update`.)
5. Copy and paste the URL from your terminal into the browser to access the site on your local server.
6. Welcome to the site! To stop running the local server, type Ctrl-C in the terminal.

## Credits
All Ruby and database knowledge comes from the wonderful [Odin Project](https://www.theodinproject.com/). Other resources: the [Sinatra framework](http://sinatrarb.com/) and the many helpful Ruby/Sinatra/ActiveRecord tutorials out there.
