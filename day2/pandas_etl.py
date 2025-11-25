# 1. INNER JOIN equivalent
merged_inner = employees.merge(
    departments,
    left_on='department_id',
    right_on='id',
    how='inner'
)

merged_inner[['name', 'department_name']]

# 2. LEFT JOIN equivalent
merged_left = employees.merge(
    departments,
    left_on='department_id',
    right_on='id',
    how='left'
)

merged_left[['name', 'department_name']]

# 3. Multi-table merge (employees → departments → roles)
merged_all = employees.merge(
    departments,
    left_on='department_id',
    right_on='id',
    how='left'
).merge(
    roles,
    left_on='role_id',
    right_on='id',
    how='left'
)

merged_all[['name', 'department_name', 'role_name']]

# 4. Merge with custom suffixes
merged_suffixes = employees.merge(
    departments,
    left_on='department_id',
    right_on='id',
    how='inner',
    suffixes=('_emp', '_dept')
)

# 5. Multi-key merge
merged_multi_key = orders.merge(
    returns,
    on=['order_id', 'customer_id'],
    how='inner'
)

# 6. Anti-join (find orders NOT returned)
merged = orders.merge(
    returns,
    on=['order_id', 'customer_id'],
    how='left'
)

orders_not_returned = merged[merged['return_date'].isna()]

---------------------------------------------------
# ⭐ PART 2 — FULL ETL PIPELINE (END-TO-END)
---------------------------------------------------

T  # his is the cleaned, final combined ETL script.

# STEP 1 — Clean dirty rows
orders = orders.dropna(subset=['price', 'quantity'])

# STEP 2 — Add calculated column
orders['total_amount'] = orders['price'] * orders['quantity']

# STEP 3 — Enrich with customer data (LEFT JOIN)
merged = orders.merge(
    customers,
    on='customer_id',
    how='left'
)

# STEP 4 — Select final output columns
final = merged[['name', 'region', 'product', 'total_amount']]
