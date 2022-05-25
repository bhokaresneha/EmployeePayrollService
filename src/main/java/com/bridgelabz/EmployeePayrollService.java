
package com.bridgelabz;
//importing classes
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


public class EmployeePayrollService<employeePayrollList> {
    //Creating Scanner Class object to take input from console
    static Scanner scanner = new Scanner(System.in);

    //creating ArrayList object
    public static List<EmployeePayroll> employeePayrollList;

    // Constructor of Employee Payroll Service class passing List of Employee Payroll class
    public EmployeePayrollService(List<EmployeePayroll> employeePayrollData) {
        this.employeePayrollList = employeePayrollData;
    }

    //Using readEmployeePayrollData() method taking input form User/console.
    public int readEmployeePayrollData(IOService ioService) {
        if(ioService.equals(IOService.FILE_IO))
        {
            EmployeePayrollFileIOServices.readFromFile();

        }else if(ioService.equals(IOService.CONSOLE_IO))
        {
            System.out.println("Enter Employee Id: ");
            int id = scanner.nextInt();
            System.out.println("Enter Employee Name: ");
            String name = scanner.next();
            System.out.println("Enter Employee Salary: ");
            double salary = scanner.nextDouble();
            employeePayrollList.add(new EmployeePayroll(id, name, salary));
        }
        return employeePayrollList.size();

    }



    // using writeEmployeePayrollData() method Displaying data
    private void writeEmployeePayrollData(IOService ioService)
    {
        if (ioService.equals(IOService.FILE_IO))
            EmployeePayrollFileIOServices.addToFile(employeePayrollList);

        else
        System.out.println("\nWriting Employee Payroll Data to console: \n"+employeePayrollList);

    }

    // main()Method
    public static void main(String[] args){
        System.out.println("Welcome To Employee Payroll Service");

        ArrayList<EmployeePayroll> employeePayroll = new ArrayList<>();
        EmployeePayrollService employeePayrollService = new EmployeePayrollService(employeePayroll);
        //using EmployeePayrollService class object employeePayrollService calling methods readEmployeePayrollData() and writeEmployeePayrollData
        int entryCount= employeePayrollService.readEmployeePayrollData(IOService.CONSOLE_IO);
        System.out.println(entryCount+"Record Added into File");
        employeePayrollService.writeEmployeePayrollData(IOService.FILE_IO);



    }
}