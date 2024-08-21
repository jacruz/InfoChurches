import express, { Express, Request, Response} from "express";
import router from "./src/routes";

const app: Express = express();
const port = process.env.PORT || 3000;

app.use(express.json());

app.use((req: Request, res: Response, next) => {
    console.log(`INI> ${req.method} \t ${req.url}`);
    res.on('finish', () => {
        console.log(`END> ${res.req.method} \t ${res.req.originalUrl} \t ${res.statusCode} \n`);
    });

    next();
});

app.use('/', (req:Request, res:Response)=>{
    res.status(200).send("Thank You Mario, But Our Princess is in Another Castle");
});
app.use('/api/v1', router);

app.listen(port, ()=>{
    console.log("Server running at PORT: ", port);
}).on("error", (error)=>{
    console.log(error.message);
});