# 🏨 Base de Datos — Sistema de Gestión de Hospedaje Turístico

Tarea sobre consultas en base de datos relacional diseñada en PostgreSQL para gestionar reservas, huéspedes, habitaciones y propietarios de establecimientos de hospedaje turístico. Desarrollada como trabajo académico, parte de capacitación docente.

---

## 📋 Tabla de Contenidos

- [Descripción General](#-descripción-general)
- [Tecnologías](#-tecnologías)
- [Diagrama ER](#-diagrama-ERD)
- [Relaciones entre Tablas](#-relaciones-entre-tablas)
- [Ejemplos de Consultas SQL](#-ejemplos-de-consultas-sql)
- [Documento de Consultas SQL](#-ejemplos-de-consultas-sql)
  
---

## 📌 Descripción General

Este sistema permite administrar las operaciones esenciales de hospedaje. 

- Registro y gestión de **huéspedes** (`guests`)
- Administración de **habitaciones** por tipo y categoría (`rooms`, `room_types`, `room_categories`)
- Control de **reservas** (`bookings`) con fechas, estados y montos
- Registro de **pagos** (`payments`) asociados a reservas
- Gestión de **servicios adicionales** (`services`, `booking_services`)
- Administración de **usuarios del sistema** (`staff_users`)

---

## 🛠️ Tecnologías

| Herramienta | Versión |
|---|---|
| PostgreSQL | 15+ |
| pgAdmin / pgERD | Para diseño y administración |


---

## 🗂️ Estructura del Esquema

### `guests` — Huéspedes
| Columna | Tipo | Descripción |
|---|---|---|
| `guest_id` | SERIAL PK | Identificador único |
| `first_name` | VARCHAR(100) | Nombre |
| `last_name` | VARCHAR(100) | Apellido |
| `email` | VARCHAR(150) UNIQUE | Correo electrónico |
| `phone` | VARCHAR(20) | Teléfono de contacto |
| `nationality` | VARCHAR(100) | Nacionalidad |
| `id_number` | VARCHAR(50) | Número de documento de identidad |
| `created_at` | TIMESTAMP | Fecha de registro |

---

### `room_categories` — Categorías de Habitación
| Columna | Tipo | Descripción |
|---|---|---|
| `category_id` | SERIAL PK | Identificador único |
| `category_name` | VARCHAR(100) | Nombre (Ej: Económica, Premium) |
| `description` | TEXT | Descripción de la categoría |

---

### `room_types` — Tipos de Habitación
| Columna | Tipo | Descripción |
|---|---|---|
| `type_id` | SERIAL PK | Identificador único |
| `type_name` | VARCHAR(100) | Nombre (Ej: Simple, Doble, Suite) |
| `description` | TEXT | Descripción del tipo |
| `base_price` | NUMERIC | Precio base por noche |
| `max_occupancy` | INTEGER | Capacidad máxima de personas |

---

### `rooms` — Habitaciones
| Columna | Tipo | Descripción |
|---|---|---|
| `room_id` | SERIAL PK | Identificador único |
| `room_number` | VARCHAR(10) | Número de habitación |
| `type_id` | INTEGER FK | Tipo de habitación |
| `category_id` | INTEGER FK | Categoría de habitación |
| `floor` | INTEGER | Piso |
| `status` | VARCHAR | Estado (disponible, ocupada, mantenimiento) |
| `description` | TEXT | Descripción adicional |

---

### `bookings` — Reservas
| Columna | Tipo | Descripción |
|---|---|---|
| `booking_id` | SERIAL PK | Identificador único |
| `guest_id` | INTEGER FK | Huésped asociado |
| `room_id` | INTEGER FK | Habitación reservada |
| `check_in_date` | DATE | Fecha de entrada |
| `check_out_date` | DATE | Fecha de salida |
| `status` | VARCHAR | Estado de la reserva |
| `total_amount` | NUMERIC | Monto total |
| `notes` | TEXT | Observaciones |
| `created_at` | TIMESTAMP | Fecha de creación |

---

### `payments` — Pagos
| Columna | Tipo | Descripción |
|---|---|---|
| `payment_id` | SERIAL PK | Identificador único |
| `booking_id` | INTEGER FK | Reserva asociada |
| `amount` | NUMERIC | Monto pagado |
| `payment_date` | TIMESTAMP | Fecha y hora del pago |
| `payment_method` | VARCHAR | Método (efectivo, tarjeta, etc.) |
| `status` | VARCHAR | Estado del pago |

---

### `services` — Servicios Adicionales
| Columna | Tipo | Descripción |
|---|---|---|
| `service_id` | SERIAL PK | Identificador único |
| `service_name` | VARCHAR(100) | Nombre del servicio |
| `description` | TEXT | Descripción |
| `price` | NUMERIC | Precio del servicio |

---

### `booking_services` — Servicios por Reserva
| Columna | Tipo | Descripción |
|---|---|---|
| `booking_service_id` | SERIAL PK | Identificador único |
| `booking_id` | INTEGER FK | Reserva asociada |
| `service_id` | INTEGER FK | Servicio contratado |
| `quantity` | INTEGER | Cantidad |
| `subtotal` | NUMERIC | Subtotal |

---

### `staff_users` — Usuarios del Sistema
| Columna | Tipo | Descripción |
|---|---|---|
| `staff_user_id` | SERIAL PK | Identificador único |
| `first_name` | VARCHAR(100) | Nombre |
| `last_name` | VARCHAR(100) | Apellido |
| `email` | VARCHAR(150) UNIQUE | Correo electrónico |
| `password_hash` | TEXT | Contraseña cifrada |
| `role_name` | VARCHAR(50) | Rol (admin, recepcionista, etc.) |
| `is_active` | BOOLEAN | Cuenta activa (por defecto: true) |
| `created_at` | TIMESTAMP | Fecha de creación |
| `updated_at` | TIMESTAMP | Última actualización |

---



