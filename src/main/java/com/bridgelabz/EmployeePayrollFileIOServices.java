package com.bridgelabz;

import java.io.*;
import java.util.List;

public class EmployeePayrollFileIOServices {
    static File file=new File("//home//hp//IdeaProjects//EmployeePayrollService//src//EmployeePayroll.txt");

    public boolean CreateFile(){
        try{
            if(file.createNewFile()){
                System.out.println("File Created "+file.getName());
                return true;
            }
            else {
                System.out.println("File Not Created ! It's might be already Exist");
                return true;
            }
        } catch (IOException e) {
            System.out.println("Exception");
            return false;
        }
    }
    public boolean CheckFileExistOrNot(){
        if(file.exists()){
            System.out.println("File already Exist");
//            DeleteFileOperation();
//            CreateFile();
            return true;
        }
        else {
            CreateFile();
            System.out.println("New File Created ");
            return false;
        }
    }

    public boolean DeleteFileOperation(){

        if(file.delete()){
            System.out.println(file.getName()+" Deleted !");
            return true;
        }
        else {
            System.out.println(file.getName()+" File Not Exist to delete !");
            return false;
        }
    }
    public boolean listFileDirectoriesFileWithExtension() {
        File[] files;
        String[] FileNames;
        File file = new File("//home//hp//IdeaProjects//EmployeePayrollService//src");
        files = file.listFiles();
        System.out.println("\nFile Names With Directories\n");
        for (File f1 : files) {
            System.out.println(f1);
        }
        FileNames = file.list();
        System.out.println("\nFile Name With extension and Folder Names Available In Directory\n");
        for (String filename : FileNames) {
            System.out.println(filename);
        }
        return true;
    }


}

