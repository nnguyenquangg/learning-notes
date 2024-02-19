-- Truy vấn để lấy tất cả đơn đặt hàng
SELECT OrderID, CustomerID, OrderDate
FROM Orders;

-- Duyệt qua kết quả và lấy chi tiết cho từng đơn đặt hàng
FOR EACH ROW IN (SELECT * FROM OrderDetails WHERE OrderID = :currentOrderID) DO
    -- Xử lý chi tiết đơn đặt hàng
    -- ...
END FOR;