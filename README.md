# RushHour

## Utilizzo

Sotto la directory _configuration/_ sono presenti le parti estensionali del programma, all'interno delle quali vengono dichiarate le auto e le loro posizioni iniziali.

I sample che hanno nel loro nome lo 0 sono i più semplici, gli altri hanno una difficoltà maggiore e con tempi di risoluzione maggiori.


Ci sono 3 varianti del programma:

* Una versione "normale";
* Una versione utilizzando la _minimize_;
* Una versione che utilizza le direttive per l'_incremental solving_.

### Utilizzo con clingo

Per eseguire con clingo è necessario passare il parametro del tempo l:

    clingo configuration/sample01.lp rush_hour.lp -c l=22

Nella prima riga di ogni sample è indicato il tempo minimo di esecuzione.


### Utilizzo con script

Utilizzare lo script _1-go_ ci permette di eseguire indicando solo il nome del sample e il tempo. In più salva nella directory _images/nome\_sample/_ le immagini che rappresentano la situazione nella griglia in ogni tempo.
Un file gif permette di vedere in sequenza la risoluzione di quello specifico sample.

	sh 1-go sample01.lp 22


### Utilizzo con multishot

Per utilizzare l'incremental solving lanciare il comando:

	python3 inc.py configuration/sample01.lp rush_hour_multishot.lp

#### Attenzione!
File di configurazione più complicati (_sample1_,_sample2_,...,_sample23_) non funzionano con il multishot per via di un aggiunta fatta sul momento: sono stati codificati con dei fatti dei blocchi unitari che rimangono fermi (come fossero dei muri).

Per queste versioni si consiglia di eseguire con:

	sh 1-go sample1.lp 104

Tempo medio di calcolo per versioni più complicate: ± 250 secondi
