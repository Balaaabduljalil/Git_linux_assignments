-- Query to find order IDs where either gloss_qty or poster_qty exceeds 4000
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

-- Query to find orders where standard_qty is zero and either gloss_qty or poster_qty exceeds 1000
SELECT id
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

-- Query to find company names starting with 'C' or 'W' and with specific primary contact criteria
SELECT company_name
FROM companies
WHERE (company_name LIKE 'C%' OR company_name LIKE 'W%')
  AND primary_contact ILIKE '%ana%'
  AND primary_contact NOT ILIKE '%eana%';
  
  
 -- Query to show the region, sales rep, and account name, sorted by account name
SELECT r.region_name, s.sales_rep_name, a.account_name
FROM regions r
JOIN sales_reps s ON r.region_id = s.region_id
JOIN accounts a ON s.sales_rep_id = a.sales_rep_id
ORDER BY a.account_name;


