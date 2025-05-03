create procedure getUserById
@id_user int

as
begin
	begin try
		select * from users where id_user = @id_user
	end try

	begin catch
		print 'Error al encontrar usuario por id'
		print ERROR_MESSAGE()
	end catch
END
