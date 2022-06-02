package com.bridgelabz;

import java.sql.*;
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
    public boolean updateRecord(){
       String sql= "update employee_payroll set salary =300000 where name='Tersia'";
        try (Connection connection = ConnectionToDB.getConnection();
             Statement statement = connection.createStatement();)
        {
            statement.executeUpdate(sql);
            System.out.println("Record Updated Successfully in given Table...");

        } catch (SQLException e) {
            // throw new RuntimeException(e);
            System.out.println("Record not updated ");
        }
        System.out.println("Data After Update Records=> ");
        List<EmployeePayroll> employeeData=readData();
        for(EmployeePayroll data:employeeData)
        {
            System.out.println(data);
        }
        return true;
    }

    public boolean updateQueryPrepare(String name, int id)  {
        try {
            String updatequery = "update employee_payroll set name = ? where id = ?";
            Connection con = ConnectionToDB.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(updatequery);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
