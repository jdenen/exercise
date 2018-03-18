from operator import eq, ne


def is_leap_year(year):
    def check_year(denom, f):
        return f(0, year % denom)

    checks = [check_year(100, ne) or check_year(400, eq), check_year(4, eq)]
    return all(checks)
