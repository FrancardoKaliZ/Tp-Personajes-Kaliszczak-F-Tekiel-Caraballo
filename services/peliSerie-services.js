import config from "../dbconfig.js";
import sql from 'mssql';

class peliSerieServices{
    static getAll = async() => {
        let returnPeliSerie = null;
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .query('SELECT Id,Imagen,Titulo,FechaCreacion FROM PeliSerie');
            console.log(results);
             returnPeliSerie = results.recordset[0];                              
        } 
        catch(error){console.log(error)}
        return returnPeliSerie;
    }

    static getById = async(Id) => {
        let returnPeliSerie= null;
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .input('pId', sql.Int, Id)
                                .query('SELECT PS.*,P.Imagen,P.Nombre FROM PeliSerie PS INNER JOIN PersonajeXPeliSerie PPS ON PS.Id = PPS.IdPeliSerie INNER JOIN Personaje P ON PPS.IdPersonaje = P.Id  WHERE Id = @pId');
             returnPeliSerie = results.recordset[0];                              
        } 
        catch(error){console.log(error)}
        return returnPeliSerie;
    }

    static deleteById = async(Id) => {
        let returnPeliSerie= null;
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .input('pId', sql.Int, Id)
                                .query('DELETE FROM PeliSerie WHERE Id = @pId');
             returnPeliSerie =results.rowsaffected;                              
        } 
        catch(error){console.log(error)}
        return returnPeliSerie;
    }
    
    static update = async(PeliSerie) => {
        let returnPeliSerie = null;
        const {Imagen, Nombre, Edad, Peso, Historia} = PeliSerie
        console.log(PeliSerie);
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .input('pId', sql.Int, Personaje.Id)
                                .input('Imagen', sql.NVarChar, PeliSerie.Imagen)
                                .input('Titulo', sql.NVarChar, PeliSerie.Titulo)
                                .input('FechaCreacion', sql.Date, Personaje.FechaCreacion)
                                .input('Calificacion', sql.Float, PeliSerie.Calificacion)
                                .query('UPDATE PeliSerie SET Imagen = @Imagen, Titulo = @Titulo, FechaCreacion = @FechaCreacion, Calificacion = @Calificaion WHERE Id = @pId');
             returnPeliSerie =results.rowsaffected;                              
        } 
        catch(error){console.log(error)}
        return returnPeliSerie;
    }
    static insert = async(PeliSerie) => {
        let returnPeliSerie = null;
        console.log(PeliSerie);
        const {Imagen, Titulo, FechaCreacion, Calificacion} = PeliSerie
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .input('pId', sql.Int, Personaje.Id)
                                .input('Imagen', sql.NVarChar, PeliSerie.Imagen)
                                .input('Titulo', sql.NVarChar, PeliSerie.Titulo)
                                .input('FechaCreacion', sql.Date, PeliSerie.FechaCreacion)
                                .input('Calificacion', sql.Float, PeliSerie.Calificacion)
                                .query('INSERT INTO PeliSerie(Imagen,Titulo,FechaCreacion,Calificacion) VALUES(@Imagen,@Titulo,@FechCreacion,@Calificacion)');
             returnPeliSerie =results.rowsaffected;                              
        } 
        catch(error){console.log(error)}
        return returnPeliSerie;
    }
    static getByTitulo = async(Titulo) => {
        let returnPeliSerie = null;
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .input('Titulo', sql.NVarChar, Titulo)
                                .query('SELECT * FROM PeliSerie WHERE Titulo = @Titulo');
             returnPeliSerie = results.recordset[0];                              
        } 
        catch(error){console.log(error)}
        console.log(returnPeliSerie);
        return returnPeliSerie;
    }
    static OrderByFechaCreacion = async() => {
        let returnPeliSerie= null;
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .query('SELECT Id,Imagen,Titulo,FechaCreacion FROM PeliSerie ORDER BY FechaCreacion ASC');
            console.log("ORDERBYCREACION", results.recordset[0]);
             returnPeliSerie = results.recordset;                              
        } 
        catch(error){console.log(error)}
        return returnPeliSerie;
    }
}
export default peliSerieServices;