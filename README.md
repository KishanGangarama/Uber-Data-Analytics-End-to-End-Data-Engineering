# Introduction

In this project, our main objective is to work with a dataset similar to Uber's and perform various data engineering tasks. We will build a data model using a fact and dimension format on and write transformation code using Python. To deploy our code, we will utilize a compute instance on Google Cloud and leverage an open-source data pipeline tool called Mage.

The data will be loaded into BigQuery, which acts as our data warehouse. Furthermore, we will create a final dashboard using LookerStudio, a powerful business intelligence tool. This dashboard will provide visual representations and insights based on the processed data.

Additionally, it explores the various Google Cloud Platform (GCP) services that will be utilized throughout the project, such as Google Cloud storage, compute engine, and BigQuery.

# Data Modeling 

As the project execution begins, the first step involves data modeling and understanding the dataset and its corresponding data dictionary. This step is crucial for designing an effective data model that aligns with the project's objectives.

To transform the flat hierarchy table into a structured format, an online tool called Lucidchart is utilized. Using Lucidchart, the data frame is transformed into fact and dimension tables. Multiple dimension tables are created based on the information that would have been in the fact tables, facilitating a more realistic understanding and visualization of the data.

The dimension model can be enhanced by adding more columns, extracting additional information, and gaining a deeper understanding of the dataset, depending on the project requirements. For example, details like pick-up day, pick-up month, and pick-up weekday can be incorporated.

The date-time dimension table serves as the primary key, while the passenger account and trip distance are transactional values that change over time. These values are placed in different dimension tables to explore the workings of actual joins.

Similarly, dimension tables are created for pick-up location, pick-up location ID, drop location, drop location ID, rate code, and payment type. These tables include primary keys, foreign keys, and relevant columns to accurately represent associated information.

# Writing Transformation Code(Python)

During the project's transformation code phase in Python, the main objective is to convert the flat file into a dimension model using structured programming code. This process involves dropping duplicates, resetting the index, and assigning unique values to the date-time column.Once the flat file is successfully converted into dimension tables, the subsequent task is to create the fact table by merging the dimension tables.

Upon completing the transformation code, the data can be uploaded to Google Cloud storage for deployment. Analyzing the data, executing queries, and developing a dashboard follow as subsequent steps in the project.
