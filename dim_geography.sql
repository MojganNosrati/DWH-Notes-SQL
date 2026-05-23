/*
This script creates a Shared Dimension (DIM_Geography) by consolidating location data (Country, State, City) from three separate tables: authors, stores, and publishers.

Key Technical Steps:

Consolidation: Used UNION to merge unique locations from all source tables.
Normalization: Created a unified reference table to ensure data consistency.
Key Generation: Applied ROW_NUMBER() to generate a unique GeographyKey for the dimension.
Why this matters:

By centralizing these locations, we eliminate redundancy and create a “Single Source of Truth,” which is a foundational requirement for building a robust Data Warehouse and enabling drill-across reporting.
*/

select ROW_NUMBER () over (order by (select null)) as Gegraphykey,* into DIMgeography from (

select null as country,state, city from authors
union
select null as country,state, city from stores
union
select  country,state, city from publishers
) as x
