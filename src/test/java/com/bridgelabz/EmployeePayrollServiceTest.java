package com.bridgelabz;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;
import java.util.List;

public class EmployeePayrollServiceTest {
    EmployeePayrollFileIOServices employeePayrollFileIOServices=new EmployeePayrollFileIOServices();
    EmployeePayrollDBServices employeePayrollDBServices =new EmployeePayrollDBServices();
   @Test
  public void checkFileCreatedOrNot(){
       Assertions.assertTrue(employeePayrollFileIOServices.CreateFile());
    }
    @Test
    public void checkFileIsExistOrNot(){
        Assertions.assertTrue(employeePayrollFileIOServices.CheckFileExistOrNot());

    }
   @Test
    public void checkFileDeletedOrNot(){
       Assertions.assertTrue(employeePayrollFileIOServices.DeleteFileOperation());
   }
@Test
    public void displayFilesFromDirectory(){
        Assertions.assertTrue(employeePayrollFileIOServices.listFileDirectoriesFileWithExtension());
    }

    //JDBC UC2
    @Test
    public void displayRecordsFromTable()  {
        List<EmployeePayroll> employeeData=employeePayrollDBServices.readData();
        for(EmployeePayroll data:employeeData){
            System.out.println(data);
        }
        Assertions.assertEquals(3,employeeData.size());
    }

    @Test
    public void updateRecords_FromPerticularTable()
    {
       Assertions.assertTrue(employeePayrollDBServices.updateRecord());
    }
    @Test
    public void updateRecord()  {
        String name="Tersia";
        int id=1;
        Assertions.assertTrue(employeePayrollDBServices.updateQueryPrepare(name,id));

    }

}
