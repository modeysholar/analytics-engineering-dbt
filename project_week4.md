# PART 1: dbt Snapshot

## 1. Run the products snapshot model using dbt snapshot and query it in snowflake to see how the data has changed since last week. 
## 2. Which products had their inventory change from week 3 to week 4? 
## 3.Now that we have 3 weeks of snapshot data, can you use the inventory changes to determine which products had the most fluctuations in inventory? Did we have any items go out of stock in the last 3 weeks? 

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

## 1. How are our users moving through the product funnel?

![alt text](<Screenshot 2024-11-04 at 23.28.29.png>)

## 2. Which steps in the funnel have largest drop off points?
From the funnel, we can see the largest drop off is between page view and add_to_cart level.

## 3. Use an exposure on your product analytics model to represent that this is being used in downstream BI tools. Please reference the course content if you have questions.
An exposure was added to the model used to create a funnel dashboard.

![alt text](<dbt-dag (4).png>)

![alt text](<dbt-dag (5).png>)


# PART 3A: dbt next steps for you.

** if your organization is thinking about using dbt, how would you pitch the value of dbt/analytics engineering to a decision maker at your organization?

Answer: I think the best approach to introducing a new process is to show how the implementation of dbt or analytics engineer would make a positive impact on the comapny's data and overall business. If possbible, this would be demostrated by using a use case, applicable to the business.

** if your organization is using dbt, what are 1-2 things you might do differently / recommend to your organization based on learning from this course?

Answer: Creating efficient models and implementation of macros.

** if you are thinking about moving to analytics engineering, what skills have you picked that give you the most confidence in pursuing this next step?

Answer: Data modelling using dbt, dbt setup with snowflake data warehouse and documentation. 


# PART 3B: Setting up for production / scheduled dbt run of your project 

** And finally, before you fly free into the dbt night, we will take a step back and reflect: after learning about the various options for dbt deployment and seeing your final dbt project, how would you go about setting up a production/scheduled dbt run of your project in an ideal state? You don’t have to actually set anything up - just jot down what you would do and why and post in a README file.

Answer: Here are the steps I would take to setup a project:

1. Select a Deployment Option : dbt Cloud for its ease of scheduling and deployment.

2. Set Up the Production Environment

Profiles.yml Configuration: Ensuring the production environment is defined in the profiles.yml file, with sensitive credentials managed securely (using environment variables or a secrets manager).

Database Connections: Test the production data warehouse connection (e.g., Snowflake) to ensure permissions and configurations align with the dbt project’s requirements.

3. Schedule Runs in dbt Cloud
Environment Configuration: In dbt Cloud, I create a production environment and connect it to the main or master branch used in the production.

Job Creation: I will set up a job in dbt Cloud to run the dbt project on a schedule.

Timing: Schedule runs to align with the data freshness requirements. Commonly, production jobs run daily, but if near-real-time data is needed, consider more frequent runs.

Selectivity: If certain models need more frequent refreshes, consider creating separate jobs for different model sets.

4. Implement Alerts and Notifications
Setting up alerts to notify the team of job failures or issues. dbt Cloud integrates with popular alerting systems like Slack, email, and webhook notifications. Alerts can be configured for:

Job Failures: Immediate notification if a job fails so that someone can investigate promptly.
Data Quality Alerts: Notifications based on test results (e.g., unique key constraints, referential integrity checks).

5. Enable Logging and Monitoring
In dbt Cloud:

Logging: Logs for each job run are automatically stored, providing detailed information on the success or failure of each model. Make sure your team has access to review these logs.
Monitoring: Use dbt Cloud’s built-in lineage graph and metadata to monitor model dependencies, run duration, and test results.
In custom setups (e.g., with Airflow), you may choose to store logs in a centralized logging tool (like ELK stack) for easier access and analysis.

6. Implement Data Quality Tests and Freshness Checks
In dbt, write tests for key data quality checks:

Schema Tests: Validate field types, nullability, uniqueness, and relationships (e.g., primary keys, foreign keys).
Custom Tests: Create custom tests for business rules (e.g., a range of values or consistency checks).
Source Freshness Checks: Set up freshness checks to ensure that source tables are updated as expected.

7. Establish CI/CD Workflow for Code Changes
To ensure changes are validated before hitting production:

Set up a CI/CD pipeline that triggers dbt run and dbt test commands on pull requests in staging environments.
Require successful runs and tests in staging before merging to the production branch.
Use version control in dbt Cloud or a CI/CD platform like GitHub Actions to automate deployment steps.

8. Document and Train
Documentation: Use dbt docs generate to build documentation for your models and store it in dbt Cloud (or other doc sites).
Team Training: Train team members on how to interpret test results, check logs, and respond to alerts for better response to issues.