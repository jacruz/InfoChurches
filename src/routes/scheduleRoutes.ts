import { Router } from 'express';
import { ScheduleController } from '../controllers/scheduleController';

const router = Router();
const scheduleController = new ScheduleController();

router.get('/', scheduleController.getAllSchedules);
router.get('/:id', scheduleController.getOneSchedule);
router.post('/', scheduleController.createSchedule);
router.put('/:id', scheduleController.updateSchedule);
router.put('/:id', scheduleController.deleteSchedule);

export default router;