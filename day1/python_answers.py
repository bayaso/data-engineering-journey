# 1. Square function
def square(x):
    return x ** 2

# 2. Filter > 10 (loop version)


def filter_greater_than_10(nums):
    result = []
    for num in nums:
        if num > 10:
            result.append(num)
    return result

# . Filter > 10 (list comprehension)


def filter_greater_than_10_lc(nums):
    new_list = [num for num in nums if num > 10]
    return new_list

# 4. Pandas filter for non-null


def filter_not_null(df, column):
    filtered = df[df[column].notnull()]
    return filtered

# 5. Function with default parameter


def calculate_total(price, quantity, tax_rate=0.10):
    total = price * quantity
    total_with_tax = total * (1 + tax_rate)
    return total_with_tax

# 6. Error handling


def safe_divide(a, b):
    try:
        divide_1 = a / b
        return divide_1
    except ZeroDivisionError:
        return "Cannot divide by zero."
    except TypeError:
        return "Inputs must be numbers."
