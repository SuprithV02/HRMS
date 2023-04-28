  async function create(employeeData) {
    const {
      employee_id,
      employee_name,
      username,
      email,
      password,
      address,
      phone,
      department_id,
      department,
      job_title,
      join_date,
      total_days,
      leaves_taken
    } = employeeData;
    const query = `
    INSERT INTO employees (
      employee_id, 
      employee_name, 
      username, 
      email, 
      password, 
      address, 
      phone, 
      department_id, 
      department, 
      job_title, 
      join_date, 
      total_days, 
      leaves_taken
    )
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)
    RETURNING *;
  `;

  const values = [
    employee_id,
    employee_name,
    username,
    email,
    password,
    address,
    phone,
    department_id,
    department,
    job_title,
    join_date,
    total_days,
    leaves_taken
  ];

  const { rows: createdEmployees } = await pool.query(query, values);
  return createdEmployees[0];
}

async function getAll() {
    const query = `
      SELECT *
      FROM employees;
    `;
    const { rows: employees } = await pool.query(query);
    return employees;
  }