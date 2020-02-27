# README

CSE 3901 LAB 3 - WEB SCRAPER

DESCRIPTION

This is a web app built on Ruby on Rails that scrapes Ohio State CSE classes, instructors, etc. from the course catalog and creates a sortable HTML table with the data.  The user can edit, add, or delete courses from the table.

INSTRUCTIONS

Execute the following commands from in the lab directory:

bundle install

rails db:migrate

rails db:seed (Populates database with CSE course scrape. WARNING: This will reset the database)

rails server

...and then go to a web browser and navigate to http://localhost:3000/

From here, you will see a table of information about every class offered by Ohio State's CSE Department.  Use buttons to the right of each course to either edit or delete that course.  At the bottom and top of the table, you will find the "Add Course" button to add a course.  Sort the table by column by clicking on the header of the column by which you wish to sort. Click on an individual row to see information on that course section only.
