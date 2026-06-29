
-- ****************************
-- CAPA 4: KPIs ESTRATÉGICOS
-- ****************************

-- 1. Rentabilidad por CANAL (¿Dónde ganamos?)

SELECT 
    f.CanalVenta,
    ROUND(SUM(f.MontoNeto),0)                           AS VentasNetas,
    ROUND(SUM(f.MontoBruto),0)                          AS VentasBrutas,
    ROUND(AVG(f.DescuentoPct),1)                        AS DescuentoProm,
    ROUND((SUM(f.MontoNeto)/SUM(f.MontoBruto))*100,1)   AS MargenNeto,
    COUNT(*) AS Transacciones
FROM fctventas f

GROUP BY		f.CanalVenta
ORDER BY		VentasNetas DESC;


-- 2. % Pedido Perfecto por Sucursal

SELECT 
    s.NombreSucursal,
    COUNT(*)                                      AS TotalOps,
    SUM(o.PedidoPerfecto)                         AS Perfectos,
    ROUND(SUM(o.PedidoPerfecto)*100/COUNT(*),1)   AS PorcPerfecto,
    ROUND(AVG(o.OnTimeDelivery)*100,1)            AS PorcOnTime
FROM fctoperaciones o

JOIN dimsucursal s ON o.SucursalKey = s.SucursalKey

GROUP BY		s.SucursalKey,		s.NombreSucursal;


-- 3. Coste por Unidad Vendida (Eficiencia real)

SELECT 
    s.NombreSucursal,
    SUM(o.CosteOperacion)                                      AS CosteTotalOps,
    SUM(f.Unidades)                                            AS UnidadesVendidas,
    ROUND(SUM(o.CosteOperacion)/NULLIF(SUM(f.Unidades),0),0)   AS CostePorUnidad
FROM fctoperaciones o

JOIN dimsucursal s ON o.SucursalKey = s.SucursalKey

JOIN fctventas f ON o.FechaKey = f.FechaKey 
    AND		o.ClienteKey = f.ClienteKey 
    AND		o.ProductoKey = f.ProductoKey

GROUP BY		s.SucursalKey,		s.NombreSucursal;


-- 4. Concentración Riesgo (¿Pocos clientes = todo?)

WITH ranking_clientes AS (
    SELECT 
        cl.NombreCliente,
        SUM(f.MontoNeto)                                                  AS Ventas,
        SUM(f.MontoNeto) / (SELECT SUM(MontoNeto) FROM fctventas) * 100   AS PorcTotal,
        ROW_NUMBER() OVER (ORDER BY SUM(f.MontoNeto) DESC) 				  AS Rank
    FROM fctventas f
    
    JOIN dimcliente cl ON f.ClienteKey = cl.ClienteKey
    
    GROUP BY		cl.ClienteKey,		cl.NombreCliente
)
SELECT 
    Rank,
    NombreCliente,
    ROUND(Ventas,0)      AS Ventas,
    ROUND(PorcTotal,1)   AS '%Total'
FROM ranking_clientes

ORDER BY Rank;


-- 5. ABC Análisis Productos (Priorizar inventario)

WITH abc_ventas AS (
    SELECT 
        p.NombreProducto,		p.Categoria,
        SUM(f.MontoNeto)                                                  AS Ventas,
        SUM(f.MontoNeto) / (SELECT SUM(MontoNeto) FROM fctventas) * 100   AS PorcVentas,
        SUM(f.Unidades)                                                   AS Unidades,
        ROW_NUMBER() OVER (ORDER BY SUM(f.MontoNeto) DESC) 				  AS Rank,
        SUM(SUM(f.MontoNeto)) OVER (ORDER BY SUM(f.MontoNeto) DESC) / 
        (SELECT SUM(MontoNeto) FROM fctventas) * 100                      AS Acumulado
    FROM fctventas f
    
    JOIN dimproducto p ON f.ProductoKey = p.ProductoKey
    
    GROUP BY		p.ProductoKey,		p.NombreProducto,		p.Categoria
)
SELECT 
    Rank,		NombreProducto,		Categoria,
    ROUND(Ventas,0)       AS Ventas,
    ROUND(PorcVentas,1)   AS '%Ventas',
    ROUND(Acumulado,1)    AS '%Acumulado',
    CASE 
        WHEN Acumulado <= 80 THEN 'A'
        WHEN Acumulado <= 95 THEN 'B' 
        ELSE 'C'
    END 				  AS CategoriaABC
    
FROM abc_ventas

ORDER BY Rank;
