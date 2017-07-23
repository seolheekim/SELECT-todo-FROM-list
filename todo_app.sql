#1 Write a query to delete a user named michael if it exists

  DROP USER IF EXISTS michael;

#2 Write a query to create a user named michael with an encrypted password stonebreaker

  CREATE USER michael WITH ENCRYPTED PASSWORD 'ilovespot';

#3 Write a query to drop a database named todo_app if it exists

  DROP DATABASE IF EXISTS todo_app;

#4 Write a query to create a database named todo_app

  CREATE DATABASE todo_app WITH OWNER michael;

#5 Connect to the newly created database

  \c todo_app

#6 - #11 Write a query to create a table named tasks using the Initial columns detailed below
    -- Define column id as the table's primary key
    -- Write queries to accomplish the following
      -- remove the column named completed
      -- add a column to tasks named completed_at:timestamp, that may be NULL, and has a default value of NULL.
      -- change the updated_at column to not allow NULL values, and have a default value of now()
  DROP TABLE IF EXISTS tasks;

  CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(45),
    description TEXT,
    created_at timestamp,
    updated_at timestamp NOT NULL DEFAULT NOW(),
    completed_at boolean DEFAULT NULL
    );

  ALTER TABLE tasks DROP COLUMN completed;

  ALTER TABLE tasks ADD COLUMN completed_at timestamp DEFAULT NULL;

  ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
  ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW();

#12 create a new task, by only setting values (not defining which columns) id = default value
-- title = 'Study SQL'
-- description = 'Complete this exercise'
-- created_at = now()
-- updated_at = now()
-- completed_at = NULL

INSERT INTO tasks
VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', NOW(), NOW(), NULL);

#13 create a new task
-- title = 'Study PostgreSQL'
-- description = 'Read all the documentation'

INSERT INTO tasks (title, description)
VALUES ( 'Study PostgreSQL', 'Read all the documentation' );

#14 select all the titles of tasks that are not yet completed

SELECT title FROM tasks WHERE completed_at = NULL

#15 update the task with a title of 'Study SQL' to be completed as of now

UPDATE tasks SET completed_at = true WHERE title = 'Study SQL';

#16 select all titles and descriptions of tasks that are not yet completed

SELECT title, description FROM tasks WHERE completed_at = false;

#17 select all fields of every task sorted by creation date in descending order

SELECT * FROM tasks ORDER BY created_at DESC;

#18 create a new task
-- title = 'mistake 1'
-- description = 'a test entry'

INSERT INTO tasks (title, description)
VALUES( 'mistake 1', 'a test entry');

#19 create a new task
-- title = 'mistake 2'
-- description = 'another test entry'

INSERT INTO tasks (title, description)
VALUES('mistake 2', 'another test entry');

#20 create a new task
-- title = 'third mistake'
-- description = 'another test entry'

INSERT INTO tasks (title, description)
VALUES('third mistake', 'another test entry');

#21 select title fields of all tasks with a title that includes the word 'mistake'

SELECT title FROM tasks WHERE title LIKE '%mistake%';

#22 delete the task that has a title of mistake 1

DELETE FROM tasks WHERE title LIKE '%mistake 1%';

#23 select title and description fields of all tasks with a title that includes the word 'mistake'

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

#24 delete all tasks that includes the word 'mistake' in the title

DELETE FROM tasks WHERE title LIKE '%mistake%';

#25 select all fields of all tasks sorted by title in ascending order

SELECT * FROM tasks ORDER BY title ASC;