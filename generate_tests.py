#!/usr/bin/env python

import random

# k, c, max_palpites, senha, palpites
k = random.randint(1, 9)
c = random.randint(1, 9)
mp = random.randint(1, 100)

s = ""
for i in range(k):
    s += str(random.randint(1, c))

palpites = []
for i in range(mp):
    palpite = ""
    for i in range(k):
        palpite += str(random.randint(1, c))
    palpites.append(palpite)

print(f'{k} {c} {mp} {s} {" ".join(palpites)}')
