import matplotlib.pyplot as plt 
import numpy as np


iniziale = open("data/iniziale.dat",'r')
lines = iniziale.readlines()
iniziale.close()





# Disegno situazione iniziale

i = 0
maximum = len(lines)
while i < maximum:
	row1 = lines[i]
	row1 = row1.split(',')

	color = row1[0][0]


	if i+1 < maximum:	
		row2 = lines[i+1]
		row2 = row2.split(',')
		color_next = row2[0][0]
		bus = 0 			# boolean che indica che non si tratta di un autobus (auto lunga 3)


	if i+2 < maximum:
		row3 = lines[i+2]
		row3 = row3.split(',')
		color_next = row3[0][0]
		bus = 1 			# boolean che indica che si tratta di un autobus (auto lunga 3)
	

	# Check per disegnare i segmenti della giusta dimensione (2 o 3)
	if color == color_next and bus == 1:
		x = [ float(row1[0][2]) + 0.5, float(row3[0][2]) + 0.5 ]
		y = [ float(row1[0][4]) + 0.5, float(row3[0][4]) + 0.5 ]
		i = i + 3
	else:
		x = [ float(row1[0][2]) + 0.5, float(row2[0][2]) + 0.5 ]
		y = [ float(row1[0][4]) + 0.5, float(row2[0][4]) + 0.5 ]
		i = i + 2

	# Plot di ciasuna auto	
	ax = plt.plot(y,x,color,linewidth=40) 




# Disegno situazione ad ogni istante di tempo
# 
# ---
#








# Stampa a video del "grafico"

plt.xlim(1,7) 
plt.ylim(7,1) 

ax = plt.subplot()
ax.tick_params(top=True, bottom=False)
ax.tick_params(labeltop=True, labelbottom=False)

plt.grid() 
plt.show()







