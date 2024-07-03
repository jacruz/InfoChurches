import { Router } from "express";
import churchesRouter from "./churchRoutes";
import domainRouter from "./domainRoutes";
import domainValuesRouter from "./domainValueRoutes";
import linkRouter from "./linkRoutes";
import locationRouter from "./locationRoutes";
import scheduleRouter from "./scheduleRoutes";
import userRouter from "./userRoutes";

const router = Router();

router.use("/churches/", churchesRouter);
router.use("/domains/", domainRouter);
router.use("/domainValues/", domainValuesRouter);
router.use("/links/", linkRouter);
router.use("/locations/", locationRouter);
router.use("/schedules/", scheduleRouter);
router.use("/users/", userRouter);

export default router;