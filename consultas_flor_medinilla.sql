-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
-- TRABAJO: CONSULTAS DE BASE DE DATOS
-- DOCENTE: FLOR MEDINILLA, PATRICIA MABEL
-- FECHA: 8/06/2026
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                              01_AGREGAR NUEVO PROPIETARIO
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
INSERT INTO owners (
first_name,
last_name,
company_name,
email,
phone,
tax_id,
address_line1,
city,
state,
country,
postal_code
)
VALUES (
'André',
'Taylor',
'Torogoz Tour El Salvador',
'andretaylor@torogoztuor.com.sv',
'+503 7123-4567',
'SV-98765432',
'Avenida Roosevelt 75',
'San Salvador',
'San Salvador',
'El Salvador',
'503'
);

-- Visualizando propietario nuevo
SELECT * FROM owners WHERE owner_id= 21;



-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                              02_AGREGAR ALOJAMIENTO VINCULADO
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
INSERT INTO accommodations (
owner_id,
accommodation_type_id,
location_id,
name,
description,
max_guests,
bedroom_count,
bathroom_count,
base_price_per_night,
currency_code,
check_in_time,
check_out_time,
is_active
)
VALUES (
(SELECT owner_id FROM owners WHERE email = 'andretaylor@torogoztuor.com.sv'),
1, -- 1 = Hotel
1, -- location_id existente
'Hotel Vista del Volcán',
'Hermoso hotel con vista privilegiada al volcán Santa Ana, rodeado de naturaleza.',
4,
4,
3,
199.99,
'USD',
'14:00:00',
'11:00:00',
TRUE
);


--Visualizando alojamiento vinculado al dueño propietario
SELECT * FROM accommodations WHERE owner_id = 21;



-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                              03_INSERTAR HUESPED Y RESERVA
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

-- INSERTANDO HUESPED
INSERT INTO guests (
first_name,
last_name,
email,
phone,
date_of_birth,
nationality,
passport_number,
emergency_contact_name,
emergency_contact_phone
)
VALUES (
'Irene',
'Estrada',
'ireneestrada214@gmail.com',
'+503 6234-5678',
'1995-08-20',
'El Salvador',
'SV12345678',
'Victor Estrada',
'+503 6111-2222'
);

SELECT * FROM guests WHERE email = 'ireneestrada214@gmail.com';

-- INSERTANDO RESERVA
INSERT INTO bookings (
guest_id,
accommodation_id,
booking_status_id,
check_in_date,
check_out_date,
adult_count,
child_count,
subtotal_amount,
tax_amount,
discount_amount,
total_amount,
special_requests,
booking_reference
)
VALUES (
(SELECT guest_id FROM guests WHERE email = 'ireneestrada214@gmail.com'),
1, -- accommodation_id existente
1, -- 1 = Pending
'2026-07-15',
'2026-07-20',
2,
0,
300.00,
119.99,
0.00,
419.99,
'Habitación en piso alto, preferiblemente con vista al volcán.',
'BK-SVTEST01'
);

-- Visualizando alojamiento de huesped 
SELECT * FROM bookings WHERE guest_id = 101;


-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                             04_INSERTAR PAGO
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

INSERT INTO payments (
booking_id,
amount,
payment_method,
payment_status,
transaction_reference,
notes
)
VALUES (
(SELECT booking_id FROM bookings WHERE booking_reference = 'BK-SVTEST01'),
419.99,
'Tarjeta de Crédito',
'Completed',
'TXN-2026-07-001',
'Pago completo realizado en línea mediante tarjeta Visa.'
);


--Visualizando pago
SELECT * FROM payments WHERE booking_id = 101;



-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                           05_SELECCIONAR ALOJAMIENTOS ACTIVOS
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°


SELECT
accommodation_id,
name,
base_price_per_night,
currency_code,
max_guests,
bedroom_count,
bathroom_count,
is_active
FROM accommodations
WHERE is_active = TRUE
ORDER BY base_price_per_night DESC;



-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                           06_SELECCIONAR HUESPED POR NACIONALIDAD
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
SELECT
guest_id,
first_name,
last_name,
email,
nationality,
phone
FROM guests
WHERE nationality = 'El Salvador'
ORDER BY last_name, first_name;


-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                           07_SELECCIONAR RESERVA POR FECHA
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
SELECT
booking_id,
booking_reference,
guest_id,
accommodation_id,
check_in_date,
check_out_date,
total_nights,
total_amount
FROM bookings
WHERE check_in_date BETWEEN '2026-06-01' AND '2026-12-31'
ORDER BY check_in_date ASC;


-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                           08_ACTUALIZAR PRECIO DE RESERVACIÓN
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
UPDATE accommodations
SET
base_price_per_night = 350.00,
updated_at = CURRENT_TIMESTAMP
WHERE accommodation_id = 21;


--Confirmar actualización de precio de reserva
SELECT 
name,
description,
base_price_per_night
FROM accommodations WHERE accommodation_id = 21;



-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                           09_ACTUALIZAR RESERVACIÓN (PENDIENTE A CONFIRMADA)
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
UPDATE bookings
SET
booking_status_id = 2, -- 2 = Confirmed
updated_at = CURRENT_TIMESTAMP
WHERE booking_reference = 'BK-SVTEST01';


--Visualizar actualización de confirmación de reservación
SELECT
    b.booking_id,
    b.booking_reference,
    b.booking_status_id,
    bs.status_name,
    b.updated_at
FROM bookings b
JOIN booking_statuses bs ON b.booking_status_id = bs.booking_status_id
WHERE b.booking_reference = 'BK-SVTEST01';



-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                          10_ELIMINAR COMENTARIO DE HUESPED
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

--Visualisando comentario a eliminar
SELECT * FROM reviews;

--Eliminando comentario
DELETE FROM reviews WHERE review_id = 1;

--Comprobando la eliminación del comentario
SELECT * FROM reviews;



-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                          11_JOIN: RESERVAS +HUESPED (INNER JOIN)
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
SELECT
b.booking_id,
b.booking_reference,
b.check_in_date,
b.check_out_date,
b.total_nights,
b.total_amount,
g.first_name AS guest_first_name,
g.last_name AS guest_last_name,
g.email AS guest_email,
g.nationality
FROM bookings AS b
INNER JOIN guests AS g
ON b.guest_id = g.guest_id
ORDER BY b.check_in_date DESC;
 


-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                          12_JOIN: ALOJAMIENTO COMPLETO ( INNER JOIN MULTIPLE)
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
SELECT
a.accommodation_id,
a.name AS alojamiento,
a.base_price_per_night,
a.currency_code,
a.max_guests,
a.is_active,
o.first_name || ' ' || o.last_name AS propietario,
o.email AS email_propietario,
t.type_name AS tipo_alojamiento,
l.city,
l.state,
l.country
FROM accommodations AS a
INNER JOIN owners AS o
ON a.owner_id = o.owner_id
INNER JOIN accommodation_types AS t
ON a.accommodation_type_id = t.accommodation_type_id
INNER JOIN locations AS l
ON a.location_id = l.location_id
ORDER BY a.accommodation_id;



-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                          13_JOIN: PAGOS +RESERVAS (JOIN COMBINADO)
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
SELECT
p.payment_id,
p.payment_date,
p.amount,
p.payment_method,
p.payment_status,
p.transaction_reference,
b.booking_reference,
b.check_in_date,
b.check_out_date,
b.total_amount AS total_reserva
FROM payments AS p
INNER JOIN bookings AS b
ON p.booking_id = b.booking_id
ORDER BY p.payment_date DESC;

-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                          14_LEFT JOIN SIN RESEÑAS INCLUYE NULLS
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
SELECT
a.accommodation_id,
a.name AS alojamiento,
r.review_id,
r.rating,
r.review_title,
r.review_date
FROM accommodations AS a
LEFT JOIN reviews AS r
ON a.accommodation_id = r.accommodation_id
ORDER BY a.accommodation_id, r.review_date DESC;


-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                          15_LEFT JOIN SIN RESERVAS FILTRAR NULLS
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
SELECT
a.accommodation_id,
a.name AS alojamiento,
a.is_active,
a.base_price_per_night
FROM accommodations AS a
LEFT JOIN bookings AS b
ON a.accommodation_id = b.accommodation_id
WHERE b.booking_id IS NULL
ORDER BY a.accommodation_id;


-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                          16_AGG SUM:  TOTAL DE INGRESO
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
SELECT
a.accommodation_id,
a.name AS alojamiento,
COUNT(b.booking_id) AS total_reservas,
SUM(b.total_amount) AS ingresos_totales,
a.currency_code
FROM accommodations AS a
INNER JOIN bookings AS b
ON a.accommodation_id = b.accommodation_id
GROUP BY
a.accommodation_id,
a.name,
a.currency_code
ORDER BY ingresos_totales DESC;


-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                          17_AGG AVG: PROMEDIO DE CALIFICACIONES (RATING)
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
SELECT
a.accommodation_id,
a.name AS alojamiento,
COUNT(r.review_id) AS total_reseñas,
ROUND(AVG(r.rating), 2) AS promedio_rating,
MIN(r.rating) AS rating_minimo,
MAX(r.rating) AS rating_maximo
FROM accommodations AS a
INNER JOIN reviews AS r
ON a.accommodation_id = r.accommodation_id
GROUP BY
a.accommodation_id,
a.name
ORDER BY promedio_rating DESC;

-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                          18_AGG COUNT + LIMIT: ALOJAMIENTOS MÁS RESERVADOS
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
SELECT
a.accommodation_id,
a.name AS alojamiento,
COUNT(b.booking_id) AS total_reservas
FROM accommodations AS a
INNER JOIN bookings AS b
ON a.accommodation_id = b.accommodation_id
GROUP BY
a.accommodation_id,
a.name
ORDER BY total_reservas DESC
LIMIT 5;

-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                          19_HAVIN MAS DE TRES RESERVAS GROUP BY + HAVING
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
SELECT
a.accommodation_id,
a.name AS alojamiento,
COUNT(b.booking_id) AS total_reservas,
SUM(b.total_amount) AS ingresos_totales
FROM accommodations AS a
INNER JOIN bookings AS b
ON a.accommodation_id = b.accommodation_id
GROUP BY
a.accommodation_id,
a.name
HAVING COUNT(b.booking_id) > 3
ORDER BY total_reservas DESC;

-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--                          20_SUB-CONSULTA (SUBQUERY)
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

SELECT
a.accommodation_id,
a.name AS alojamiento,
a.base_price_per_night,
a.currency_code,
a.max_guests,
a.bedroom_count,
a.bathroom_count,
o.first_name || ' ' || o.last_name AS propietario,
t.type_name AS tipo,
l.city,
l.country
FROM accommodations AS a
INNER JOIN owners AS o
ON a.owner_id = o.owner_id
INNER JOIN accommodation_types AS t
ON a.accommodation_type_id = t.accommodation_type_id
INNER JOIN locations AS l
ON a.location_id = l.location_id
WHERE a.base_price_per_night = (
SELECT MAX(base_price_per_night)
FROM accommodations
);
