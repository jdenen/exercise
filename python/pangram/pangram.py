ABCs = 'abcdefghijklmnopqrstuvwxyz'


def is_pangram(sentence):
    not_empty = sentence is not ''
    contains_all = all(c in sentence.lower() for c in ABCs)
    return not_empty and contains_all
