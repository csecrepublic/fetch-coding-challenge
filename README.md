# Fetch Rewards - Coding Challenge
## Description
This site allows the user to earn and spend points associated with a particular partner.

There are 3 paths: */points* (homepage), */add,* and */spend.* A GET request for */add* and */spend* will yield forms for adding and spending points, respectively (can also be accessed by the Add and Spend Points buttons on the homepage). A POST request for */and* and */spend* will return the user to the homepage with updated points values, assuming all form fields are valid. HTML form validation is provided in the ERB files. 

The **Payer** class contains instance variables for the payer's name and the number of points connected to them, as well as methods for spending and adding points. The **Transaction** class contains instance variables for the payer's name, the amount of points added/spent, the timestamp, and a reference to a transaction with the next-oldest timestamp.

The **PayerTransactions** class contains 2 hashes: a hash of Payers, using the payer name as the key and a Payer object as the value; and a hash of Transactions, using a transaction ID as the key and a Transaction object as the value. Adding points requires updating the Payers hash (if the payer does not already exist) and adding an entry to the Transactions hash. 

Spending points requires the program to check whether a) the payer with the oldest transaction has enough points to spend, and b) if they do not, whether there are any payers with newer timestamps who do have enough points. I chose to include a reference in each Transaction to the "next-oldest" transaction so that, if the payer responsible for the oldest transaction did not have enough points to spend, the program would recursively call the spend method on the next oldest transaction. This saved me the time and space required to maintain, say, a sorted array of transaction IDs. If there are no older transactions, a message is displayed telling the user that they do not have enough points in their balance.


STACK OF TRANSACTION IDS

## Technologies
* Ruby
* Sinatra

I initially planned to use Ruby on Rails for this project, but I realized I didn't need that level of robustness. Sinatra is a much lighter-weight framework that also offers database support.

## Issues & ideas
* More robust form validation

## Instructions
1. [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/). You can check if Ruby is already installed by running `ruby -v` in the terminal.
2. Download the zip file of this project (or clone the repository).
3. In the `fetch-rewards` folder, navigate to `config`.
4. Run `bundle install`.
5. Run the app locally by typing `shotgun`. (If this gives you an error, you may need to restart the terminal or run `bundle update`.)
6. Copy and paste the URL from your terminal into the browser to access the site on your local server.
7. Welcome to the site! To stop running the local server, type Ctrl-C in the terminal.

## Credits
All Ruby and database knowledge comes from the wonderful [Odin Project](https://www.theodinproject.com/). Other resources: the [Sinatra framework](http://sinatrarb.com/), DATABASE, and the many helpful Ruby/Sinatra/Redis/database tutorials out there.
