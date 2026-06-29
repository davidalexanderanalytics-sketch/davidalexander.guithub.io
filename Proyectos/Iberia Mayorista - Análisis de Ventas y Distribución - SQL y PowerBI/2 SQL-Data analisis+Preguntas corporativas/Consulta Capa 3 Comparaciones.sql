
-- ****************************
-- CAPA 3: COMPARACIONES
-- ****************************

-- 1. Crecimiento Mes vs Mes (¿Cómo cambió?)

WITH ventas_mensuales AS (
    SELECT c.Año,		c.Mes,		c.NombreMes,
           ROUND(SUM(f.MontoNeto),0) AS Ventas
    FROM fctventas f
    
    JOIN dimcalendario c ON f.FechaKey = c.FechaKey
    
    GROUP BY		c.Año,		c.Mes,		c.NombreMes
)
SELECT Año,		Mes,		NombreMes,		Ventas,
       LAG(Ventas) OVER (ORDER BY Año, Mes) AS MesAnterior,
       ROUND((Ventas - LAG(Ventas) OVER (ORDER BY Año, Mes))/LAG(Ventas) OVER (ORDER BY Año, Mes)*100,1) AS CrecimientoPorc
FROM ventas_mensuales

ORDER BY Año, Mes;


-- 2. Ticket Promedio por Segmento (¿Quién gasta más?)

SELECT 
    cl.Segmento,
    COUNT(*)                    AS NumVentas,
    ROUND(SUM(f.MontoNeto),0)   AS TotalVentas,
    ROUND(AVG(f.MontoNeto),0)   AS TicketPromedio
FROM fctventas f

JOIN dimcliente cl ON f.ClienteKey = cl.ClienteKey

GROUP BY		cl.Segmento
ORDER BY		TicketPromedio DESC;


-- 3. Descuento por Canal (¿Dónde regalamos más?)

SELECT 
    f.CanalVenta,
    ROUND(AVG(f.DescuentoPct),1)   AS DescuentoPromedio,
    ROUND(SUM(f.MontoNeto),0)      AS VentasNetas
FROM fctventas f

GROUP BY		f.CanalVenta
ORDER BY		DescuentoPromedio DESC;


-- 4. Rentabilidad Producto (¿Ganamos con conservas?)

SELECT 
    p.NombreProducto,		p.Categoria,
    SUM(f.Unidades)                                     AS Unidades,
    ROUND(SUM(f.MontoBruto),0)                          AS Bruto,
    ROUND(SUM(f.MontoNeto),0)                           AS Neto,
    ROUND((SUM(f.MontoNeto)/SUM(f.MontoBruto))*100,1)   AS MargenPorc
FROM fctventas f

JOIN dimproducto p ON f.ProductoKey = p.ProductoKey

GROUP BY		p.ProductoKey,		p.NombreProducto,		p.Categoria
ORDER BY		Neto DESC;


-- 5. Eficiencia Sucursal (¿Cuánto cuesta cada operación?)

SELECT 
    s.NombreSucursal,
    COUNT(*)                               AS Operaciones,
    ROUND(SUM(o.CosteOperacion),0)         AS CosteTotal,
    ROUND(AVG(o.CosteOperacion),0)         AS CostePromedio,
    ROUND(AVG(o.TiempoPreparacionMin),1)   AS PrepMinPromedio
FROM fctoperaciones o

JOIN dimsucursal s ON o.SucursalKey = s.SucursalKey

GROUP BY		s.SucursalKey,		s.NombreSucursal
ORDER BY		CosteTotal DESC;
