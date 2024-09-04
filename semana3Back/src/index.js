const express = require('express');
const morgan = require('morgan');
const database = require('./database');
const cors = require('cors');


// Initializations
const app = express();

app.set("port", 4000);
app.listen(app.get("port"));
console.log(`Server on port ${app.get("port")}`);


//middlewares

app.use(cors({
      origin: ["http://127.0.0.1:5500"],
}));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(morgan("dev"));



// Routes

app.post("/clientes", async (req, res) => {
      try {
        console.log('Datos recibidos en el body:', req.body);
    
        const {
          rut,
          nombre,
          apellido,
          pais,
          calle,
          numeroUbicacion,
          identificacion,
          codigoPostal,
          email,
          telefono,
          numeroCaso,
          descripcionCaso,
          fechaInicioCaso,
          estadoCaso,
          descripcionSentencia,
          fechaCierreCaso
        } = req.body;
    
        
        const direccion = `${pais}, ${numeroUbicacion}, ${calle}, ${identificacion}, ${codigoPostal}`;
    
        const connection = await database.getConnection();
    
        const query = `
          INSERT INTO cliente 
          (rut, nombre, apellido, direccion, email, telefono, numeroCaso, descripcionCaso, fechaInicioCaso, estadoCaso, descripcionSentencia, fechaCierreCaso) 
          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        `;
    
        const result = await connection.query(query, [
          rut, nombre, apellido, direccion, email, telefono, numeroCaso, descripcionCaso, fechaInicioCaso, estadoCaso, descripcionSentencia, fechaCierreCaso
        ]);
    
        res.status(201).json({ message: "Cliente agregado con éxito", clienteId: result[0].insertId });
      } catch (error) {
        console.error('Error al agregar el cliente:', error);
        res.status(500).send('Error en el servidor');
      }
    });
    