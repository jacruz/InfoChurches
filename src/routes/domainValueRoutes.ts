import { Router } from "express";
import { DomainValueController } from "../controllers/domainValueController";

const router = Router();
const domainValueController = new DomainValueController();

router.get('/', domainValueController.getAllDomainValues);
router.get('/:id', domainValueController.getOneDomainValues);
router.post('/', domainValueController.createDomainValues);
router.put('/:id', domainValueController.updateDomainValues);
router.put('/:id', domainValueController.deleteDomainValues);

export default router;