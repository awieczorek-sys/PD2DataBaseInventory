USE Inventory;
GO

insert into [dbo].[Product]
([ProdName],
[group],
[decription],
[available]
)
values 
('mleko', '{"group": "dairy"}', Null, 1), --12
('jogurt', '{"group": "dairy"}', Null, 1), --13
('pomidor', '{"group": "vegetables"}', Null, 1), --14
('cebula', '{"group": "vegetables"}', Null, 1), --15
('jab³ko', '{"group": "fruits"}', Null, 1), --16
('gruszka', '{"group": "fruits"}', Null, 1), --17
('ocet winny', '{"group": "other"}', Null, 0) --18

insert into [dbo].[ProductPrice]
([IdProd],
[Price],
[DateStart],
[Sell])
values(1, 3.5, GETDATE(), 1),
(1, 2.5, dateadd(year,-1,GETDATE()), 1),
(1, 3, GETDATE(), 0),
(1, 1.75, dateadd(year,-1,GETDATE()), 0),

(2, 2, GETDATE(), 1),
(2, 1.7, dateadd(year,-1,GETDATE()), 1),
(2, 1.7, GETDATE(), 0),
(2, 1.5, dateadd(year,-1,GETDATE()), 0),

(3, 0.6, GETDATE(), 1),
(3, 0.4, dateadd(year,-1,GETDATE()), 1),
(3, 0.4, GETDATE(), 0),
(3, 0.3, dateadd(year,-1,GETDATE()), 0),

(4, 0.6, GETDATE(), 1),
(4, 0.4, dateadd(year,-1,GETDATE()), 1),
(4, 0.3, GETDATE(), 0),
(4, 0.15, dateadd(year,-1,GETDATE()), 0),

(5, 0.25, GETDATE(), 1),
(5, 0.15, dateadd(year,-1,GETDATE()), 1),
(5, 0.2, GETDATE(), 0),
(5, 0.1, dateadd(year,-1,GETDATE()), 0),

(6, 0.3, GETDATE(), 1),
(6, 0.2, dateadd(year,-1,GETDATE()), 1),
(6, 0.2, GETDATE(), 0),
(6, 0.15, dateadd(year,-1,GETDATE()), 0),

(7, 15, GETDATE(), 1),
(7, 10, dateadd(year,-1,GETDATE()), 1),
(7, 10, GETDATE(), 0),
(7, 7.5, dateadd(year,-1,GETDATE()), 0)

insert into [dbo].[Inv_info]
([DateInv],
[Comment],
[ResponsiblePerson])
values
('20231130', 'Nie zaobserwowano braków produktów', 'Darek'),
('20221030', 'Nie zaobserwowano braków produktów', 'Dominik')

insert into [dbo].[Inventory]
([IdInvent],
[IdProd],
[Count])
values
(1,1,10),
(1,2,20),
(1,3,40),
(1,4,15),
(1,5,17),
(1,6,18),

(2,1,15),
(2,2,22),
(2,3,41),
(2,4,30),
(2,5,20),
(2,6,33),
(2,7,11)

insert [dbo].[Delivery]
([DateDeliv],
[Comment])
values
('20231030','Dobra dostawa'),
('20221030','Dobra dostawa')

insert into [dbo].[DelivProd]
([IdDeliv],
[IdProd],
[Count])
values
(1,1,40),
(1,2,34),
(1,3,45),
(1,4,30),
(1,5,25),
(1,6,40),

(2,1,45),
(2,2,50),
(2,3,60),
(2,4,70),
(2,5,42),
(2,6,55),
(2,7,33)
