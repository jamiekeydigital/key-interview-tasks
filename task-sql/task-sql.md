# SQL Relation Task
This is a simple task to get a result set from three related tables. This can be completed in most SQL dialects such as MySQL, PostgreSQL, MS SQL Server. The test data is supplied as MySQL format, and uses datetime columns so 'can' be acheived in SQLite but would need timestamps converted to epoch numerics.

## Context of data
The following data records are events/activities on a holiday park. It has three tables :

#### site_event - Event records (What is happening)
|id|title|description|duration|maxcapacity|deleted|
|---|---|---|---|---|---|
|1|Kids Disco| Lorem ipsum ...|90|100|0|
|2|Craft Sessions|Lorem ipsum ...|120|20|0|
|3|Recently Deleted Event|Lorem ipsum ...|60|45|1|

Logical deletion for event records : deleted flag is either 0/1 (1 for deleted)

#### site_venue - Venue records (Where can events be held)
|id|name|
|---|---|
|3|Kids Club|
|2|Seaside Stage|
|1|Sunshine Bar|

Logical deletion for event records : deleted flag is either 0/1 (1 for deleted)

#### site_performance - Performance records (What time and venue)
|id|eventid|performancetime|venueid|sold|
|---|---|---|---|---|
|1|1|2019-12-3 18:00:00|1|35|
|2|1|2019-12-4 18:00:00|1|20|
|3|1|2019-12-5 18:00:00|1|100|
|4|1|2019-12-6 18:00:00|2|25|
|5|1|2019-12-7 18:00:00|2|65|
|6|2|2019-12-3 12:00:00|3|7|
|7|2|2019-12-5 18:00:00|3|12|
|8|2|2019-12-6 18:00:00|3|0|
|9|3|2019-12-1 18:00:00|1|0|
|10|3|2019-12-3 18:00:00|1|0|

#### Supplied Data
These three tables have been supplied in a mysql dump, which can be ported to other sql dialects, or as three .csv files.

[SQL Dump](mysqldump.sql)
[Events CSV](site_event.csv)
[Performances CSV](site_performance.csv)
[Venues CSV](site_venue.csv)

## Task 1
**Write a single select query to produce following dataset (also found in [results.csv](results.csv))**

Each row in the result set would include the information to create various indexed objects, in different languages when read.

This result could be read directly as a query, or could be used as the basis for a db view.

|id|eventid|performancetime|venueid|sold|available|maxcapacity|soldout|eventtitle|description|duration|venuename|
|---|---|---|---|---|---|---|---|---|---|---|---|
|6|2|2019-12-3 12:00:00|3|7|13|20|0|Craft Sessions|Lorem ipsum...|120|Kids Club|
|7|2|2019-12-5 18:00:00|3|12|8|20|0|Craft Sessions|Lorem ipsum...|120|Kids Club|
|8|2|2019-12-6 18:00:00|3|0|20|20|0|Craft Sessions|Lorem ipsum...|120|Kids Club|
|1|1|2019-12-3 18:00:00|1|35|65|100|0|Kids Disco|Lorem ipsum...|90|Sunshine Bar|
|2|1|2019-12-4 18:00:00|1|20|80|100|0|Kids Disco|Lorem ipsum...|90|Sunshine Bar|
|3|1|2019-12-5 18:00:00|1|100|0|100|1|Kids Disco|Lorem ipsum...|90|Sunshine Bar|
|4|1|2019-12-6 18:00:00|2|25|75|100|0|Kids Disco|Lorem ipsum...|90|Seaside Stage|
|5|1|2019-12-7 18:00:00|2|65|35|100|0|Kids Disco|Lorem ipsum...|90|Seaside Stage|

**Notes :** Results are ordered by *Event Title*, then *Performance Time*. Both the *available*, and *soldout* columns are calculated. *Soldout*, is a 0/1 boolean, *Available* is an integer. This result set does **NOT** include any performances related to the events marked as deleted

## Task 2
Imagine these tables were attached to an active service, or API which recieves and inserts new performances. On finishing the new data insertion, it should then housekeep old performances from the site_performances table.

**Write a sql statement which will delete any performances whose event is marked as deleted, or are more than 30 days past their performance time**

## Task 3
Imagine this data was NOT being read by another code set, and was being used to export as a report. It may need some additional columns to give context to the data.

**Add another column to your task 1 query to add a 'finishtime' datetime calculated column, which adds the event duration to the row's performance time**

## Task 4
**Using the three tables of data write 2 or 3 handy queries, functions, or views of your choice**

Examples:
- Gets the number of venues an event is held in, or the number of performances an event has
- Get the average occupancy as a percentage based on the sold/available/capacity values
- How many tickets are sold for a set event in a week period