import { Router } from 'express';
import {ChurchController} from '../controllers/churchController';

const router = Router();
const churchController = new ChurchController();

router.get('/nearby-search/', churchController.getChurchesNeaby);
//router.get('/', churchController.getAllChurches);
router.get('/:id', churchController.getOneChurch);
//router.post('/', churchController.createChurch);
//router.put('/:id', churchController.updateChurch);
//router.put('/:id', churchController.deleteChurch);

export default router;