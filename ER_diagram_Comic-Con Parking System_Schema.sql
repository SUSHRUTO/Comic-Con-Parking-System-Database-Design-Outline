title Comic-Con Parking System

// VEHICLES

vehicles [icon: car, color: blue] {
  id char(36) pk
  license_plate varchar(20) unique not null
  vehicle_type_id char(36) fk
  owner_name varchar(100)
}

// VEHICLE TYPES

vehicle_types [icon: truck, color: teal] {
  id char(36) pk
  type_name varchar(50)
  size_category varchar(20)
}

// ZONES

zones [icon: map, color: green] {
  id char(36) pk
  name varchar(50)
  level int
  base_price decimal(10,2)
}

// PARKING SPOTS

parking_spots [icon: square, color: yellow] {
  id char(36) pk
  zone_id char(36) fk
  spot_code varchar(20)
  is_active boolean
}

// SPOT STATUS (REAL-TIME)

spot_status [icon: activity, color: red] {
  id char(36) pk
  spot_id char(36) fk
  is_occupied boolean
  updated_at timestamp
}

// RESERVATIONS (PRE-BOOKING)

reservations [icon: calendar, color: purple] {
  id char(36) pk
  vehicle_id char(36) fk
  spot_id char(36) fk
  reserved_from timestamp
  reserved_to timestamp
  status varchar(20)
}

// TICKETS

tickets [icon: tag, color: orange] {
  id char(36) pk
  ticket_number varchar(50) unique
  issued_at timestamp
}

// PARKING SESSIONS

parking_sessions [icon: clock, color: red] {
  id char(36) pk
  vehicle_id char(36) fk
  ticket_id char(36) fk
  spot_id char(36) fk
  entry_time timestamp
  exit_time timestamp
  status varchar(20)
}

// ENTRY LOGS (GATE SYSTEM)

entry_logs [icon: log-in, color: teal] {
  id char(36) pk
  session_id char(36) fk
  gate_number int
  entry_time timestamp
}

// EXIT LOGS

exit_logs [icon: log-out, color: teal] {
  id char(36) pk
  session_id char(36) fk
  gate_number int
  exit_time timestamp
}

// PRICING RULES

pricing_rules [icon: dollar-sign, color: green] {
  id char(36) pk
  zone_id char(36) fk
  price_per_hour decimal(10,2)
  peak_multiplier decimal(5,2)
  start_time time
  end_time time
}

// PENALTIES

penalties [icon: alert-triangle, color: red] {
  id char(36) pk
  session_id char(36) fk
  amount decimal(10,2)
  reason varchar(100)
}

// PAYMENTS

payments [icon: credit-card, color: blue] {
  id char(36) pk
  session_id char(36) fk
  amount decimal(10,2)
  status varchar(20)
  paid_at timestamp
}

// INVOICES (ADVANCED)

invoices [icon: file-text, color: purple] {
  id char(36) pk
  session_id char(36) fk
  total_amount decimal(10,2)
  generated_at timestamp
}

// INVOICE ITEMS

invoice_items [icon: list, color: purple] {
  id char(36) pk
  invoice_id char(36) fk
  item_type varchar(50)
  amount decimal(10,2)
}

// CONNECTIONS

vehicles.vehicle_type_id > vehicle_types.id

parking_spots.zone_id > zones.id
spot_status.spot_id > parking_spots.id

reservations.vehicle_id > vehicles.id
reservations.spot_id > parking_spots.id

parking_sessions.vehicle_id > vehicles.id
parking_sessions.ticket_id > tickets.id
parking_sessions.spot_id > parking_spots.id

entry_logs.session_id < parking_sessions.id
exit_logs.session_id < parking_sessions.id

pricing_rules.zone_id > zones.id

penalties.session_id < parking_sessions.id

payments.session_id < parking_sessions.id

invoices.session_id < parking_sessions.id
invoice_items.invoice_id < invoices.id