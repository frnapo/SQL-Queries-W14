-- =============================================
-- Author:		Napoli Francesco
-- Create date: 09/02/2024
-- Description:	SP che consenta di eliminare un determinato verbale identificandolo con il proprio identificativo
-- =============================================
CREATE PROCEDURE EliminaVerbale 
    @idverbale INT
AS
BEGIN
    DELETE FROM VERBALE
    WHERE idverbale = @idverbale;
END;