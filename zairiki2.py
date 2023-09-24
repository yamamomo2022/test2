#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Sep 17 15:00:02 2023

@author: viole
"""

import numpy as np
import matplotlib.pyplot as plt


h_beam_properties = {
    "H150x75x5x7": {"Ix": 666, "Iy": 49.5, "Zx": 88.8}, 
    "H125x125x6.5x9": {"Ix": 839, "Iy": 293, "Zx": 134} 
}

ss400_properties = {
    "縦弾性係数 (ヤング率)": 206000,  # 単位: MPa
    "基準強さ": 402,  # 単位: MPa
}


L = 500 * 1e-3 # mm
W = 1000 # N
x = L # m
z = - 75 * 1e-3 # m
E = 206000 * 1e6 # Pa,N/m^2 
Ix = 666 * 1e-8 # m^4


Q_max = W
M_max = W*(0-L)
sigma_max = M_max/Ix*z
S = 402 * 1e6 / sigma_max
w = W/(E*Ix)*(1/6*x**3 - L**2/2*x + 1/3*x**2 )


print("---Answer_1---")
print("Qmax = {} N".format(Q_max))
print("Mmax = {} Nm".format(M_max))
print("sigma_max = {} N/m^2".format(sigma_max))
print("S = {}".format(S))
print("wmax = {} m".format(w))


print(" ")
"""
------------------------------------------------------
"""


L = 2500 * 1e-3 # m
W = 20000 # N
x = L / 2 * 1e-3 # m
z = - 125/2 * 1e-3 # m
E = 206000 * 1e6 # Pa,N/m^2 
Ix = 847 * 1e-8 # m^4


Q_max = 0.5 * W
w = - 0.5*W/(E*Ix)*(1/6*x**3 - L**2/8*x)
M_max = -w*E*Ix
sigma_max = M_max/Ix*z
S = 402 * 1e6 / sigma_max


print("---Answer_2---")
print("Qmax = {} N".format(Q_max))
print("Mmax = {} Nm".format(M_max))
print("sigma_max = {} N/m^2".format(sigma_max))
print("S = {}".format(S))
print("wmax = {} m".format(w))


