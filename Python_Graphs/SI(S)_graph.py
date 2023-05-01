#Code for plotting SIS graphs, or SI if gamma is 0

# Originally by Christian Hill
# https://scipython.com/book/chapter-8-scipy/additional-examples/the-sir-epidemic-model/

#numpy is an advanced numeracy package. Can integrate things, find prime numpers, graph gaussian distribution.
import numpy as np
#scipy package for maths shit, integrate is section within scipy and odient is funtion WITHIN integrate. Saves downloading many functions
#odeint integrates things
from scipy.integrate import odeint
#plotting package 
import matplotlib.pyplot as plt
#google packages or functions if unknown


# Total population, N.
N = 50
# Initial number of infected and recovered individuals, I0 and R0.
I0 = 1
# Everyone else, S0, is susceptible to infection initially.
S0 = N - I0

"""
beta = contact rate, proportion of susceptibles contracting infection daily.
epsilon = time from exposure to infectious. When epsilon = 1/x, x = number of days exposed before infection.
gamma = recovery rate. When gamma = 1/x, x = number of days of infection.
zeta = birth rate
delta = natural death rate, unrelated to infection
rho = death rate due to disease
sigma = total number of contacts by infected

"""

beta = 0.1
gamma = 1/60
zeta = 0
delta = 0 
rho = (gamma(0.1))/(1-gamma)


# A grid of time points (in days)
#linspace is function from numpy
# sets t to start at 0, go to 1000, and put 500 values between
t = np.linspace(0, 1000, 500)


# The SIS model differential equations.
def deriv(y, t, N, beta, gamma, zeta, delta, rho):
    S, I = y
    dSdt = (-beta * (S * I/N)) + (gamma * I) + (zeta * S) - (delta * S)
    dIdt = (beta * (S * I/N)) - ((gamma + delta + rho) * I)
    return dSdt, dIdt


# Initial conditions vector
y0 = S0, I0
# Integrate the SI equations over the time grid, t.
ret = odeint(deriv, y0, t, args=(N, beta, gamma, zeta, delta, rho))
S, I = ret.T


# Plot the data on three separate curves for S(t) and I(t)
fig = plt.figure(facecolor='w')
ax = fig.add_subplot(111, facecolor='#dddddd', axisbelow=True)
plt.plot(t,(S+I),linewidth=3,color='black')
plt.plot(t,S,linewidth=3,color='#B8E186')
plt.plot(t,I,linewidth=3,color='#DE77AE')
plt.xticks(np.arange(0,1001,1000),fontsize=15)
plt.yticks(fontsize=15)

# can write S,I, or R as /N to get proportions, or leave as individual values to get counts
ax.plot(t, (S + I), color ='black', alpha=0.5, lw=2, label='Total Population')
ax.plot(t, S, '#B8E186', alpha=0.5, lw=2, label='Susceptible')
ax.plot(t, I, '#DE77AE', alpha=0.5, lw=2, label='Infectious')

#all of this is aesthetic can change y lim to be 1.2 for proportions or (N + 0.2*N) for individuals
ax.set_xlabel('Time (s)',fontsize=20,labelpad=8)
ax.set_ylabel('Number of Individuals',fontsize=20,labelpad=8)
ax.set_ylim(0,(N + 0.2*N))
ax.grid(visible=False)
ax.set_facecolor('white')
for spine in ('top', 'right', 'bottom', 'left'):
    ax.spines[spine].set_visible(True)
plt.xlim(0,100)

#save plot to computer
plt.savefig('SIS_python_plot.png',dpi=300,bbox_inches='tight')

#display ploy
plt.show()