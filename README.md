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


