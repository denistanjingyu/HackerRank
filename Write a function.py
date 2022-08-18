def is_leap(year):
    if year % 4 == 0:
        return year % 400 == 0 if year % 100 == 0 else True
    else:
        return False

year = int(input())
print(is_leap(year))