exec insertUser @DNI=45845963,
@nombres='Isabel',
@apellido='Macedo',
@email= 'estebanalvarez001@gmail.com',
@username='estuchis21', 
@password='F.1.yUmika',
@fecha_nacimiento='2001-11-16',
@genero = 'femenino'

exec getUserbyId @id_user = 4
