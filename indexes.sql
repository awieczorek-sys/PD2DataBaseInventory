USE Inventory;
GO

-- Dodaj indeks nieklastrowy na kolumnie [DateDeliv] w tabeli dbo.Delivery
CREATE NONCLUSTERED INDEX IX_Delivery_Date ON dbo.Delivery ([DateDeliv])

-- Dodaj indeks nieklastrowy na kolumnie [DateInv] w tabeli dbo.Inv_info
CREATE NONCLUSTERED INDEX IX_InvInfo_Date ON dbo.Inv_info ([DateInv])

-- Dodaj indeks nieklastrowy na kolumnie [ProdName] w tabeli dbo.Product
CREATE NONCLUSTERED INDEX IX_Product_Name ON dbo.Product ([ProdName])

-- Dodaj indeks nieklastrowy na kolumnie [DateStart] w tabeli dbo.Product
CREATE NONCLUSTERED INDEX IX_Price_Date ON dbo.ProductPrice ([DateStart])