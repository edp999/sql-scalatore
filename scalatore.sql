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

