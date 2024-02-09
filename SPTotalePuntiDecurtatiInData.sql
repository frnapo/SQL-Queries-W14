-- =============================================
-- Author:		Napoli Francesco
-- Create date: 09/02/2024
-- Description:	SP parametrica che, ricevendo in input una data, visualizzi il totale dei punti decurtati in quella determinata data
-- =============================================
CREATE PROCEDURE TotalePuntiDecurtatiInData 
    @Data DATE
AS
BEGIN
    SELECT SUM(DecurtamentoPunti) AS TotalePuntiDecurtati
    FROM VERBALE
    WHERE DataViolazione = @Data; -- passare il valore di @Data delimitato da '' es '2009-06-15'
END;