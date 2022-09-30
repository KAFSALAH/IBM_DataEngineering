-- Materialised Views

-- In this lab, you will learn how to create and execute views and materialized views in the PostgreSQL database service using the pgAdmin graphical user interface (GUI) tool. Materialized views behave differently compared to regular views.

-- In materialized views, the result set is materialized, or saved for future use. You can't insert, update, or delete rows like in regular views. Essentially, materialized views store the results of a database query as a separate table-like object so that the query results can be accessed at a later time without having to re-run the query.

--  As a result, materialized views can improve database performance compared to regular views.

-- Objectives
-- After completing this lab, you will be able to use pgAdmin with PostgreSQL to:

-- Restore a database schema and data.
-- Create and execute a view.
-- Create and execute a materialized view.
-- Lab Structure
-- In this exercise, you will go through three tasks where you will learn how to create and execute views and materialized views in the PostgreSQL database service using the pgAdmin graphical user interface (GUI) tool.

-- To get started with this lab, you will first download the relevant eBooks database dump file, then launch PostgreSQL and pgAdmin using the Cloud IDE. You can do this by following these steps:

-- Download the eBooks PostgreSQL dump file (containing the eBooks database schema and data) below to your local computer storage.

-- eBookspgsqldump.tar

-- In the tree-view, expand Servers > postgres > Databases. Enter your PostgreSQL service session password if prompted during the process. Right-click on Databases and go to Create > Database. Type eBooks as name of the database and click Save.

-- In the tree-view, expand eBooks. Right-click on eBooks and select Restore.

-- On the General tab, click on the Select file button by the Filename box.

-- Click the Upload File button.

-- Double-click on the drop files area and load the eBookspgsqldump.tar you downloaded earlier from your local computer storage.
-- When the upload is complete, close the drop files area by clicking the X button.

-- Make sure Format is set to All Files, select the uploaded eBookspgsqldump.tar file from the list, and then click the Select button.


-- Now switch to Restore options tab.

-- Under Disable, set the Trigger option to Yes. Then click Restore button.


-- On the General tab, type publisherandrating_view as name of the view. Then switch to Code tab.

SELECT books.title, books.rating, publishers.name 
FROM books INNER JOIN publishers ON books.publisher_id = publishers.publisher_id

-- In the tree-view, expand Views. Right-click on publisherandrating_view and go to View/Edit Data > All Rows.

SELECT * FROM public.publisher_and_rating_view

Create and execute a materialized view
-- In the tree-view, expand eBooks > Schemas > public. Right-click on Materialized Views and go to Create > Materialized View.

-- On the Definition tab, copy and paste the code below. Then click Save.

SELECT books.title, books.rating, publishers.name 
FROM books INNER JOIN publishers ON books.publisher_id = publishers.publisher_id

-- In the tree-view, expand Materialized Views. Right-click on publisherandratingmaterializedview and go to Refresh View > With data.
-- Right-click on publisherandratingmaterializedview again and go to View/Edit Data > All Rows.
-- You will access the materialized view you created.
-- As you can see, at first glance it doesn't look too different from the regular view you created earlier in this lab - indeed, from the user perspective it's essentially the same: you see the results of a query displayed in a table-like format. The difference is that this materialized view is cached in the database so that the data can be accessed again at a future time without having to re-run the database query, which can be intensive on the server depending on the complexity of the query and the size of the table being queried.
