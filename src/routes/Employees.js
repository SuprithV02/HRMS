var express = require('express');
const router = express.Router();

/* GET users listing. */
router.get('/', async (req, res) => {
  const employees = await employeeService.getAllEmployees();
  res.json(employees);
});

router.post('/New', async (req, res) => {
  const employeeData = req.body;
  const newEmployee = await employeeService.createEmployee(employeeData);
  res.json(newEmployee);
});

module.exports = router;
