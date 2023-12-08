#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Dec  8 07:41:19 2023

@author: viole
"""

import numpy as np
import matplotlib.pyplot as plt


priace_input = np.array([0.2219, 0.444, 4.437, 8.873])# /1,000 token
priace_output = np.array([0.2958, 0.592, 8.873, 17.746])#/1,000 token

input_num = 27/1000*10*20*200
output_num = 569/1000*10*20*200

# Define items and their corresponding values
values = input_num * priace_input + output_num * priace_output

plt.figure(figsize=(12,8))
plt.rcParams["font.size"] = 25
plt.rcParams['font.family']='Times New Roman'
plt.rcParams['xtick.direction'] = 'in'
plt.rcParams['ytick.direction'] = 'in'


# Create a bar graph
items = ['GPT-3.5-Turbo\n(4K)', 'GPT-3.5-Turbo\n(16K)', 'GPT-4\n(8K)', 'GPT-4\n(32K)']

plt.bar(items, values)

# Add title and axis labels to the graph
# plt.title('cost')
plt.xlabel('AI model')
plt.ylabel('¥')

# Display the graph
plt.show()
