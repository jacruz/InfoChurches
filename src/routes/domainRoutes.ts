import { Router } from 'express';
import { DomainController } from '../controllers/domainController';

const router = Router();
const domainController = new DomainController();

router.get('/', domainController.getAllDomains);
router.get('/:id', domainController.getOneDomain);
router.post('/', domainController.createDomain);
router.put('/:id', domainController.updateDomain);
router.put('/:id', domainController.deleteDomain);

export default router;