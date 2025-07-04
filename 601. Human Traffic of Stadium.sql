-- Write your PostgreSQL query statement below
WITH grouped_stadium AS (
    SELECT 
        id,
        visit_date,
        people,
        id - ROW_NUMBER() OVER (ORDER BY id) AS group_id -- Create group identifier
    FROM stadium
    WHERE people >= 100 -- Filter for rows with at least 100 people
)

SELECT 
    id,
    visit_date,
    people
FROM grouped_stadium
WHERE group_id IN (
    SELECT group_id
    FROM grouped_stadium
    GROUP BY group_id
    HAVING COUNT(*) >= 3
)
ORDER BY visit_date;