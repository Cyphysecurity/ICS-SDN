"""Plot the solution that was generated by differential_equation.py."""
 
from numpy import loadtxt
from pylab import figure, plot, xlabel, grid, hold, legend, title, savefig
from matplotlib.font_manager import FontProperties
 
 
t, x1, xy, x2, = loadtxt('result_differential.dat', unpack=True)
 
figure(1, figsize=(6, 4.5))
 
xlabel('t')
grid(True)
hold(True)
lw = 1
 
plot(t, x1, 'b', linewidth=lw)
plot(t, x2, 'g', linewidth=lw)
 
legend((r'$x_1$', r'$x_2$'), prop=FontProperties(size=16))
title('Tank Levels without Control')
savefig('francisco_topo.png', dpi=100)