use WideWorldImportersDW
--Q1: ما إجمالي المبيعات (بالقيمة) لكل عميل خلال السنة؟
SELECT 
    c.Customer,
    SUM(s.Quantity * s.[Unit Price]) AS TotalSalesRevenue
FROM Fact.Sale s
JOIN Dimension.Customer c ON s.[Customer Key] = c.[Customer Key]
GROUP BY c.Customer
ORDER BY TotalSalesRevenue DESC;

--ما أكثر 10 عملاء شراءً (حسب الكمية)؟

SELECT TOP 10
    c.Customer,
    SUM(s.Quantity) AS TotalQuantitySold
FROM Fact.Sale s
JOIN Dimension.Customer c ON s.[Customer Key] = c.[Customer Key]
JOIN Dimension.Date d ON s.[Invoice Date Key] = d.Date
WHERE d.[Calendar Year] = 2016
GROUP BY c.Customer
ORDER BY TotalQuantitySold DESC;

--ما إجمالي المبيعات حسب المدينة؟

SELECT 
    ci.City,
    SUM(s.[Total Excluding Tax] + s.[Tax Amount]) AS TotalSalesRevenue
FROM Fact.Sale s
JOIN Dimension.Customer c ON s.[Customer Key] = c.[Customer Key]
JOIN Dimension.City ci ON c.[Lineage Key] = ci.[City Key]
JOIN Dimension.Date d ON s.[Invoice Date Key] = d.Date
WHERE d.[Calendar Year] = 2016
GROUP BY ci.City
ORDER BY TotalSalesRevenue DESC;




-- ما نسبة التسليم في الوقت (On-time Delivery Rate) لكل مورد؟
SELECT 
    sup.Supplier,
    COUNT(*) AS TotalPurchases,
    SUM(CASE WHEN p.[Date Key] <= p.[Date Key] THEN 1 ELSE 0 END) AS OnTimeDeliveries,
    ROUND(
        SUM(CASE WHEN p.[Date Key] <= p.[Date Key] THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS OnTimeDeliveryRate_Pct
FROM Fact.Purchase p
JOIN Dimension.Supplier sup ON p.[Supplier Key] = sup.[Supplier Key]
JOIN Dimension.Date d ON p.[Date Key] = d.Date
WHERE d.[Calendar Year] = 2016
GROUP BY sup.Supplier
ORDER BY OnTimeDeliveryRate_Pct DESC;

--ما عدد الطلبات التي تم معالجتها لكل موظف؟
SELECT 
    e.[Employee],
    COUNT(s.[Sale Key]) AS TotalOrdersProcessed
FROM Fact.Sale s
JOIN Dimension.Employee e ON s.[Salesperson Key] = e.[Employee Key]
JOIN Dimension.Date d ON s.[Delivery Date Key] = d.Date
WHERE d.[Calendar Year] = 2016
GROUP BY e.[Employee]
ORDER BY TotalOrdersProcessed DESC;


--ما إجمالي قيمة المبيعات التي حققها كل موظف؟
SELECT 
    e.[Employee],
    SUM(s.[Total Including Tax] + s.[Tax Amount]) AS TotalSalesValue
FROM Fact.Sale s
JOIN Dimension.Employee e ON s.[Salesperson Key] = e.[Employee Key]
JOIN Dimension.Date d ON s.[Delivery Date Key] = d.Date
WHERE d.[Calendar Year] = 2016
GROUP BY e.[Employee]
ORDER BY TotalSalesValue DESC;


--ما أداء المبيعات  سنوي
SELECT 
    d.[Calendar Year],
    d.[Calendar Year Label],
    SUM(s.[Total Excluding Tax] + s.[Tax Amount]) AS yearRevenue
FROM Fact.Sale s
JOIN Dimension.Date d ON s.[Delivery Date Key] = d.Date
WHERE d.[Calendar Year] = 2016
GROUP BY d.[Calendar Year], d.[Calendar Year Label]
ORDER BY d.[Calendar Year], d.[Calendar Year Label];


--ما هي أكثر المنتجات شراءً من حيث عدد الطلبات لكل مورد؟ 
SELECT
    DS.[Supplier],
    DSI.[Stock Item],
    COUNT(DISTINCT FP.[WWI Purchase Order ID]) AS PurchaseOrderCount
FROM Fact.Purchase FP
JOIN Dimension.Supplier DS ON FP.[Supplier Key] = DS.[Supplier Key]
JOIN Dimension.[Stock Item] DSI ON FP.[Stock Item Key] = DSI.[Stock Item Key]
GROUP BY DS.[Supplier], DSI.[Stock Item]
ORDER BY PurchaseOrderCount DESC;

-- ما هو متوسط الكمية المطلوبة يوميًا لكل مورد؟

SELECT
    DD.[Date],
    DS.[Supplier],
    AVG(FP.[Ordered Quantity]) AS AvgDailyOrderedQuantity
FROM Fact.Purchase FP
JOIN Dimension.Supplier DS ON FP.[Supplier Key] = DS.[Supplier Key]
JOIN Dimension.Date DD ON FP.[Date Key] = DD.Date
GROUP BY DD.[Date], DS.[Supplier]
ORDER BY AvgDailyOrderedQuantity DESC;