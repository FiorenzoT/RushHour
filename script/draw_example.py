import matplotlib.pyplot as plt 
from matplotlib.patches import Rectangle
import numpy as np
import os


# Set ambiente grafico
plt.xlim(1,7) 
plt.ylim(7,1) 

ax = plt.subplot()
ax.tick_params(top=True, bottom=False)
ax.tick_params(labeltop=True, labelbottom=False)

plt.grid() 


# x_exit = [ 3+0.10, 4-0.08 ]
# y_exit = [ 7, 7 ]



# ax.plot(y_exit,x_exit,'r',linewidth=10)
# ax.add_patch(Rectangle((1,1), 6, 1, facecolor='#60BB6A')) # free

# ax.add_patch(Rectangle((1,2), 3, 1, facecolor='#60BB6A')) # free
# ax.add_patch(Rectangle((5,2), 2, 1, facecolor='#60BB6A')) # free

# ax.add_patch(Rectangle((3,3), 1, 1, facecolor='#60BB6A')) # free
# ax.add_patch(Rectangle((5,3), 2, 1, facecolor='#60BB6A')) # free

# ax.add_patch(Rectangle((1,4), 3, 1, facecolor='#60BB6A')) # free
# ax.add_patch(Rectangle((5,4), 2, 1, facecolor='#60BB6A')) # free

# ax.add_patch(Rectangle((1,5), 6, 1, facecolor='#60BB6A')) # free

# ax.add_patch(Rectangle((1,6), 6, 1, facecolor='#60BB6A')) # free


ax.add_patch(Rectangle((1,3), 2, 1, facecolor='#5F5F5F'))
ax.add_patch(Rectangle((4,2), 1, 3, facecolor='#5F5F5F'))

ax.set_aspect('equal')

	# Salvataggio nuova figura, pulizia e ricreazione ambiente
plt.savefig("busy.png")


	