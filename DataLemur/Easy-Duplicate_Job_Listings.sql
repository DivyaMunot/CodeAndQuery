SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM job_listings
WHERE company_id IN(
  SELECT company_id
  FROM job_listings
  GROUP BY company_id, title, description
  HAVING COUNT(company_id) > 1
);