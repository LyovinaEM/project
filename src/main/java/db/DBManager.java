package db;

import entety.Group;
import entety.Student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DBManager {
    public static ArrayList<Student> getAllActiveStudent() {
        ArrayList<Student> students = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_30?user=root&password=56357Katya!");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("Select s.id, s.surname, s.name, s.id_group, g.group, s.date  from student  as s\n" +
                    "left join groupe as g on s.id_group = g.id\n" +
                    "where status = '1' ");

            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setSurname(rs.getString("surname"));
                student.setName(rs.getString("name"));

                Group group = new Group();
                group.setId(rs.getInt("id_group"));
                group.setGroup(rs.getString("group"));

                student.setGroup(group);
                student.setDate(rs.getDate("date"));

                students.add(student);
            }

            } catch(Exception e){
                e.printStackTrace();
            }

        return students;
        }

        public static int getGroupId(String group){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_30?user=root&password=56357Katya!");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM groupe as g where g.group = \""+group+"\"");

                while (rs.next()) {
                    return rs.getInt("id");
                }
                stmt.execute("INSERT INTO `groupe` (`group`) VALUES ('"+group+"');");
                rs = stmt.executeQuery("SELECT id FROM groupe WHERE id = LAST_INSERT_ID();");
                return  rs.getInt("id");

            } catch(Exception e){
                e.printStackTrace();
            }

            return -1;
        }

    }

