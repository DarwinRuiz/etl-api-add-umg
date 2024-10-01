CREATE PROCEDURE fact.actualizar_ventas
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        WITH CTE_registros_ventas_registros_duplicados_enumerados AS (
            SELECT
                DocumentID, CustomerCode, CustomerName, SalesDate, SalesAmount, Quantity, Discount, Tax, PaymentMethod, ShippingAddress, City,
                State, ZipCode, Country, ProductCode, ProductName, Category, Brand, SalesPersonCode, SalesPersonName, SalesRegion,
                PromoCode, OrderStatus, DeliveryStatus, UnitPrice,
                ROW_NUMBER() OVER (PARTITION BY
                    CustomerCode, CustomerName, SalesDate, SalesAmount, Quantity, Discount, Tax, PaymentMethod, ShippingAddress, City,
                    State, ZipCode, Country, ProductCode, ProductName, Category, Brand, SalesPersonCode, SalesPersonName, SalesRegion,
                    PromoCode, OrderStatus, DeliveryStatus, UnitPrice ORDER BY DocumentID) AS RowNum
            FROM
                stg.Sales
            WHERE
                CustomerCode IS NOT NULL AND CustomerName IS NOT NULL AND SalesDate IS NOT NULL
                AND SalesAmount IS NOT NULL AND Quantity IS NOT NULL AND Discount IS NOT NULL AND Tax IS NOT NULL
                AND PaymentMethod IS NOT NULL AND ShippingAddress IS NOT NULL AND ProductCode IS NOT NULL
                AND ProductName IS NOT NULL AND SalesPersonCode IS NOT NULL AND SalesPersonName IS NOT NULL
                AND SalesRegion IS NOT NULL AND OrderStatus IS NOT NULL AND DeliveryStatus IS NOT NULL
                AND UnitPrice IS NOT NULL
        )

        INSERT INTO fact.Sales (
            DocumentID, CustomerCode, CustomerName, SalesDate, SalesAmount, Quantity, Discount, Tax, PaymentMethod,
            ShippingAddress, City, State, ZipCode, Country, ProductCode, ProductName, Category,
            Brand, SalesPersonCode, SalesPersonName, SalesRegion, PromoCode, OrderStatus, DeliveryStatus, UnitPrice
        )
        SELECT
            DocumentID, CustomerCode, CustomerName, SalesDate, SalesAmount, Quantity, Discount, Tax,
            PaymentMethod, ShippingAddress, City, State, ZipCode, Country, ProductCode, ProductName,
            Category, Brand, SalesPersonCode, SalesPersonName, SalesRegion, PromoCode, OrderStatus, DeliveryStatus, UnitPrice
        FROM
            CTE_registros_ventas_registros_duplicados_enumerados
        WHERE
            RowNum = 1;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
