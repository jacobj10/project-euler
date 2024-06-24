table = []

x = open('triangle.txt').readlines()

for row in x:
    new_row = []
    for num in row.split(' '):
        new_row.append([int(num), int(num)])
    table.append(new_row)

table = table[::-1]
for i in range (1, len(table)):
    prev_row = table[i - 1]
    curr_row = table[i]
    for j in range(len(curr_row)):
        lmax = prev_row[j][1]
        rmax = prev_row[j + 1][1]
        curr_row[j][1] = max(lmax, rmax) + curr_row[j][0]
print(table[-1][-1])
