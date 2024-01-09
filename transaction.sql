-- U�yj bazy danych "Inventory"
USE Inventory;
GO

-- Rozpocznij transakcj�
BEGIN TRANSACTION;

DECLARE @RowsAffected INT;

-- Przyk�adowa operacja aktualizacji danych w tabeli dbo.Inventory
UPDATE dbo.Inventory
SET [Count] = [Count] + 5
WHERE IdInvent = 1 and IdProd = 1;  -- Aktualizacja rekordu o IdInvent r�wnym 1

-- Sprawd�, ile rekord�w zosta�o zmodyfikowanych
SET @RowsAffected = @@ROWCOUNT;

-- Je�li tylko jeden rekord zosta� zmodyfikowany, potwierd� transakcj�
IF @RowsAffected = 1
BEGIN
    COMMIT;
END
ELSE
BEGIN
    ROLLBACK;
END;
