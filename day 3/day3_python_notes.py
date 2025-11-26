import pandas as pd

# 🟦 2. Pandas — Window Function Equivalents
# ✔ Dense Rank (SQL → Pandas)
df['rank'] = df.groupby('customer_id')['amount'].rank(
    ascending=False, method='dense'
)
# ✔ LAG equivalent (previous value)
df['previous_amount'] = df.groupby('customer_id')['amount'].shift(1)

# ✔ Running Total (cumulative sum)
df['running_total'] = df.groupby('customer_id')['amount'].cumsum()

# ✔ Filtering Top N
top2 = df.loc[df['rank'] <= 2]

# ✔ Derived metric
top2['diff_from_prev'] = top2['amount'] - top2['previous_amount']

# ✔ Final sort
final = top2.sort_values(by=['customer', 'amount'], ascending=[True, False])

🟦 3. Full Python ETL Pipeline(End-to-End)
# ✔ Extract
orders = pd.read_csv("orders.csv")
customers = pd.read_csv("customers.csv")
products = pd.read_csv("products.csv")

# ✔ Transform (joins)
df1 = orders.merge(customers, on='customer_id', how='left')
df2 = df1.merge(products, on='product', how='left')

# ✔ Transform (window-style columns)

# Dense rank

df2['rank'] = df2.groupby('customer_id')['amount'].rank(
    ascending=False, method='dense'
)


# Previous amount

df2['previous_amount'] = df2.groupby('customer_id')['amount'].shift(1)


# Running total

df2['running_total'] = df2.groupby('customer_id')['amount'].cumsum()


# Derived metric

df2['diff_from_prev'] = df2['amount'] - df2['previous_amount']


# Filter

top2 = df2.loc[df2['rank'] <= 2]


# Final sort

final = top2.sort_values(by=['customer', 'amount'], ascending=[True, False])

# ✔ Load
final.to_csv("final_orders.csv", index=False)
