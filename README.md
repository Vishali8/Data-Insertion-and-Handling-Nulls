 Objective:    Practice inserting, updating, and deleting data

 Schema Overview

Tables Used:

Customers: Buyer details ('customer_id', 'name', 'email', 'created_at')
Products: Catalog of items ('product_id', 'name', 'price', 'category')
Orders: Purchase records ('order_id', 'customer_id', 'product_id', 'order_date', 'quantity')
Payments: Transaction details ('payment_id', 'order_id', 'amount', 'payment_date', 'payment_method')

 Data Operations

INSERT Statements
- Added new customer with missing email ('NULL')
- Inserted product with missing category ('NULL')
- Created order and payment entries with valid foreign key references
- Demonstrated use of default values and NULL handling

UPDATE Statements
- Filled in missing email and category values
- Corrected quantity and payment method for existing records
- Used 'WHERE' clauses to target specific rows

DELETE Statements
- Removed customer and product entries only after deleting dependent 'Orders' and 'Payments'
- Demonstrated safe deletion using foreign key awareness

 Key Learnings

- Referential Integrity: Foreign key constraints prevent orphaned records
- NULL Handling: Inserted and updated fields with missing values safely
- Safe Deletion: Used cascading logic or manual cleanup to avoid constraint errors
- Error Recovery: Re-ran commands with new IDs and added comments for traceability
- Included troubleshooting for constraint violations (`Msg 547`)

---
