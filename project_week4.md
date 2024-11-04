# PART 1: dbt Snapshot
## 1. What is our overall conversion rate?


## 2. What is our conversion rate by product?
Answer : The following product has had a change in inventory.

![alt text](<Screenshot 2024-11-04 at 14.32.34.png>)

As seen in the screenshot above, Pothos and Strings of pearl were out of stock in week 3. Ans in terms of flunctuation, there has been a large flunctuation across all 6 product over the past 3 weeks.

    select *
    from dev_db.dbt_myakubofficialgmailcom.products_snaphot
    where product_id in
    ( select product_id
    from dev_db.dbt_myakubofficialgmailcom.products_snaphot
    group by 1
    having count(1)>1

    )
    order by product_id, dbt_valid_from



# PART 2: Modelling challenge

## 1. Create a macro to simplify part of a model(s).
Answer: I created a macro called 'sum_of' which counts the number of each event types in the event column. This a very generic macro that can be re-used across models.

# PART 3: We’re starting to think about granting permissions to our dbt models in our snowflake database so that other roles can have access to them.

## 1. Add a post hook to your project to apply grants to the role “reporting”.

Answer: 
models:
  greenery:
    +post-hook:
      - "{{ grant(role='reporting') }}"

# PART 4: After learning about dbt packages, we want to try one out and apply some macros or tests.
Answer: dbt utils and dbt expectation packages were installed.
a)  Using the dbt_utils.get_column_values function, I have applied it in the fact_page_views model to dynamically list out all the values in the event type column, which is used in a for loop to count each occurences.

b) Using the dbt_utils.accepted_range, I also added a test on the tottal_order column of the orders table.

# PART 5: After improving our project with all the things that we have learned about dbt, we want to show off our work!
![alt text](<dbt-dag (3).png>)

# PART 6: dbt Snapshots

