CREATE PROCEDURE dodaj_miasto
(
	@nazwa_miasta varchar(100),
	@nazwa_panstwa varchar(100)
)
AS
BEGIN
	declare @panstwo_id as numeric;
	set @panstwo_id = (Select Id FROM psoltysiak.dbo.Panstwo WHERE Nazwa = @nazwa_panstwa);	
	
	IF @panstwo_id IS NULL
	BEGIN
		INSERT INTO psoltysiak.dbo.Panstwo(Nazwa) VALUES (@nazwa_panstwa);
		set @panstwo_id =  (SELECT SCOPE_IDENTITY());	
	END
	INSERT INTO psoltysiak.dbo.Miasto(Nazwa,Panstwo_Id) VALUES (@nazwa_miasta,@panstwo_id);
END
GO