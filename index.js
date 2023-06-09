import personajeServices from './services/personaje-services.js';
import peliSerieServices from './services/peliSerie-services.js';
import express from 'express';
import sql from 'mssql'
const app = express();
const port = 3001;
/*PERSONAJE:*/
app.listen(port, ()=>{
    console.log('Listening on port: ',port)

});
app.get('/personaje' , async (req, res) =>{
    const personaje = await personajeServices.getAll();
    res.status(200).send(personaje)
});

app.get('/personaje/:Id' , async (req, res) =>{
    const personaje = await personajeServices.getById(req.params.Id)
    res.status(200).send(personaje)
});
app.use(express.json());
app.post('/personaje', async(req, res)=>{
    try{
        await personajeServices.insert(req.body)
        res.status(200).json ({message: 'Personaje creado con exito, QUE TENGAS UN MUY LINDO DIA (QUE ESTAFA EL GAMING DEL EVENTO)'});
    }    catch (error){ 
        console.error(error);
        res.status(500).json({error: 'No se pudo crear el personaje (QUE ESTAFA EL GAMING DEL EVENTO)'});
    }
});
app.put('/personaje', async(req, res)=>{
    try{
        console.log(req);
        await personajeServices.update(req.body);
        res.status(200).json ({message: 'Cambios realizados con exito'});
    } catch(error){
        console.error(error);
        res.status(500).json ({message : 'No se pudieron realizar los cambios'})
    }

});
app.delete('/personaje/:Id', async(req,res)=>{
    try{
        await personajeServices.deleteById(req.params.Id)
        res.status(200).json({message : 'Se borro el maldito personaje con exito'})
    }catch(error){
        console.error(error);
        res.status(500).json({message : 'No se pudo borrar el personaje'})
    }
});
app.get('/personaje/:Nombre' , async (req, res) =>{
    const personaje = await personajeServices.getByName(req.params.Nombre);
    res.status(200).send(personaje)
});
app.get('/personaje/ByEdad' , async (req, res) =>{
    const personaje = await personajeServices.OrderByEdad();
    res.status(200).send(personaje)
});
app.get('/personaje/ByPeso' , async (req, res) =>{
    const personaje = await personajeServices.OrderByPeso();
    res.status(200).send(personaje)
});
app.get('/personaje/:Id' , async (req, res) =>{
    const personaje = await personajeServices.OrderByPeliculaSerie(req.params.Id)
    res.status(200).send(personaje)
});
/*PELISERIE:*/
app.get('/peliSerie' , async (req, res) =>{
    const peliSerie = await peliSerieServices.getAll();
    res.status(200).send(peliSerie)
});

app.get('/peliSerie/:Id' , async (req, res) =>{
    const peliSerie = await peliSerieServices.getById(req.params.Id)
    res.status(200).send(peliSerie)
});
app.use(express.json());
app.post('/peliSerie/post', async(req, res)=>{
    try{
        await peliSerieServices.insert(req.body)
        res.status(200).json ({message: 'peliSerie creado con exito, QUE TENGAS UN MUY LINDO DIA (QUE ESTAFA EL GAMING DEL EVENTO)'});
    }    catch (error){ 
        console.error(error);
        res.status(500).json({error: 'No se pudo crear la peliSerie (QUE ESTAFA EL GAMING DEL EVENTO)'});
    }
});
app.put('/peliSerie/put', async(req, res)=>{
    try{
        console.log(req);
        await peliSerieServices.update(req.body);
        res.status(200).json ({message: 'Cambios realizados con exito'});
    } catch(error){
        console.error(error);
        res.status(500).json ({message : 'No se pudieron realizar los cambios'})
    }

});
app.delete('/personaje/delete/:Id', async(req,res)=>{
    try{
        await peliSerieServices.deleteById(req.params.Id)
        res.status(200).json({message : 'Se borro la maldita peliSerie con exito'})
    }catch(error){
        console.error(error);
        res.status(500).json({message : 'No se pudo borrar la peliSerie'})
    }
});
app.get('/peliSerie/:Titulo' , async (req, res) =>{
    const peliSerie = await peliSerieServices.getByTitulo(req.params.Titulo)
    res.status(200).send(peliSerie)
});
app.get('/peliSerie/OrderByFecha' , async (req, res) =>{
    const peliSerie = await peliSerieServices.OrderByFechaCreacion()
    res.status(200).send(peliSerie)
});
