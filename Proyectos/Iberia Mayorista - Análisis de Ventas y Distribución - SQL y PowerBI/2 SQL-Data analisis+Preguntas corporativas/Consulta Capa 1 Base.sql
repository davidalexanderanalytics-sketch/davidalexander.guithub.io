
-- *****************************************
-- CAPA 1: Estado general del data warehouse
-- *****************************************

SELECT 
    'Ventas'                AS Tabla,
    COUNT(*)                AS Registros,
    ROUND(SUM(MontoNeto),0) AS TotalNeto,
    ROUND(AVG(MontoNeto),0) AS TicketPromedio,
    ROUND(SUM(Unidades),0)  AS UnidadesTotales
FROM fctventas

UNION ALL

SELECT 
    'Operaciones'                  AS Tabla,
    COUNT(*)                       AS Registros,
    ROUND(SUM(CosteOperacion),0)   AS CosteTotal,
    ROUND(AVG(CosteOperacion),0)   AS CostePromedio,
    ROUND(SUM(CantidadUnidades),0) AS UnidadesOperadas
FROM fctoperaciones;