-- U¿yj bazy danych "Inventory"
USE Inventory;
GO

-- Rozpocznij transakcjê
BEGIN TRANSACTION;

DECLARE @RowsAffected INT;

-- Przyk³adowa operacja aktualizacji danych w tabeli dbo.Inventory
UPDATE dbo.Inventory
SET [Count] = [Count] + 5
WHERE IdInvent = 1 and IdProd = 1;  -- Aktualizacja rekordu o IdInvent równym 1

-- SprawdŸ, ile rekordów zosta³o zmodyfikowanych
SET @RowsAffected = @@ROWCOUNT;

-- Jeœli tylko jeden rekord zosta³ zmodyfikowany, potwierdŸ transakcjê
IF @RowsAffected = 1
BEGIN
    COMMIT;
END
ELSE
BEGIN
    ROLLBACK;
END;
