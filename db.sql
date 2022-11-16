/* ===================================================================
-- Creazione delle tabelle 
-- ================================================================ */

  CREATE TABLE Scalatore(
  CF                    VARCHAR(20)    PRIMARY KEY,
  annoNascita           NUMERIC(4),
  nazioneNascita        VARCHAR(20)
  );
  
  CREATE TABLE Nazione(
  nome                  VARCHAR(20)     PRIMARY KEY,
  continente            CHARACTER(20)
  );

  CREATE TABLE Scalata(
  scalatore            VARCHAR(20),
  nazione              VARCHAR(20),
  anno                 NUMERIC(4),
  PRIMARY KEY (scalatore, nazione, anno)
  );
  
/*  ====================================================================
-- Inserimento di istanze nelle tabelle
-- ================================================================== */

INSERT INTO Scalatore (CF,annoNascita,nazioneNascita) VALUES ('100',1970,'Italia');
INSERT INTO Scalatore (CF,annoNascita,nazioneNascita) VALUES ('200',1979,'Francia');
INSERT INTO Scalatore (CF,annoNascita,nazioneNascita) VALUES ('300',1976,'UK');
INSERT INTO Scalatore (CF,annoNascita,nazioneNascita) VALUES ('400',1976,'UK');
INSERT INTO Scalatore (CF,annoNascita,nazioneNascita) VALUES ('500',1980,'Svezia');
INSERT INTO Scalatore (CF,annoNascita,nazioneNascita) VALUES ('600',1988,'Argentina');
INSERT INTO Scalatore (CF,annoNascita,nazioneNascita) VALUES ('700',1969,'Russia');
INSERT INTO Scalatore (CF,annoNascita,nazioneNascita) VALUES ('800',1965,'Giappone');

INSERT INTO Nazione (nome,continente) VALUES ('Italia','Europa');
INSERT INTO Nazione (nome,continente) VALUES ('UK','Europa');
INSERT INTO Nazione (nome,continente) VALUES ('Francia','Europa');
INSERT INTO Nazione (nome,continente) VALUES ('Spagna','Europa');
INSERT INTO Nazione (nome,continente) VALUES ('USA','America');
INSERT INTO Nazione (nome,continente) VALUES ('Cuba','America');
INSERT INTO Nazione (nome,continente) VALUES ('India','Asia');
INSERT INTO Nazione (nome,continente) VALUES ('Nuova Zelanda','Oceania');
INSERT INTO Nazione (nome,continente) VALUES ('Giappone','Asia');
INSERT INTO Nazione (nome,continente) VALUES ('Russia','Europa');
INSERT INTO Nazione (nome,continente) VALUES ('Argentina','America');
INSERT INTO Nazione (nome,continente) VALUES ('Australia','Oceania');
INSERT INTO Nazione (nome,continente) VALUES ('Cina','Asia');
INSERT INTO Nazione (nome,continente) VALUES ('Canada','America');
INSERT INTO Nazione (nome,continente) VALUES ('Egitto','Africa');

INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('100','Francia', 2014);
INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('100','Spagna', 2012);
INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('100','UK', 2011);
INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('100','Russia', 2014);
INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('100','Australia', 2007);
INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('100','Nuova Zelanda', 2007);
INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('200','Francia', 2014);
INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('200','Cuba', 1998);
INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('100','Cuba', 1998);
INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('100','Italia', 2003);
INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('200','Francia', 2000);
INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('500','India', 2013);
INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('600','Cuba', 2007);
INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('600','India', 2013);
INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('700','Cile', 2005);
INSERT INTO Scalata (scalatore,nazione,anno) VALUES ('700','Austria', 2009);