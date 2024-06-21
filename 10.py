
HIGH_NUMBER = 2000000
nums = [True] * HIGH_NUMBER
total = 0
for i in range(2, HIGH_NUMBER):
    if nums[i]:
        total += i
        j = 2 * i
        while j < HIGH_NUMBER:
            nums[j] = False
            j += i

print(total)
