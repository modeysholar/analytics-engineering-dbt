In this week's project, i created more models to help answer stakeholders questions. 
Also, I added some tests to the models to ensure accurate data is refelected.
Finally, the product snapshot were updated from week 1 to see how our data is changing.


PART 1. Models
What is our user Repeat Rate?
Repeat Rate= 79.83%

What are good indicators of a user who will likely purchase again?
Satisfied customers will likely purchase again. These includes short average time it take to deliver their orders, great promo deals.  

What about indicators of users who are likely NOT to purchase again? 
Long average time to deliver orders.

If you had more data, what features would you want to look into to answer this question?
With more date, we can breakdown the website views, determine the user history and what attracts users to spend more time on a session.

A marts folder was created to organize the new models that were created to answer stakeholders questions. With subfolders containing the products, core & marketing business units. Using a mart makes it efficient to quickly categorize & recognize which models belong to each business unit.

PART 2. Tests
I have added some generic tests to the model from week 1 & week 2 which includes; not_null, uniqueness, relationship and accepted value tests.

Some of the assumptions are: 
Primary keys of a table is the unique identifier, hence it should not be null and it should pass the uniqueness test.
There is a relationship in the events with the users.
There are a list of acceptable values for the event types.


PART 3. dbt Snapshots
After runnung a new snapshot on the data, it was noticed that the follwing product had a change in their number of inventory: 
Pothos
Bamboo
Philodendron
Monstera
String of pearls
ZZ Plant