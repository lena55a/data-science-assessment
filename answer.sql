SELECT
  it.investor_id,
  s.sector_name,
  ROUND(100.0 * it.no_of_shares / tot.total_shares, 1) AS percentage
FROM investor_transactions it
JOIN (
  SELECT investor_id, SUM(no_of_shares) AS total_shares
  FROM investor_transactions
  GROUP BY investor_id
) tot
  ON tot.investor_id = it.investor_id
JOIN sectors s
  ON s.sector_id = it.sector_id
ORDER BY
  it.investor_id,
  percentage DESC,
  s.sector_id;
