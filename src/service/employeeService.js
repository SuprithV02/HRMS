async function createEmployee(employeeData) {
    const createdEmployee = await employeeRepository.create(employeeData);
    return createdEmployee;
  }

  async function getAllEmployees() {
    const employees = await employeeRepository.getAll();
    return employees;
  }
  