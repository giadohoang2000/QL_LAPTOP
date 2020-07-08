--Câu 1: Tìm những khách hàng ở hcm và mua hàng với giá trên 30tr
--Cách 1:
SELECT  * FROM dbo.Customer,dbo.Bill
WHERE Customer.ID = Bill.IDCustomer AND TotalMoney > 30000000 AND Address = N'Hồ Chí Minh'

--Cách 2:
SELECT *
FROM dbo.Customer
WHERE ID IN (SELECT IDCustomer FROM dbo.Bill
WHERE TotalMoney >30000000
GROUP BY IDCustomer) AND Address = N'Hồ Chí Minh'

--Câu 2: Hiển thị thông tin khách hàng mua trên 2 laptop khác nhau
SELECT *
FROM dbo.Customer
WHERE ID IN (SELECT IDCustomer
FROM dbo.Bill
WHERE ID IN (SELECT IDBill
FROM dbo.BillDetail
GROUP BY IDBill
HAVING COUNT(*) > 1))

--Câu 3: Tính tổng tiền thu được ngày 24-06-2020
SELECT SUM(TotalMoney) AS 'tong'
FROM dbo.Bill 
WHERE DateOfBill = '2020-06-24'

--Câu 4: Cho biết số lượng laptop của hãng apple
SELECT COUNT(*) AS N'Tổng số loại '
FROM dbo.Laptop
WHERE Brand = 'Apple'




