def reverse(input=''):
    reversed_list = [c for c in input][::-1]
    joined = str.join('', map(str, reversed_list))
    return joined
