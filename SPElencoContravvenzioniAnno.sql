-- =============================================
-- Author:		Napoli Francesco
-- Create date: 09/02/2024
-- Description:	SP parametrica che ricevendo in input un anno, visualizzi l’elenco delle contravvenzioni effettuate in un quel determinato anno
-- =============================================
CREATE PROCEDURE ElencoContravvenzioniAnno 
    @Anno INT
AS
BEGIN
    SELECT *
    FROM VERBALE
    WHERE YEAR(DataViolazione) = @Anno; --year permette di estrarre l'anno ricevendo un parametro in questo caso DataViolazione, che verrà poi confrontato con la variabile @Anno che abbiamo definito prima 
END;