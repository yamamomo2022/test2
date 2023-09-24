# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt


bolt_sizes = {
    "M4": 4.0,
    "M5": 5.0,
    "M6": 6.0,
    "M8": 8.0,
    "M10": 10.0,
    "M12": 12.0,
    "M16": 16.0,
    "M20": 20.0,
    "M24": 24.0,
    "M30": 30.0,
    "M36": 36.0,
    "M42": 42.0,
    "M48": 48.0,
    "M56": 56.0,
}

P = np.arange(1,100000) # tf
tf = 9.8 * 10e3 # N

D_list = np.arange(2,400+1,2) * 1e-3 # m

# allowable stress
sigma_max = 60e6 # Pa
tau_max = 40e6 # Pa



fig = plt.figure(figsize=(12,8)) 
plt.rcParams['ytick.direction'] = 'in'
plt.rcParams['xtick.direction'] = 'in'
plt.rcParams['font.size']=25
plt.rcParams['font.family']='Times New Roman'
plt.rcParams['mathtext.fontset'] = 'stix'

plt.gca().xaxis.set_major_formatter(plt.ScalarFormatter(useMathText=True))
plt.gca().ticklabel_format(style='sci',axis='x',scilimits=(0,0))
plt.gca().yaxis.set_major_formatter(plt.ScalarFormatter(useMathText=True))
plt.gca().ticklabel_format(style='sci',axis='y',scilimits=(0,0))

for size, params in bolt_sizes.items():
    D = params * 1e-3 # m
    plt.plot(P,P/((0.5*D)**2 * np.pi ),label=size)


plt.hlines(sigma_max, 0, P.max(),"k", label = "sigma_max")


plt.ylim(0,sigma_max+1e6)
plt.xlim(0,P.max())
plt.xlabel(u"$\it{N}$")
plt.ylabel(u"$\it{N}$ / $m^{2}$")
plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left', borderaxespad=0) # 
plt.show()



fig = plt.figure(figsize=(12,8)) 
plt.rcParams['ytick.direction'] = 'in'
plt.rcParams['xtick.direction'] = 'in'
plt.rcParams['font.size']=25
plt.rcParams['font.family']='Times New Roman'
plt.rcParams['mathtext.fontset'] = 'stix'

plt.gca().xaxis.set_major_formatter(plt.ScalarFormatter(useMathText=True))
plt.gca().ticklabel_format(style='sci',axis='x',scilimits=(0,0))
plt.gca().yaxis.set_major_formatter(plt.ScalarFormatter(useMathText=True))
plt.gca().ticklabel_format(style='sci',axis='y',scilimits=(0,0))

for size, params in bolt_sizes.items():
    d = params * 1e-3 # m
    plt.plot(P,P/(2 * (0.5*d)**2 * np.pi ),label=size)


plt.hlines(tau_max, 0, P.max(),"k", label = "tau_max")


plt.ylim(0,tau_max+1e6)
plt.xlim(0,P.max())
plt.xlabel(u"$\it{N}$")
plt.ylabel(u"$\it{N}$ / $m^{2}$")
plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left', borderaxespad=0) # 
plt.show()



