def to_rna(dna_strand):
    rna_list = map(get_rna, [c for c in dna_strand])
    return str.join('', rna_list)


def get_rna(dna):
    try:
        value = {'C': 'G', 'G': 'C', 'T': 'A', 'A': 'U'}[dna]
    except KeyError:
        raise ValueError(f'Invalid DNA character: {dna}')

    return value
