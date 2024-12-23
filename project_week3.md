# PART 1: Create new models to answer the first two questions (answer questions in README file)

## 1. What is our overall conversion rate?
Answer: 62.5%

## 2. What is our conversion rate by product?

| product_id                               | total_sessions | sessions_with_purchase | purchase_ratio |
|--------------------------------------------|----------------|------------------------|----------------|
| 05df0866-1a66-41d8-9ed7-e2bbcddd6a3d       | 60             | 45                     | 0.75           |
| 35550082-a52d-4301-8f06-05b30f6f3616       | 45             | 34                     | 0.756          |
| 37e0062f-bd15-4c3e-b272-558a86d90598       | 62             | 49                     | 0.79           |
| 4cda01b9-62e2-46c5-830f-b7f262a58fb1       | 61             | 45                     | 0.738          |
| 55c6a062-5f4a-4a8b-a8e5-05ea5e6715a3       | 62             | 46                     | 0.742          |
| 579f4cd0-1f45-49d2-af55-9ab2b72c3b35       | 54             | 42                     | 0.778          |
| 58b575f2-2192-4a53-9d21-df9a0c14fc25       | 61             | 45                     | 0.738          |
| 5b50b820-1d0a-4231-9422-75e7f6b0cecf       | 59             | 44                     | 0.746          |
| 5ceddd13-cf00-481f-9285-8340ab95d06d       | 67             | 55                     | 0.821          |
| 615695d3-8ffd-4850-bcf7-944cf6d3685b       | 65             | 43                     | 0.662          |
| 64d39754-03e4-4fa0-b1ea-5f4293315f67       | 59             | 49                     | 0.831          |
| 689fb64e-a4a2-45c5-b9f2-480c2155624d       | 67             | 56                     | 0.836          |
| 6f3a3072-a24d-4d11-9cef-25b0b5f8a4af       | 51             | 34                     | 0.667          |
| 74aeb414-e3dd-4e8a-beef-0fa45225214d       | 63             | 50                     | 0.794          |
| 80eda933-749d-4fc6-91d5-613d29eb126f       | 74             | 54                     | 0.73           |
| 843b6553-dc6a-4fc4-bceb-02cd39af0168       | 68             | 49                     | 0.721          |
| a88a23ef-679c-4743-b151-dc7722040d8c       | 46             | 32                     | 0.696          |
| b66a7143-c18a-43bb-b5dc-06bb5d1d3160       | 63             | 55                     | 0.873          |
| b86ae24b-6f59-47e8-8adc-b17d88cbd367       | 53             | 44                     | 0.83           |
| bb19d194-e1bd-4358-819e-cd1f1b401c0c       | 78             | 57                     | 0.731          |
| be49171b-9f72-4fc9-bf7a-9a52e259836b       | 49             | 43                     | 0.878          |
| c17e63f7-0d28-4a95-8248-b01ea354840e       | 55             | 47                     | 0.855          |
| c7050c3b-a898-424d-8d98-ab0aaad7bef4       | 75             | 55                     | 0.733          |
| d3e228db-8ca5-42ad-bb0a-2148e876cc59       | 56             | 44                     | 0.786          |
| e18f33a6-b89a-4fbc-82ad-ccba5bb261cc       | 70             | 55                     | 0.786          |
| e2e78dfc-f25c-4fec-a002-8e280d61a2f2       | 63             | 45                     | 0.714          |
| e5ee99b6-519f-4218-8b41-62f48f59f700       | 66             | 48                     | 0.727          |
| e706ab70-b396-4d30-a6b2-a1ccf3625b52       | 56             | 50                     | 0.893          |
| e8b6528e-a830-4d03-a027-473b411c7f02       | 73             | 56                     | 0.767          |
| fb0e8be7-5ac4-4a76-a1fa-2cc4bf0b2d80       | 64             | 57                     | 0.891          |


# PART 2: We’re getting really excited about dbt macros after learning more about them and want to apply them to improve our dbt project.

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

Answer : The following product has had a change in inventory.

![alt text](<Screenshot 2024-11-04 at 14.32.34.png>)