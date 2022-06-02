package com.bridgelabz;

public class EmployeePayroll{
    public int id;
    public String name;
    public double salary;

    public EmployeePayroll(int id, String name, double salary) {
        this.id = id;
        this.name = name;
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Employee PayRoll Data [ID="+id + ", Name = " +name+ ", Salary = " + salary +"]";
    }
}
