# Movie Database & Sakila SQL Analysis 🎬

This project consists of two SQL exercises completed as part of a Data Analysis bootcamp module evaluation. It covers API data extraction, MySQL database creation and management using Python, and SQL querying on both a custom dataset and the Sakila sample database.

## Tech Stack 🔧

Python 3.14.3 · Jupyter Notebook · MySQL

**Libraries used:**
* `requests` — API data extraction
* `pandas` — data manipulation and DataFrame management
* `mysql-connector-python` — MySQL connection and query execution
* `numpy` — NaN value handling
* `python-dotenv` — secure environment variable management
* `IPython` — notebook display utilities

---

## Project Structure 🧬

* `Final_Exercise_SQL_python.ipynb` — Main notebook: API extraction, database creation, data insertion and SQL queries (Exercise 1)
* `final_exercise_sakila.sql` — SQL queries for the Sakila database analysis (Exercise 2)
* `.env` — Local environment file containing sensitive credentials (**not included in the repository**)
* `README.md` — Project documentation

---

## Getting Started ▶️

### 1. Clone the repository

```
git clone <https://github.com/Adalab/bda-modulo-2-evaluacion-final-MATC-90.git>
```

### 2. Set up your environment variables

Create a `.env` file in the root of the project with your MySQL password:

```
PASS_SQL=your_mysql_password_here
```

> ⚠️ This file is excluded from the repository via `.gitignore`. You must create it manually before running the notebook.

### 3. Make sure MySQL is running locally

The project connects to a local MySQL instance at `127.0.0.1`. Ensure your MySQL server is active before executing the notebook cells.

### 4. Install the required libraries

```
pip install requests pandas mysql-connector-python numpy python-dotenv
```

### 5. Open and run the notebook

Open `Ejercicio_final_SQL_phyton.ipynb` in Jupyter Notebook or VS Code and run the cells in order.

---

## Features 🔩

**Exercise 1 — Movie Database (Python + MySQL)**
* All database functions accept the database and table names as arguments, defined as variables at the start of the MySQL section for easy configuration and reuse
* Extract 100 movies from a REST API
* Create and manage a MySQL database and table using Python functions
* Insert API data into the database with proper data cleaning
* Query the database to extract insights:
  * Count movies longer than 120 minutes
  * Find movies with Spanish subtitles
  * Count movies with adult content
  * Retrieve the oldest movie in the database
  * Calculate average runtime by genre
  * Count movies per release year
  * Identify the year with the most movies
  * List all genres and their movie count
  * Search movies by keyword in title

**Exercise 2 — Sakila Database (SQL)**
* Query a pre-existing relational database simulating a movie rental store
* Retrieve, filter, aggregate and join data across multiple tables:
  * Select all unique film titles
  * Filter films by rating (PG-13)
  * Search films by keyword in description
  * Find films longer than 120 minutes
  * Retrieve all actor names
  * Filter actors by last name
  * Filter actors by ID range
  * Find films excluding specific ratings
  * Count films per rating category
  * Count total rentals per customer
  * Count total rentals per category
  * Calculate average film duration per rating
  * Find actors by film title
  * Search films by keyword in description
  * Filter films by release year range
