# 🚗 Smart Parking Management System – Advanced Database Design

## 📌 Overview

This project presents an **advanced ER diagram and database design** for a modern smart parking system.

The system is designed to handle real-world parking scenarios including:

* Vehicle management
* Dynamic parking allocation
* Reservations and bookings
* Real-time availability tracking
* Entry/exit logging
* Pricing and billing
* Payments and penalties

---

## 🧠 Business Understanding

This is not a basic parking system.
It is designed as a **scalable smart parking platform** suitable for:

* Malls
* Airports
* Smart cities
* Event venues

The system supports both **walk-in parking** and **pre-booked reservations**, along with real-time monitoring and dynamic pricing.

---

## 🎯 Key Features Modeled

* 🚗 Vehicle & vehicle type management
* 🅿️ Parking zones and spots
* 📊 Real-time spot availability tracking
* 📅 Reservation system (pre-booking)
* 🎫 Ticket-based entry system
* ⏱️ Parking session lifecycle tracking
* 🚪 Entry and exit logs (IoT/gate integration ready)
* 💰 Dynamic pricing rules (time-based / zone-based)
* ⚠️ Overstay penalties
* 💳 Payment handling
* 🧾 Invoice generation with itemized billing

---

## 🧩 Entities Included

* **Vehicles**
* **Vehicle Types**
* **Zones**
* **Parking Spots**
* **Spot Status**
* **Reservations**
* **Tickets**
* **Parking Sessions**
* **Entry Logs**
* **Exit Logs**
* **Pricing Rules**
* **Penalties**
* **Payments**
* **Invoices**
* **Invoice Items**

---

## 🔗 Relationships

* One **vehicle** can have multiple parking sessions (1:N)
* One **zone** contains multiple parking spots (1:N)
* One **spot** can be used across multiple sessions over time (1:N)
* One **session** is linked to one vehicle, one spot, and one ticket
* One **session** can generate multiple billing items (via invoices)
* One **invoice** can contain multiple items (1:N)
* One **session** can have penalties and payments

---

## ⚙️ Key Design Decisions

### ✅ 1. Session-Based Architecture

Instead of directly linking vehicles to spots, a **Parking Session** is introduced to:

* Track entry and exit time
* Support reuse of parking spots
* Maintain historical data

---

### ✅ 2. Separation of Reservation and Session

* **Reservations** → booking before arrival
* **Parking Sessions** → actual usage

This allows:

* No-shows
* Advance booking
* Better scheduling

---

### ✅ 3. Real-Time Availability Tracking

A separate **Spot Status** table is used to:

* Track live occupancy
* Enable real-time dashboards

---

### ✅ 4. Dynamic Pricing System

Pricing is handled using a **Pricing Rules** table:

* Supports time-based pricing
* Supports peak-hour multipliers
* Allows zone-specific pricing

---

### ✅ 5. Modular Billing System

Instead of a single payment record:

* **Invoices** + **Invoice Items** are used

This allows:

* Parking fees
* Penalties
* Additional services (like EV charging)

---

### ✅ 6. Entry & Exit Logging

Separate **Entry Logs** and **Exit Logs**:

* Enable gate automation (IoT integration)
* Support multiple gates
* Improve audit tracking

---

## 📊 What This Design Solves

✔ Tracks real-time parking availability
✔ Supports advance booking and reservations
✔ Handles multiple vehicles and sessions
✔ Enables dynamic pricing strategies
✔ Tracks penalties for overstays
✔ Supports detailed billing and invoices
✔ Integrates with smart gate systems
✔ Scales to large parking infrastructures

---

## 🖼️ ER Diagram

> Add your exported diagram below:

![ER Diagram](./ER_diagram_Comic-Con%20Parking%20System_img.png)

---

## 📂 Project Structure

```plaintext
Task_4
│
├── er-diagram/
│   └── eraser.png
│
├── schema/
│   └── eraser-code.txt
│
└── README.md
```

---

## 💡 Notes

* This project focuses only on **database design (ER diagram)**
* No frontend/backend implementation is included
* Designed with **scalability, modularity, and real-world applicability** in mind

---

## 🚀 Author

**Sushruto Majumdar**
