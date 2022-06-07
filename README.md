# Coding Assignment

A company ‘MediaNow’ is selling packages - Basic, Plus, and Premium. The price for each package is updated regularly and a pricing log is kept for all packages. The company is doing well and the feature requests are pouring in! Help us by implementing the following two feature requests made by our coworkers.

## Feature request 1: Municipalities
The company pricing expert wants to start segmenting our package prices based on the municipality the package is sold in. In other words, a package should be able to have different prices depending on a municipiality. The current code doesn't really support this well (on purpose) and some structural changes are needed. We still want to have our pricing log, but now with the added municipalities.

Look into the pending test in `spec/services/update_package_price_spec.rb` for guidance and make all the tests pass.

## Feature request 2: Pricing history
An accounting department needs information on price changes that happened for the package basic in 2020. This kind of request will happen frequently, so we need a simple way to fetch pricing history, given a package, a year and optionally a municipality.

Look into the pending tests in `spec/lib/price_history_spec.rb` for guidance and make all the tests pass.

## Starting out
**NOTE: In this assignment we assume you are comfortable with developing Rails applications.**

We have set up a minimal Rails app with some models and tests added. Running rspec should result in all tests passing and having some tests pending:

```sh
# Assuming the Rails app is set up and the database is created/migrated
media_now $ rspec
....**..*

Finished in 0.06114 seconds (files took 2.5 seconds to load)
9 examples, 0 failures, 3 pending
```
If all the initially pending tests pass, then you have completed the assignment.

There is a seed that might be helpful in the beginning of the assignment. You probably want to update it after you finish the first feature request (though it is not required):

```
media_now $ rails db:seed
Removing old packages and their price histories
Creating new packages
Creating a price history for the packages
```

## A few notes about the assignment

We would like you to model the product domain (it doesn’t have to be perfect) and update the application to enable the two features.
Think through your solution and implement it based on the instructions and your own thoughts. Spend at most 3 hours on the assignment. It's not worth more of your time (or ours).

- Complete the assignment by passing all tests, having no pending tests
- Write code as if it was to be delivered to production
- Use version control (Git preferably) and commit frequently
- Set your own scope and make your own prioritizations for the challenge
- You don't need to spend any time on deployment/ops solutions, e g. using docker
- No HTTP requests are needed anywhere

## If things go wrong
Let us know if something doesn't seem right. We might have missed something. Don't panic! 💚

## Follow-up
Send us the code when you are done, preferably hosted on a service such as GitHub, Bitbucket, or Gitlab. We will review your solution in a follow-up interview where we will go through and discuss the different aspects of the application, for example:
- Application structure
- Data integrity
- Testing
- Design choices and their advantages and disadvantages
