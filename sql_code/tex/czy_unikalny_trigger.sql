USE [psoltysiak]
GO
CREATE TRIGGER [dbo].[sprawdz_PESEL]
ON [dbo].[Osoba]
FOR INSERT
AS
BEGIN
declare @unikalny as bit;
declare @osoba_pesel as int;

set @osoba_pesel = (select PESEL from inserted);
exec @unikalny = dbo.Czy_Pesel_jest_Unikalny @PESEL=@osoba_pesel
if @unikalny = 1
		begin 
			print 'Osoba została dodana'
		end
	else
		BEGIN			
			print 'Osoba o podanym PESEL juz istnieje!'
			rollback			
		END
END
