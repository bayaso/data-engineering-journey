⭐ 2. Python Drills(functions)

# ✔ Square list


def square_all(nums):
    new_list = []
    for num in nums:
        new_list.append(num ** 2)
    return new_list


# Filter DataFrame by price
def filter_by_min_price(df, min_price):
    filtered = df.loc[df['price'] >= min_price]
    return filtered

# ✔ Group totals


def add_group_totals(df):
    df['total'] = df['price'] * df['quantity']
    grouped = df.groupby('customer_id')['total'].sum()
    return grouped
