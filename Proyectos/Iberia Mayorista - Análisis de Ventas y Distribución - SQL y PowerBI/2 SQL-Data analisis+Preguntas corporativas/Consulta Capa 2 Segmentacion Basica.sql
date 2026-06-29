
-- ****************************
-- CAPA 2 - Segmentación básica
-- ****************************

-- 1. Ventas por MES (lo más importante)

SELECT 
    c.Año,		c.Mes,		c.NombreMes,
    ROUND(SUM(f.MontoNeto),0)  AS TotalVentas,
    SUM(f.Unidades)            AS Unidades
FROM fctventas f

JOIN dimcalendario c ON f.FechaKey = c.FechaKey

GROUP BY		c.Año,		c.Mes,		c.NombreMes
ORDER BY		c.Año,		c.Mes;


-- 2. Top 5 PRODUCTOS

SELECT 
    p.NombreProducto,		p.Categoria,
    ROUND(SUM(f.MontoNeto),0)  AS Ventas,
    SUM(f.Unidades)            AS Unidades
FROM fctventas f

JOIN dimproducto p ON f.ProductoKey = p.ProductoKey

GROUP BY		p.ProductoKey,		p.NombreProducto,		p.Categoria
ORDER BY		Ventas DESC LIMIT 5;


-- 3. Top 5 CLIENTES

SELECT 
    cl.NombreCliente,		cl.Segmento,
    ROUND(SUM(f.MontoNeto),0)  AS Ventas,
    COUNT(*)                   AS NumVentas
FROM fctventas f

JOIN dimcliente cl ON f.ClienteKey = cl.ClienteKey

GROUP BY		cl.ClienteKey,		cl.NombreCliente,		cl.Segmento
ORDER BY		Ventas DESC LIMIT 5;


-- 4. Ventas por CANAL

SELECT 
    f.CanalVenta,
    ROUND(SUM(f.MontoNeto),0)  AS Ventas,
    AVG(f.MontoNeto)           AS TicketPromedio
FROM fctventas f

GROUP BY		f.CanalVenta;


-- 5. Desempeño por SUCURSALES

SELECT 
    s.NombreSucursal,
    COUNT(*)                            AS Operaciones,
    ROUND(AVG(o.LeadTimeDias),1)        AS LeadTimePromedio,
    ROUND(AVG(o.PedidoPerfecto)*100,1)  AS PorcPerfecto
FROM fctoperaciones o

JOIN dimsucursal s ON o.SucursalKey = s.SucursalKey

GROUP BY		s.SucursalKey,		s.NombreSucursal;