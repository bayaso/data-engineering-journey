🟦 1. SQL — Advanced Window Functions
--✔ DENSE_RANK over groups
DENSE_RANK() OVER (PARTITION BY customer ORDER BY amount DESC)


--Ranks values per group
No gaps after ties
Used for Top N queries

--✔ LAG (previous row)
LAG(amount) OVER (PARTITION BY customer ORDER BY amount DESC)
--Gets the previous value in sorted order
--Returns NULL for the first row


--✔ Running Total (Cumulative SUM)
SUM(amount) OVER (PARTITION BY customer ORDER BY amount DESC)
--Adds up amounts row-by-row
--Window = from first row to current row


--✔ Filtering by rank using subqueries
Because you cannot filter window functions directly.
SELECT *
FROM (
    SELECT customer, amount,
           DENSE_RANK() OVER (...) AS ranks
    FROM orders
) t
WHERE ranks <= 2;

--✔ Full combined window query

(Top 2 per customer + lag + running total + diff)

SELECT customer, amount, previous_amount,
       amount - previous_amount AS diff_from_prev,
       running_total
FROM (
    SELECT customer, amount,
        DENSE_RANK() OVER(...) AS ranks,
        LAG(amount) OVER(...) AS previous_amount,
        SUM(amount) OVER(...) AS running_total
    FROM orders
) t
WHERE ranks <= 2
ORDER BY customer ASC, amount DESC;
