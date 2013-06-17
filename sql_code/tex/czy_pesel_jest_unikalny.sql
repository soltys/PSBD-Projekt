CREATE FUNCTION Czy_Pesel_jest_Unikalny
(
	@PESEL  int
)
RETURNS bit
AS
BEGIN
	declare @ilosc_osob as int;
	set @ilosc_osob = (select count(*) from osoba where PESEL=@PESEL);
	
	if	@ilosc_osob > 0
		return 0
	
	return 1
END
GO

