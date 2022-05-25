package com.bridgelabz;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class EmployeePayrollServiceTest {
    EmployeePayrollFileIOServices employeePayrollFileIOServices=new EmployeePayrollFileIOServices();
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
}
