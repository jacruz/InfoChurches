import express, { Express, Request, Response} from "express";
import router from "./src/routes";

const app: Express = express();
const port = process.env.PORT || 3000;

app.use(express.json());

app.use('/api/v1', router);

app.listen(port, ()=>{
    console.log("Server running at PORT: ", port);
}).on("error", (error)=>{
    console.log(error.message);
});