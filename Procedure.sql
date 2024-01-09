-- U¿yj bazy danych "Inventory"
USE Inventory;
GO

-- Utwórz procedurê sk³adowan¹
CREATE PROCEDURE GetProductInfo
    @ProductId bigint
AS
BEGIN
    SET NOCOUNT ON;

--lista dostêpnych produktów i ich aktualna cena i cena kupna i %mar¿a na produkcie
	with max_price_sell as (
		select IdProd, Sell, max(DateStart) as curr_date
		from ProductPrice
		group by IdProd, Sell
	)

	select A.IdProd,
			A.ProdName,
			A.decription,
			A.Price as SellingPrice,
			B.Price as BuyingPrice,
			(A.Price - B.Price)/B.Price as ProfitMargin
	from 
	(select A.*, B.Price 
	from dbo.Product A
	join dbo.ProductPrice B
	on A.IdProd = B.IdProd
	join max_price_sell C
	on C.curr_date = B.DateStart and C.IdProd = B.IdProd and C.Sell = 1
	where available = 1 and C.Sell = 1 and B.Sell =1 ) A
	join (
	select A.*, B.Price 
	from dbo.Product A
	join dbo.ProductPrice B
	on A.IdProd = B.IdProd
	join max_price_sell C
	on C.curr_date = B.DateStart and C.IdProd = B.IdProd and C.Sell = 0
	where available = 1 and C.Sell = 0 and B.Sell =0) B
	on A.IdProd = B.IdProd
	where A.IdProd = @ProductId
END;
