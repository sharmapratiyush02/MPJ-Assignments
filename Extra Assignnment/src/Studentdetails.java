import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Scanner;

public class Studentdetails {

    public static void main(String[] args) throws Exception {

        Scanner sc = new Scanner(System.in);

        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/university", 
                "root", 
                "root"
        );

        Statement st = con.createStatement();

        System.out.println("1. Insert");
        System.out.println("2. View");
        System.out.println("3. Update");
        System.out.println("4. Delete");

        System.out.print("Enter choice: ");
        int choice = sc.nextInt();

        if (choice == 1) {

            System.out.print("Enter Name: ");
            String name = sc.next();

            System.out.print("Enter Age: ");
            int age = sc.nextInt();

            System.out.print("Enter Course: ");
            String course = sc.next();

            st.executeUpdate("INSERT INTO students(name, age, course) VALUES('" 
                    + name + "'," + age + ",'" + course + "')");

            System.out.println("Student Inserted Successfully!");

        }

        if (choice == 2) {

            ResultSet rs = st.executeQuery("SELECT * FROM students");

            System.out.println("ID  Name  Age  Course");

            if (rs.next()) {
                System.out.println(rs.getInt(1) + " " +
                        rs.getString(2) + " " +
                        rs.getInt(3) + " " +
                        rs.getString(4));
            }

        }

        if (choice == 3) {

            System.out.print("Enter ID to Update: ");
            int id = sc.nextInt();

            System.out.print("Enter New Course: ");
            String course = sc.next();

            st.executeUpdate("UPDATE students SET course='" 
                    + course + "' WHERE id=" + id);

            System.out.println("Student Updated Successfully!");

        }

        // DELETE
        if (choice == 4) {

            System.out.print("Enter ID to Delete: ");
            int id = sc.nextInt();

            st.executeUpdate("DELETE FROM students WHERE id=" + id);

            System.out.println("Student Deleted Successfully!");

        }

        con.close();
    }
}
