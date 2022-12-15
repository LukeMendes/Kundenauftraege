/*alle Aufträge des Kunden "Maier GmbH"*/
SELECT Auftrag.AuftragsNr, Auftrag.Datum FROM Auftrag, Kunde
WHERE Auftrag.KundenNr = Kunde.KundenNr && Kunde.name = "Maier GmbH";

/*Kundennummer, Namen der Kunden und die Anzahl der Aufträge zeigen*/
SELECT Kunde.KundenNr, Kunde.Name, COUNT(*) FROM Kunde, Auftrag
WHERE Kunde.KundenNr = Auftrag.KundenNr GROUP BY Kunde.KundenNr;

/*m:n Beziehung als relationales Modell*/
Kunde (KundenNr PRIMARY KEY, Name, Strasse, PLZ, Ort)
Auftrag (AuftragsNr PRIMARY KEY , Datum, KundenNr FOREIGN KEY)
Komponente(ArtikelNr PRIMARY KEY, Bezeichnung, Verkaufspreis)
gilt_für(ArtikelNr PRIMARY KEY FOREIGN KEY, AuftragsNr PRIMARY KEY FOREIGN KEY, Anzahl)

/*Kundennummer und den Gesamtumsatz durch diesen Kunden zeigen*/
SELECT Kunde.KundenNr, SUM(Komponente.Verkaufspreis * gilt_für.Anzahl) AS "Umsatz"
FROM Kunde, Auftrag, gilt_für, Komponente
WHERE Kunde.KundenNr = Auftrag.KundenNr &&
Auftrag.AuftragsNr = gilt_für.AuftragsNr &&
gilt_für.ArtikelNr = Komponente.ArtikelNr GROUP BY Kunde.KundenNr;
