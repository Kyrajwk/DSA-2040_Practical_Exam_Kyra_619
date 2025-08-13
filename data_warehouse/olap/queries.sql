-- 1) Roll-up: total sales by country and quarter
SELECT c.Country, t.Year, t.Quarter, ROUND(SUM(s.TotalSales),2) AS TotalSales
FROM SalesFact s
JOIN CustomerDim c ON s.CustomerKey = c.CustomerKey
JOIN TimeDim t     ON s.TimeKey     = t.TimeKey
GROUP BY c.Country, t.Year, t.Quarter
ORDER BY t.Year, t.Quarter, c.Country;

-- 2) Drill-down: monthly sales for a specific country (example: UK)
SELECT t.Year, t.Month, t.MonthName, ROUND(SUM(s.TotalSales),2) AS TotalSales
FROM SalesFact s
JOIN CustomerDim c ON s.CustomerKey = c.CustomerKey
JOIN TimeDim t     ON s.TimeKey     = t.TimeKey
WHERE c.Country = 'United Kingdom'
GROUP BY t.Year, t.Month, t.MonthName
ORDER BY t.Year, t.Month;

-- 3) Slice: total sales for Electronics category
SELECT ROUND(SUM(s.TotalSales),2) AS ElectronicsSales
FROM SalesFact s
JOIN ProductDim p ON s.ProductKey = p.ProductKey
WHERE p.Category = 'Electronics';
