-- 1. Inserire in modo appropriato i campi per effettuare le relative relazioni
-- 2. Gestire in modo appropriato i tipi di campi, chiavi primarie, chiavi esterne per ogni campo di ogni tabella
-- 3. Creare le corrette relazioni alle tabelle
-- 4. Popolare le tabelle manualmente con dati a piacimento. 

--CREATE TABLE ANAGRAFICA (
--idanagrafica INT IDENTITY NOT NULL PRIMARY KEY,
--Cognome NVARCHAR(30) NOT NULL,
--Nome NVARCHAR(30) NOT NULL,
--Indirizzo NVARCHAR(255) NOT NULL,
--Città NVARCHAR(58) NOT NULL, -- 58 caratteri e' la citta'con il nome piu' lungo al mondo :)
--CAP NVARCHAR(5) NOT NULL,
--Cod_Fisc NVARCHAR(16) NOT NULL UNIQUE,
--);


--CREATE TABLE TIPO_VIOLAZIONE (
--idviolazione INT IDENTITY NOT NULL PRIMARY KEY,
--descrizione NVARCHAR(255) NOT NULL,
--);

--CREATE TABLE VERBALE (
--idverbale INT IDENTITY NOT NULL PRIMARY KEY,
--DataViolazione DATE NOT NULL,
--IndirizzoViolazione NVARCHAR(255) NOT NULL,
--Nominativo_Agente NVARCHAR(30) NOT NULL,
--DataTrascrizioneVerbale DATE NOT NULL,
--Importo DECIMAL(10,2) NOT NULL,
--DecurtamentoPunti INT NOT NULL,
--idanagrafica INT NOT NULL,
--idviolazione INT NOT NULL,
--FOREIGN KEY (idanagrafica) REFERENCES ANAGRAFICA(idanagrafica),  --collego le chiavi esterne alle tabaelle di riferimento
--FOREIGN KEY (idviolazione) REFERENCES TIPO_VIOLAZIONE(idviolazione)
--);

--INSERT INTO ANAGRAFICA (Cognome, Nome, Indirizzo, Città, CAP, Cod_Fisc) VALUES
--('Rossi', 'Mario', 'Via Roma 123', 'Milano', '00100', 'RSSMRA80A01H501Z'),
--('Bianchi', 'Luca', 'Via Palermo 456', 'Palermo', '20100', 'BNCLCU82B02F205J'),
--('Verdi', 'Giulia', 'Via Napoli 789', 'Napoli', '80100', 'VRDGIL83C03F839K'),
--('Neri', 'Francesco', 'Via Torino 101', 'Torino', '10100', 'NREFNC84D04G273S'),
--('Gialli', 'Anna', 'Via Firenze 202', 'Firenze', '50100', 'GLLANN85E05D612T'),
--('Viola', 'Roberto', 'Via Bologna 303', 'Bologna', '40100', 'VLRBRT86F06E514U'),
--('Azzurri', 'Sofia', 'Via Palermo 404', 'Palermo', '30100', 'AZZSF87G07F415V');

--INSERT INTO TIPO_VIOLAZIONE (descrizione) VALUES
--('eccesso di velocita'),
--('Sosta vietata'),
--('guida senza casco'),
--('guida in stato di ebbrezza'),
--('mancato rispetto dei segnali stradali'),
--('sorpasso in zona vietata'),
--('cellulare alla guida');

--INSERT INTO VERBALE (DataViolazione, IndirizzoViolazione, Nominativo_Agente, DataTrascrizioneVerbale, Importo, DecurtamentoPunti, idanagrafica, idviolazione) VALUES
--('2022-01-15', 'Via dei Mille 12', '007', '2022-01-16', 420.00, 3, 1, 1),
--('2009-03-20', 'Via Dorsale 23', 'Smith', '2009-03-21', 50.00, 0, 2, 2),
--('2018-03-25', 'Viale Roma 60', 'Mackenzie', '2018-03-26', 200.00, 6, 3, 3),
--('2021-04-30', 'Via Begiola 48', 'Goodnight', '2021-05-01', 450.00, 4, 4, 4),
--('2024-05-05', 'Viottolo dei Molini 23', 'Mr.Bones', '2024-05-06', 250.00, 5, 5, 5),
--('2021-06-10', 'Viale Italia 533', 'Pietro Semerano', '2021-06-11', 100.00, 2, 6, 6),
--('2009-06-15', 'Piazza Concordia 3', 'Smith', '2009-06-16', 300.00, 7, 7, 7);

-- Successivamente, creare le seguenti query per interrogare il database
-- 1. Conteggio dei verbali trascritti
--SELECT COUNT(*) AS TotaleVerbali
--FROM VERBALE

-- 2. Conteggio dei verbali trascritti raggruppati per anagrafe
--SELECT idanagrafica, COUNT(*) AS TotaleVerbaliXAnagrafe
--FROM VERBALE
--GROUP BY idanagrafica;

-- 3. Conteggio dei verbali trascritti raggruppati per tipo di violazione
--SELECT idviolazione, COUNT(*) AS TotaleVerbaliXTipo
--FROM VERBALE
--GROUP BY idviolazione

-- 4. Totale dei punti decurtati per ogni anagrafe
--SELECT idanagrafica, SUM(DecurtamentoPunti) AS TotalePuntiDecurtatiXAnagrafe
--FROM VERBALE
--GROUP BY idanagrafica;

--5. Cognome, Nome, Data violazione, Indirizzo violazione, importo e punti decurtati per tutti gli anagrafici residenti a Palermo
--SELECT A.Cognome, A.Nome, V.DataViolazione, V.IndirizzoViolazione, V.Importo, V.DecurtamentoPunti
--FROM ANAGRAFICA AS A
--INNER JOIN VERBALE AS V ON A.idanagrafica = V.idanagrafica
--WHERE A.Città = 'Palermo';

--6. Cognome, Nome, Indirizzo, Data violazione, importo e punti decurtati per le violazioni fatte tra il febbraio 2009 e luglio 2009
--SELECT A.Cognome, A.Nome, A.Indirizzo, V.DataViolazione, V.Importo, V.DecurtamentoPunti
--FROM ANAGRAFICA AS A
--INNER JOIN VERBALE AS V ON A.idanagrafica = V.idanagrafica
--WHERE V.DataViolazione BETWEEN '2009-02-01' AND '2009-07-31';

--7. Totale degli importi per ogni anagrafico
--SELECT A.Cognome, A.Nome, SUM(V.Importo) AS TotaleImportoXAnagracio
--FROM ANAGRAFICA AS A
--INNER JOIN VERBALE AS V ON A.idanagrafica = V.idanagrafica
--GROUP BY A.Cognome, A.Nome;

--8. Visualizzazione di tutti gli anagrafici residenti a Palermo
--SELECT Cognome, Nome, Indirizzo
--FROM ANAGRAFICA
--WHERE Città = 'Palermo';

--9. Query parametrica che visualizzi Data violazione, Importo e decurta mento punti relativi ad una certa data
--SELECT DataViolazione, Importo, DecurtamentoPunti
--FROM VERBALE
--WHERE DataViolazione = '2021-06-10';

--10. Conteggio delle violazioni contestate raggruppate per Nominativo dell’agente di Polizia
--SELECT Nominativo_Agente, COUNT(*) AS TotaleMulteXAgente
--FROM VERBALE
--GROUP BY Nominativo_Agente;

--11. Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino il decurtamento di 5 punti
--SELECT A.Cognome, A.Nome, A.Indirizzo, V.DataViolazione, V.Importo, V.DecurtamentoPunti
--FROM ANAGRAFICA AS A
--INNER JOIN VERBALE AS V ON A.idanagrafica = V.idanagrafica
--WHERE V.DecurtamentoPunti > 5;

--12. Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino l’importo di 400 euro
--SELECT A.Cognome, A.Nome, A.Indirizzo, V.DataViolazione, V.Importo, V.DecurtamentoPunti
--FROM ANAGRAFICA AS A
--INNER JOIN VERBALE AS V ON A.idanagrafica = V.idanagrafica
--WHERE V.Importo > 400;
