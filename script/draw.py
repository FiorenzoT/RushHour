import matplotlib.pyplot as plt 
import numpy as np
import os
import sys

nome_script, nome_configurazione = sys.argv

# Set ambiente grafico
plt.xlim(1,7) 
plt.ylim(7,1) 

ax = plt.subplot()
ax.tick_params(top=True, bottom=False)
ax.tick_params(labeltop=True, labelbottom=False)

plt.grid() 

x_exit = [ 3+0.10, 4-0.08 ]
y_exit = [ 7, 7 ]



# Lettura dei file
position = open("data/position.dat",'r')
lines = position.readlines()
position.close()

cars = open("data/cars.dat",'r')
car = cars.readlines()
cars.close()


# Inizializzazioni
dim_r = 0
# dim_b = 0
# dim_k = 0
# dim_g = 0
# dim_c = 0
# dim_m = 0

mov_r = ''
# mov_b = ''
# mov_k = ''
# mov_g = ''
# mov_c = ''
# mov_m = ''

dim_b1 = ''
mov_b1 = '' 

dim_b2 = ''
mov_b2 = ''

dim_b3 = ''
mov_b3 = ''

dim_b4 = ''
mov_b4 = ''

dim_b5 = ''
mov_b5 = ''

dim_b7 = ''
mov_b7 = ''

dim_b8 = ''
mov_b8 = ''

dim_b9 = ''
mov_b9 = ''

dim_b10 = ''
mov_b10 = ''

dim_b11 = ''
mov_b11 = ''

dim_b12 = ''
mov_b12 = ''

dim_block = ''





i = 0
maximum = len(car)

# Per ciasun auto, salvo il nome, la sua dimensione e la sua direzione
while i < maximum:
	row = car[i].split()
	name = row[0]
	dim = str(row[1])
	mov = row[2]

	if name == 'r':
		dim_r = dim
		mov_r = mov
	elif name == 'b1':
		dim_b1 = dim
		mov_b1 = mov
	elif name == 'b2':
		dim_b2 = dim
		mov_b2 = mov
	elif name == 'b3':
		dim_b3 = dim
		mov_b3 = mov
	elif name == 'b4':
		dim_b4 = dim
		mov_b4 = mov
	elif name == 'b5':
		dim_b5 = dim
		mov_b5 = mov
	elif name == 'b6':
		dim_b6 = dim
		mov_b6 = mov
	elif name == 'b7':
		dim_b7 = dim
		mov_b7 = mov
	elif name == 'b8':
		dim_b8 = dim
		mov_b8 = mov
	elif name == 'b9':
		dim_b9 = dim
		mov_b9 = mov
	elif name == 'b10':
		dim_b10 = dim
		mov_b10 = mov
	elif name == 'b11':
		dim_b11 = dim
		mov_b11 = mov
	elif name == 'b11':
		dim_b12 = dim
		mov_b12 = mov
	elif name == 'block' or name == 'block1':
		dim_block = dim		
		mov_block = mov


	i = i + 1





############################################
############# DISEGNO NEL TEMPO ############

end = 0 		# Usato per uscire dal ciclo esterno una volta letto tutto il file
i = 0
maximum = len(lines)
row = lines[0].split()

while i <= maximum and end == 0:	
	time = row[0]
	next_time = time
	count = 0 			# rappresenta il numero di auto con lo stesso tempo T trovate
	
	# Il tempo della riga successiva deve essere lo stesso del tempo attuale
	# per poter disegnare nella stessa finestra temporale le auto
	while next_time == time and end == 0 :
		color = row[1]
		x = row[2]
		y = row[3]
		
		# switch in base al colore
		if color == 'r':
			dim = dim_r
			mov = mov_r
		if color == 'b1':
			dim = dim_b1
			mov = mov_b1
		if color == 'b2':
			dim = dim_b2
			mov = mov_b2
		if color == 'b3':
			dim = dim_b3
			mov = mov_b3
		if color == 'b4':
			dim = dim_b4
			mov = mov_b4
		if color == 'b5':
			dim = dim_b5
			mov = mov_b5
		if color == 'b6':
			dim = dim_b6
			mov = mov_b6
		if color == 'b7':
			dim = dim_b7
			mov = mov_b7
		if color == 'b8':
			dim = dim_b8
			mov = mov_b8
		if color == 'b9':
			dim = dim_b9
			mov = mov_b9
		if color == 'b10':
			dim = dim_b10
			mov = mov_b10
		if color == 'b11':
			dim = dim_b11
			mov = mov_b11
		if color == 'b12':
			dim = dim_b12
			mov = mov_b12
		if color == 'block':
			dim = dim_block
			mov = mov_block

		#print(mov)
		#print("Auto = "+str(color)+" "+str(dim)+" "+str(mov))

		# Check per disegnare i segmenti della giusta dimensione (2 o 3), in base all'orientamento
		if mov == 'h':
			if color != 'block' and color != 'block1':
				x = [ float(x) + 0.5, float(x) + 0.5 ]
				y = [ float(y) + 0.5, float(y) + 0.5 + float(dim) - 1 ]
			elif color == 'block':
				x_block = [ float(x) + 0.5, float(x) + 0.5 ]
				y_block = [ float(y) + 0.49, float(y) + 0.5 ]
			elif color == 'block1':
				x_block1 = [ float(x) + 0.5, float(x) + 0.5 ]
				y_block1 = [ float(y) + 0.49, float(y) + 0.5 ]

		elif mov == 'v':
			x = [ float(x) + 0.5, float(x) + 0.5 + float(dim) - 1 ]
			y = [ float(y) + 0.5, float(y) + 0.5 ]



		# Check per prendere la riga successiva se disponibile
		if (i+1+count) < maximum:
			row = lines[i+1+count].split()
			next_time = row[0]
			count = count + 1
		else:
			end = 1
			

		# Plot dell'auto nel tempo T
		if color == 'r':
			plt.plot(y,x,'r',linewidth=40) 
		elif color == 'block':
			plt.plot(y_block,x_block,'k',linewidth=50) 
		elif color == 'block1':
			plt.plot(y_block1,x_block1,'k',linewidth=50) 
		else:
			plt.plot(y,x,'b',linewidth=40) 

	# Salvataggio nuova figura, pulizia e ricreazione ambiente
	ax.plot(y_exit,x_exit,'r',linewidth=10)		# Disegno uscita
	ax.set_aspect('equal')
	plt.savefig("images/"+nome_configurazione+"/"+str(time)+".png")


	plt.clf()
	plt.xlim(1,7) 
	plt.ylim(7,1) 

	ax = plt.subplot()
	ax.tick_params(top=True, bottom=False)
	ax.tick_params(labeltop=True, labelbottom=False)

	plt.grid() 

	# Aggiorno i in base a quante auto ho trovato con lo stesso tempo
	i = i + count


os.system("cd images/" + nome_configurazione + " && convert -delay 20 -loop 0 $(ls -1 *.png | sort -n) movie.gif")


	