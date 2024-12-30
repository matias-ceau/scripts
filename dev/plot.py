#!/usr/bin/python

# coding: utf-8
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


def cc_take(total_days, half_life, mass_per_day, intake_frequency):
    def justone(days, td, hf, m):
        timestamps = np.arange(td - days)
        before = [0] * days

        cc = [m * (0.5 ** (t / hf)) for t in timestamps]
        return before + cc

    took_a_pill_days = [0]
    day = 0
    while day < total_days:
        day += intake_frequency
        took_a_pill_days.append(day)
    arr = list(
        justone(d, total_days, half_life, mass_per_day) for d in took_a_pill_days
    )
    arrstack = np.vstack([a for a in arr])
    ploteur = np.vstack(((np.arange(0, total_days / 10, 0.1), arrstack.sum(axis=0))))
    return pd.DataFrame({"days": ploteur[0], f"CC-{h/10}": ploteur[1]})


for h in range(3, 70, 3):
    hf = h / 10
    df = cc_take(total_days=20, half_life=100, mass_per_day=10, intake_frequency=10)
    df.plot(x="days", y=f"CC-{hf}")

plt.show()
