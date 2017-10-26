def arr_min(arr):
    a = arr[0]
    for i in arr:
        if i < a:
            a = i
    return a


def arr_avg(arr):
    s = 0
    for i in arr:
        s += i
    return s / len(arr)


arr1 = [43, 54, 22, 2, 345, 4]

print(arr_min(arr1))
print(arr_avg(arr1))
