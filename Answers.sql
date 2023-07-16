--Question 1
SELECT u.Brand, u.Most_Txn
FROM 
(SELECT RewardsReceiptItemList ->> 'brandCode' AS Brand, COUNT(1) AS Most_Txn
FROM fetch_rewards."Receipts" r
WHERE r.CreatedDate >= CURRENT_DATE - INTERVAL '1 month'
GROUP BY RewardsReceiptItemList ->> 'brandCode') u
ORDER BY 2 DESC
LIMIT 5;

--Question 2
SELECT u.Brand, u.Most_Txn
FROM 
(SELECT RewardsReceiptItemList ->> 'brandCode' AS Brand, COUNT(1) AS Most_Txn
FROM fetch_rewards."Receipts" r
WHERE r.CreatedDate >= date_trunc('month', current_timestamp) - interval '2 month'
AND r.CreatedDate < date_trunc('month', current_timestamp) - interval '1 month'
GROUP BY RewardsReceiptItemList ->> 'brandCode') u
ORDER BY 2 DESC
LIMIT 5;

--Question 3
SELECT RewardsReceiptStatus, AVG(TotalSpent)
FROM fetch_rewards."Receipts"
GROUP BY RewardsReceiptStatus;

--Question 4
SELECT RewardsReceiptStatus, SUM(PurchasedItemCount)
FROM fetch_rewards."Receipts"
GROUP BY RewardsReceiptStatus;

--Question 5
SELECT f.Brand
FROM 
(SELECT RewardsReceiptItemList ->> 'brandCode' AS Brand, SUM(RewardsReceiptItemList ->> 'finalPrice') AS Most_Spend
FROM fetch_rewards."Receipts" r
JOIN fetch_rewards."Users" u ON u.ID = r.UserID
WHERE u.CreatedDate >= CURRENT_DATE - INTERVAL '6 months'
GROUP BY RewardsReceiptItemList ->> 'brandCode') f
WHERE f.Most_Spend = MAX(f.Most_Spend);

--Question 6
SELECT f.Brand
FROM 
(SELECT RewardsReceiptItemList ->> 'brandCode' AS Brand, COUNT(1) AS Most_Txn
FROM fetch_rewards."Receipts" r
JOIN fetch_rewards."Users" u ON u.ID = r.UserID
WHERE u.CreatedDate >= CURRENT_DATE - INTERVAL '6 months'
GROUP BY RewardsReceiptItemList ->> 'brandCode') f
WHERE f.Most_Txn = MAX(f.Most_Txn);