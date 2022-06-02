package com.bridgelabz;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmployeePayrollDBServices  {


    public List<EmployeePayroll> readData() {

        String sql="SELECT * FROM employee_payroll";
        List<EmployeePayroll> employeeDataList=new ArrayList<>();
        try{
            Connection connection=ConnectionToDB.getConnection();
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                double salary=resultSet.getDouble("salary");

                employeeDataList.add(new EmployeePayroll(id,name,salary));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return employeeDataList;
    }

}
