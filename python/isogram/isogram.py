import re


def is_isogram(string):
    lf_list = _lowercase_and_filter(string)
    u_list = _make_unique(lf_list)
    return len(lf_list) == len(u_list)


def _make_unique(chars):
    return list(set(chars))


def _lowercase_and_filter(string):
    regexp = re.compile(r'[^-\s]')
    chars = [c for c in string]
    return list(map(lambda c: c.lower(), filter(regexp.search, chars)))
