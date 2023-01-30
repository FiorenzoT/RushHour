import matplotlib
import pandas as pd
import matplotlib.pyplot as plt 
import numpy as np
#matplotlib.use('Agg')


file = open("data/statistics/times_normal.csv",'r')
lines = file.readlines()
file.close()

# plt.title('Performance')
# plt.grid() 
# plt.ylabel("seconds")

# Questo numero mi indica fino a dove sono le statistiche di alberto
# Da N in poi ci saranno le mie. Questo perche e' in ordine alfabetico 
# Si divide per 2 poiche le righe sono alternate tra il nome del sample e il tempo
max_length = int((len(lines) / 2))
N = int((max_length / 2))


samples = []
times = []
etichette = []

i = 0
maximum = len(lines)
while i < maximum:	
	samples.append(lines[i])
	times.append(float(lines[i+1]))
	i = i + 2


# x = np.arange(len(samples))

# etichette = x[0:N]

i = 0
while i < N:
	tmp = samples[i]
	etichette.append(tmp[8:16])
	i = i + 1

F_times = times[N:max_length]
A_times = times[0:N]


df = pd.DataFrame({
	'Name': etichette[0:N],
	'Version 1': F_times,
	'Version 2': A_times
})

# plotting graph
df.plot(x="Name", y=["Version 1", "Version 2"], kind="bar", logy=True, rot=0)


plt.savefig("images/v1_vs_v2.png")






# plt.bar(etichette, F_times, color='blue', width=0.4, label='Fiorenzo')
# plt.bar(etichette, A_times, color='red',  width=0.4, label='Alberto' )


# plt.legend(shadow=True, loc='upper left')

# plt.savefig('images/stats.jpeg')


plt.show()