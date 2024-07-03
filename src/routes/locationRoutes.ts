import { Router } from 'express';
import { LocationController } from '../controllers/locationController';

const router = Router();
const locationController = new LocationController();

router.get('/', locationController.getAllLocations);
router.get('/:id', locationController.getOneLocation);
router.post('/', locationController.createLocation);
router.put('/:id', locationController.updateLocation);
router.put('/:id', locationController.deleteLocation);

export default router;