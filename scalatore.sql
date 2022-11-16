/*
1:
Calcolare	l'insieme	(non	il	multi-insieme)	delle	coppie	(A,B)	
tali	che	A	è	uno	scalatore	e	B	è	un	continente	in	cui	A	ha	
effettuato	una	scalata.
*/

select distinct se.cf, n.continente
from scalatore se join scalata sa on se.cf = sa.scalatore
    join nazione n on sa.nazione = n.nome
order by se.cf

/*
2:
Per	ogni	scalatore	nato	prima	del	1980,	calcolare	
tutti	i	continenti	in	cui	ha	effettuato	una	scalata,	
ordinando	il	risultato	per	codice	fiscale	e,	a	parità	di	
codice	fiscale,	per	il	nome	del	continente.
*/

select se.cf, n.continente
from scalatore se join scalata sa on se.cf = sa.scalatore
    join nazione n on sa.nazione = n.nome
where se.annoNascita<1980
order by se.cf, n.continente

/*
3:
Calcolare	le	nazioni	(mostrando,	per	ciascuna,	anche	il	
continente)	nelle	quali	è	stata	effettuata	almeno	una	scalata	
da	uno	scalatore	minorenne.
*/

select sa.nazione, n.continente
from scalatore se join scalata sa on se.cf = sa.scalatore
    join nazione n on sa.nazione = n.nome
where sa.anno-se.annoNascita<18

/*
4:
Per	ogni	nazione,	calcolare	il	numero	di	scalate	effettuate	da	
scalatori	nati	in	quella	nazione
*/

select se.nazioneNascita, count(sa.scalatore)
from scalata sa join scalatore se on sa.scalatore=se.cf
group by se.nazioneNascita

/*
5:
Per	ogni	continente,	calcolare	il	numero	di	scalate	effettuate	
da	scalatori	nati	in	una	nazione	di	quel	continente.
*/

select n.continente, count(se.cf)
from scalatore se join nazione n on se.nazioneNascita=n.nome
    join scalata sa on se.cf=sa.scalatore
group by n.continente

/*
6:
Calcolare	codice	fiscale,	nazione	di	nascita,	continente	di	
nascita	di	ogni	scalatore	nato	in	un	continente	diverso	
dall’America,	e,	solo	se	egli	ha	effettuato	almeno	una	scalata,	
affiancare	queste	informazioni	alle	nazioni	in	cui	ha	effettuato	
scalate.
*/

select distinct se.cf, se.nazioneNascita, n.continente, sa.nazione
from scalatore se join nazione n on se.nazioneNascita=n.nome
    join scalata sa on se.cf=sa.scalatore
where n.continente<>'America'
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

select n.nazione, n.anno, n.conto
from (select sa.nazione, sa.anno, count(sa.scalatore) as conto
        from scalata sa join nazione na on sa.nazione=na.nome
        group by sa.nazione, sa.anno) n join nazione naz on naz.nome=n.nazione
where n.conto>1
order by naz.continente, n.anno

/*
8:
Per	ogni	nazione	N,	calcolare	il	numero	medio	di	
scalate	effettuate	all’anno	in	N da	scalatori	nati	in	
nazioni	diverse	da	N.
*/

select  sa.nazione, (count(se.cf))
from scalatore se join scalata sa on se.cf = sa.scalatore
where se.nazioneNascita<>sa.nazione
group by sa.nazione

/*
9:
Calcolare	gli	scalatori	tali	che	tutte	le	scalate	che	
hanno	effettuato	nella	nazione	di	nascita	le	hanno	
effettuate	quando	erano	minorenni.
*/
select se.cf
from scalatore se join scalata sa on se.cf=sa.scalatore
where se.cf not in (select se.cf
from scalatore se join scalata sa on se.cf=sa.scalatore
where (sa.anno-se.annoNascita)>18 and (sa.nazione!=se.nazioneNascita))

/*
ANCORA SBAGLIATO POI SISTEMO ^^^
*/