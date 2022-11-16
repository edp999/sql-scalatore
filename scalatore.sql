/*
1:
Calcolare	l'insieme	(non	il	multi-insieme)	delle	coppie	(A,B)	
tali	che	A	è	uno	scalatore	e	B	è	un	continente	in	cui	A	ha	
effettuato	una	scalata.
*/

SELECT distinct se.cf, n.continente
FROM scalatore se JOIN scalata sa on se.cf = sa.scalatore
    JOIN nazione n on sa.nazione = n.nome
order by se.cf

/*
2:
Per	ogni	scalatore	nato	prima	del	1980,	calcolare	
tutti	i	continenti	in	cui	ha	effettuato	una	scalata,	
ordinando	il	risultato	per	codice	fiscale	e,	a	parità	di	
codice	fiscale,	per	il	nome	del	continente.
*/

SELECT se.cf, n.continente
FROM scalatore se JOIN scalata sa on se.cf = sa.scalatore
    JOIN nazione n on sa.nazione = n.nome
WHERE se.annoNascita<1980
order by se.cf, n.continente

/*
3:
Calcolare	le	nazioni	(mostrando,	per	ciascuna,	anche	il	
continente)	nelle	quali	è	stata	effettuata	almeno	una	scalata	
da	uno	scalatore	minorenne.
*/

SELECT sa.nazione, n.continente
FROM scalatore se JOIN scalata sa on se.cf = sa.scalatore
    JOIN nazione n on sa.nazione = n.nome
WHERE sa.anno-se.annoNascita<18

/*
4:
Per	ogni	nazione,	calcolare	il	numero	di	scalate	effettuate	da	
scalatori	nati	in	quella	nazione
*/

SELECT se.nazioneNascita, count(sa.scalatore)
FROM scalata sa JOIN scalatore se on sa.scalatore=se.cf
group by se.nazioneNascita

/*
5:
Per	ogni	continente,	calcolare	il	numero	di	scalate	effettuate	
da	scalatori	nati	in	una	nazione	di	quel	continente.
*/

SELECT n.continente, count(se.cf)
FROM scalatore se JOIN nazione n on se.nazioneNascita=n.nome
    JOIN scalata sa on se.cf=sa.scalatore
group by n.continente

/*
6:
Calcolare	codice	fiscale,	nazione	di	nascita,	continente	di	
nascita	di	ogni	scalatore	nato	in	un	continente	diverso	
dall’America,	e,	solo	se	egli	ha	effettuato	almeno	una	scalata,	
affiancare	queste	informazioni	alle	nazioni	in	cui	ha	effettuato	
scalate.
*/

SELECT distinct se.cf, se.nazioneNascita, n.continente, sa.nazione
FROM scalatore se JOIN nazione n on se.nazioneNascita=n.nome
    JOIN scalata sa on se.cf=sa.scalatore
WHERE n.continente<>'America'
order by se.cf

/*
7:
Per	ogni	nazione	e	per	ogni	anno,	calcolare	il	numero	di		
scalate	effettuate	in	quella	nazione	e	in	quell’anno,	ma	solo	se	
tale	numero	è	maggiore	di	1.	Nel	risultato	le	nazioni	dello	
stesso	continente	devono	essere	mostrati	in	tuple contigue,	e	
le	tuple relative	allo	stesso	continente	devono	essere	ordinate	
per	anno.
*/

SELECT n.nazione, n.anno, n.conto
FROM (SELECT sa.nazione, sa.anno, count(sa.scalatore) as conto
        FROM scalata sa JOIN nazione na on sa.nazione=na.nome
        group by sa.nazione, sa.anno) n JOIN nazione naz on naz.nome=n.nazione
WHERE n.conto>1
order by naz.continente, n.anno

SELECT sa.nazione, sa.anno, count(sa.scalatore)
FROM scalata sa JOIN nazione na on sa.nazione=na.nome
group by sa.nazione, na.continente, sa.anno
having count(sa.scalatore)>1
order by na.continente

/*
8:
Per	ogni	nazione	N,	calcolare	il	numero	medio	di	
scalate	effettuate	all’anno	in	N da	scalatori	nati	in	
nazioni	diverse	da	N.
*/

SELECT  sa.nazione, (count(se.cf))
FROM scalatore se JOIN scalata sa on se.cf = sa.scalatore
WHERE se.nazioneNascita<>sa.nazione
group by sa.nazione

/*
9:
Calcolare	gli	scalatori	tali	che	tutte	le	scalate	che	
hanno	effettuato	nella	nazione	di	nascita	le	hanno	
effettuate	quando	erano	minorenni.
*/
SELECT distinct se.cf
FROM scalatore se JOIN scalata sa on se.cf=sa.scalatore
WHERE se.cf not in (SELECT se.cf
                    FROM scalatore se JOIN scalata sa on se.cf=sa.scalatore
                    WHERE (sa.anno-se.annoNascita)>=18 and (sa.nazione=se.nazioneNascita)) 
and
      se.cf in (SELECT se.cf 
                FROM scalatore se JOIN scalata sa on se.cf=sa.scalatore
                WHERE se.nazioneNascita=sa.nazione)
/*
ANCORA SBAGLIATO POI SISTEMO ^^^
*/