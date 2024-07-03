import { Router } from 'express';
import { LinkController } from '../controllers/linkController';

const router = Router();
const linkController = new LinkController();

router.get('/', linkController.getAllLinks);
router.get('/:id', linkController.getOneLink);
router.post('/', linkController.createLink);
router.put('/:id', linkController.updateLink);
router.put('/:id', linkController.deleteLink);

export default router;