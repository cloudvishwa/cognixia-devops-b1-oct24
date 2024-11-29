### **Lab Manual for Azure SQL Database**

#### **Lab Objectives:**
- Learn how to create and manage tables in Azure SQL Database.
- Understand how to use `CREATE`, `ALTER`, and `DROP` commands.
- Work with primary keys, foreign keys, and constraints such as `NOT NULL`, `UNIQUE`, and `DEFAULT`.
- Practice creating databases and tables in MySQL for further comparison.

---

### **Prerequisites**
1. **Azure SQL Database Instance**:
   - Set up an Azure SQL Database using the Azure Portal or CLI.
   - Note down the **server name**, **username**, and **password**.
   - Ensure your client machine has tools like **Azure Data Studio**, **SSMS**, or any SQL client for connectivity.
2. **MySQL Setup**:
   - Install MySQL Server locally or use an Azure Database for MySQL instance.
   - Note down the credentials.

---

## **Lab 1: Creating and Managing Tables in Azure SQL**

### **Step 1: Connect to Azure SQL Database**
1. Open your preferred SQL client (Azure Data Studio, SSMS, or another tool).
2. Connect to the Azure SQL Database using the following details:
   - Server Name: `<your_server>.database.windows.net`
   - Database: `<your_database_name>`
   - Authentication: SQL Server Authentication
   - Username and Password: As per your configuration.

---

### **Step 2: Create a Table**
Run the following query to create a new table:

```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Department NVARCHAR(50),
    HireDate DATE DEFAULT GETDATE(),
    Email NVARCHAR(100) UNIQUE
);
```

#### **Explanation:**
- `EmployeeID INT PRIMARY KEY`: The `EmployeeID` column is the primary key.
- `FirstName` and `LastName`: Cannot have NULL values (`NOT NULL` constraint).
- `HireDate`: Has a default value of the current date (`DEFAULT` constraint).
- `Email`: Must be unique (`UNIQUE` constraint).

---

### **Step 3: Alter a Table**
Add a new column for storing employee salaries:

```sql
ALTER TABLE Employees
ADD Salary DECIMAL(10, 2) NOT NULL DEFAULT 0.00;
```

---

### **Step 4: Drop a Table**
To delete the `Employees` table:
```sql
DROP TABLE Employees;
```

---

## **Lab 2: Working with Keys and Constraints**

### **Step 1: Create a Table with Primary and Foreign Keys**
```sql
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
```

---

### **Step 2: Add Constraints**
1. Add a `DEFAULT` value for `DepartmentID` in the `Employees` table:
   ```sql
   ALTER TABLE Employees
   ADD CONSTRAINT Default_DepartmentID DEFAULT 1 FOR DepartmentID;
   ```

2. Add a `CHECK` constraint to ensure salaries are non-negative:
   ```sql
   ALTER TABLE Employees
   ADD CONSTRAINT Salary_Check CHECK (Salary >= 0);
   ```

---

## **Lab 3: MySQL Database and Table Creation**

### **Step 1: Create a Database**
Connect to your MySQL instance and create a database:
```sql
CREATE DATABASE CompanyDB;
USE CompanyDB;
```

---

### **Step 2: Create Tables**
```sql
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    HireDate DATE DEFAULT CURRENT_DATE,
    Email VARCHAR(100) UNIQUE,
    Salary DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
```

---

### **Step 3: Modify Tables**
1. Add a new column for job titles:
   ```sql
   ALTER TABLE Employees
   ADD JobTitle VARCHAR(50);
   ```

2. Drop the `JobTitle` column:
   ```sql
   ALTER TABLE Employees
   DROP COLUMN JobTitle;
   ```

---

## **Lab 4: Practice Exercises**
1. **Create a Table in Azure SQL:**
   - Add columns for tracking employee phone numbers with a `NOT NULL` constraint.
   - Ensure the phone number is unique.

2. **Modify Tables in MySQL:**
   - Add a new column for `PerformanceRating` with a default value of `3`.
   - Add a `CHECK` constraint to ensure the rating is between `1` and `5`.

3. **Drop and Recreate Tables**:
   - Experiment with dropping and recreating the `Departments` table in both Azure SQL and MySQL.

---

### **Cleanup (Optional)**
To avoid unnecessary costs, delete resources when done:
1. For Azure SQL Database:
   ```bash
   az sql db delete --resource-group <resource_group> --server <server_name> --name <database_name> --yes
   ```
2. For MySQL:
   - Drop the database:
     ```sql
     DROP DATABASE CompanyDB;
     ```

---

