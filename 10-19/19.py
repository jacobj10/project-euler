day = 0
month = 0
year = 1901

day_of_week = 0
result = 0
months_with_30_days = [3,5,8,10]

def get_next_day(day, month, year):
	next = day + 1
	if month in months_with_30_days:
		return next % 30
	elif month == 1:
		is_leap_year = (year % 100 == 0 and year % 400 == 0) or (year % 100 != 0 and year % 4 == 0)
		return next % (28 + (1 if is_leap_year else 0))
	else:
		return next % 31
			
while year != 2001:
	if day_of_week == 6 and day == 1:
		result += 1
	next_day = get_next_day(day, month, year)
	next_month = month
	next_year = year
	if next_day < day:
		next_month = (month + 1) % 12
	if next_month < month:
		next_year += 1
	day_of_week = (day_of_week + 1) % 7
	
	day = next_day
	month = next_month
	year = next_year

	print("Today is: {}/{}/{} {}".format(day, month, year, day_of_week))
print(result)
	
