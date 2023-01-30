import pandas as pd
import matplotlib.pyplot as plt

# creating dataframe
df = pd.DataFrame({
	'Name': ['Sample01', 'Sample02', 'Sample03'],
	'Minimize': [3.459, 5.022, 125.163],
	'Multishot': [0.647, 10.224, 41.340]
})

# plotting graph
df.plot(x="Name", y=["Minimize", "Multishot"], kind="bar", logy=True, rot=0)


plt.savefig("minimize_vs_multishot.png")