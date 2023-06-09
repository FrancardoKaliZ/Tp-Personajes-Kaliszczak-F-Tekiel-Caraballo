import config from "../dbconfig.js";
import sql from 'mssql';

class personajeServices{
    static getAll = async() => {
        let returnPersonaje= null;
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .query('SELECT Id,Imagen,Nombre FROM Personaje');
            console.log(results);
             returnPersonaje = results.recordset[0];                              
        } 
        catch(error){console.log(error)}
        return returnPersonaje;
    }

    static getById = async(Id) => {
        let returnPersonaje= null;
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .input('pId', sql.Int, Id)
                                .query('SELECT P.*,PS.Imagen, PS.Titulo FROM Personaje P INNER JOIN PersonajeXPeliSerie PPS ON P.Id = PPS.IdPersonaje INNER JOIN PeliSerie PS ON PPS.IdPeliSerie = PS.Id  WHERE Id = @pId');
             returnPersonaje = results.recordset[0];                              
        } 
        catch(error){console.log(error)}
        return returnPersonaje;
    }

    static deleteById = async(Id) => {
        let returnPersonaje= null;
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .input('pId', sql.Int, Id)
                                .query('DELETE FROM Personaje WHERE Id = @pId');
             returnPersonaje =results.rowsaffected;                              
        } 
        catch(error){console.log(error)}
        return returnPersonaje;
    }
    
    static update = async(Personaje) => {
        let returnPersonaje = null;
        const {Imagen, Nombre, Edad, Peso, Historia} = Personaje
        console.log(Personaje);
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .input('pId', sql.Int, Personaje.Id)
                                .input('Imagen', sql.NVarChar, Personaje.Imagen)
                                .input('Nombre', sql.NVarChar, Personaje.Nombre)
                                .input('Edad', sql.Int, Personaje.Edad)
                                .input('Peso', sql.NVarChar, Personaje.Peso)
                                .input('Historia', sql.NVarChar, Personaje.Historia)
                                .query('UPDATE Personaje SET Imagen = @Imagen, Nombre = @Nombre, Edad = @Edad, Peso = @Peso, Historia = @Historia WHERE Id = @pId');
             returnPersonaje =results.rowsaffected;                              
        } 
        catch(error){console.log(error)}
        return returnPersonaje;
    }
    static insert = async(Personaje) => {
        let returnPersonaje = null;
        console.log(Personaje);
        const {Imagen, Nombre, Edad, Peso, Historia} = Personaje
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .input('pId', sql.Int, Personaje.Id)
                                .input('Imagen', sql.NVarChar, Personaje.Imagen)
                                .input('Nombre', sql.NVarChar, Personaje.Nombre)
                                .input('Edad', sql.Int, Personaje.Edad)
                                .input('Peso', sql.NVarChar, Personaje.Peso)
                                .input('Historia', sql.NVarChar, Personaje.Historia)
                                .query('INSERT INTO Personaje(Imagen,Nombre,Edad,Peso,Historia) VALUES(@Imagen,@Nombre,@Edad,@Peso,@Historia)');
             returnPersonaje =results.rowsaffected;                              
        } 
        catch(error){console.log(error)}
        return returnPersonaje;
    }
    static getByName = async(Nombre) => {
        let returnPersonaje = null;
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .input('Nombre', sql.VarChar, Nombre)
                                .query('SELECT * FROM Personaje WHERE Nombre = @Nombre');
             returnPersonaje = results.recordset[0];                              
        } 
        catch(error){console.log(error)}
        console.log(returnPersonaje)
        return returnPersonaje;
    }
    static OrderByEdad = async() => {
        let returnPersonaje= null;
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .query('SELECT Id,Imagen,Nombre FROM Personaje ORDER BY Edad ASC');
            console.log(results);
             returnPersonaje = results.recordset[0];                              
        } 
        catch(error){console.log(error)}
        return returnPersonaje;
    }
    static OrderByPeso = async() => {
        let returnPersonaje= null;
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .query('SELECT Id,Imagen,Nombre FROM Personaje ORDER BY Peso ASC');
            console.log(results);
             returnPersonaje = results.recordset;                              
        } 
        catch(error){console.log(error)}
        return returnPersonaje;
    }
    static OrderByPeliculaSerie = async(Id) => {
        let returnPersonaje= null;
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .input('pId', sql.Int, Id)
                                .query('SELECT P.Id,P.Imagen,P.Nombre FROM Personaje P INNER JOIN PersonajeXPeliSerie PPS ON P.Id = PPS.IdPersonaje WHERE PPS.IdPeliSerie = @pId ');
            console.log(results);
             returnPersonaje = results.recordset[0];                              
        } 
        catch(error){console.log(error)}
        console.log(returnPersonaje)
        return returnPersonaje;
    }
}
export default personajeServices;