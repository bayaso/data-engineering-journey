# def get_positive_numbers(nums):
#     new_list=[]
#     for num in nums:
#         if num > 0:
#             new_list.append(num)
#     return new_list


# def remove_nulls(df, column):
#    filtered = df.loc[df[column].notna()]
#    return filtered


# def customer_summary(df):
#     df['total_spent']=df['price'] * df['quantity']
#     grouped = df.groupby('customer_id').agg({
#         'avg_quantity':('quantity','mean'),
#         'product_count':('product', 'nunique'),
#         'total_spent':('total','sum')
#         })

#     return grouped
