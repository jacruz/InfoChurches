import express, { Express, Request, Response, NextFunction } from "express";
import router from "./src/routes";

const app: Express = express();
const port = process.env.PORT || 3000;

app.use(express.json());

// Middleware para habilitar CORS de forma manual
app.use((req: Request, res: Response, next: NextFunction) => {
    // Permitir solicitudes desde cualquier origen (cambia '*' por el origen específico si es necesario)
    res.header('Access-Control-Allow-Origin', '*');
    
    // Permitir métodos HTTP específicos
    res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
    
    // Permitir cabeceras específicas en las solicitudes
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');

    // Manejar las solicitudes OPTIONS (pre-flight request en CORS)
    if (req.method === 'OPTIONS') {
        return res.sendStatus(200);
    }

    next();
});

// Middleware para logging
app.use((req: Request, res: Response, next: NextFunction) => {
    console.log(`INI> ${req.method} \t ${req.url}`);
    res.on('finish', () => {
        console.log(`END> ${res.req.method} \t ${res.req.originalUrl} \t ${res.statusCode} \n`);
    });

    next();
});

/*
app.use('/', (req:Request, res:Response)=>{
    res.status(200).send("Welcome!!!");
});*/

// Usar las rutas definidas en el router
app.use('/api/v1', router);

// Iniciar el servidor
app.listen(port, () => {
    console.log("Server running at PORT: ", port);
}).on("error", (error) => {
    console.log(error.message);
});
