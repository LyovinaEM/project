package db;

import constans.Constans;
import entety.*;

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
            Connection conn = DriverManager.getConnection(Constans.CONNECTIONAL_URL);
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

        } catch (Exception e) {
            e.printStackTrace();
        }

        return students;
    }
    public static ArrayList<Term> getAllActiveTerms() {
        ArrayList<Term> terms = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constans.CONNECTIONAL_URL);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM term where status = 1");

            while (rs.next()) {
                Term term = new Term();
                term.setId(rs.getInt("id"));
                term.setTerm(rs.getString("term"));

                terms.add(term);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return terms;
    }

    public static Term getTermById(String idTerm) {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constans.CONNECTIONAL_URL);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM term where status = 1 AND id="+idTerm);

            while (rs.next()) {
                Term term = new Term();
                term.setId(rs.getInt("id"));
                term.setTerm(rs.getString("term"));

                return term;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public static int getGroupId(String group) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constans.CONNECTIONAL_URL);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM groupe as g where g.group = \"" + group + "\"");

            while (rs.next()) {
                return rs.getInt("id");
            }
            stmt.execute("INSERT INTO `groupe` (`group`) VALUES ('" + group + "');");
            rs = stmt.executeQuery("SELECT * FROM groupe ORDER BY id DESC LIMIT 1");
            while (rs.next()) {
                return rs.getInt("id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1;
    }

    public static void createStudent(String surname, String name, int idGroup, String date) {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constans.CONNECTIONAL_URL);
            Statement stmt = conn.createStatement();
            stmt.execute("INSERT INTO `student` (`surname`, `name`, `id_group`, `date`) VALUES ('" + surname + "', '" + name + "', '" + idGroup + "', '" + date + "');");


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteStudent(String id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constans.CONNECTIONAL_URL);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `student` SET `status` = '0' WHERE (`id` = '" + id + "');");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Student getStudentById(String id) {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constans.CONNECTIONAL_URL);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("Select s.id, s.surname, s.name, s.id_group, g.group, s.date  from student  as s\n" +
                    "left join groupe as g on s.id_group = g.id\n" +
                    "where status = '1' AND s.id =" + id);

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

                return student;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public static void modifyStudent(String id, String surname, String name, int idGroup, String date) {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constans.CONNECTIONAL_URL);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `student` SET `surname` = '"+surname+"', `name` = '"+name+"', `id_group` = '"+idGroup+"', `date` = '"+date+"' WHERE (`id` = '"+id+"');\n");


        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static ArrayList<Mark> getMarks(String idStud, String idTerm) {

        ArrayList<Mark> marks = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constans.CONNECTIONAL_URL);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT d.id, d.discipline, m.mark FROM mark as m\n"+
            "left join term_discipline as td on m.id_term_discipline = td.id\n"+
            "left join discipline as d on td.id_discipline = d.id\n"+
            "where m.id_student = "+idStud+" and td.id_term =" + idTerm );

            while (rs.next()) {
                Mark mark = new Mark();
                mark.setMark(rs.getInt("mark"));
                Discipline discipline = new Discipline();
                discipline.setId(rs.getInt("id"));
                discipline.setDiscipline(rs.getString("discipline"));
                mark.setDiscipline(discipline);

                marks.add(mark);
            }

            if (marks.isEmpty()){
                rs = stmt.executeQuery("SELECT * FROM term_discipline as td\n" +
                        "left join discipline as d on td.id_discipline = d.id\n" +
                        "where td.id_term = "+idTerm+" and d.status = '1'");

                while (rs.next()) {
                    Mark mark = new Mark();
                    mark.setMark(-1);
                    Discipline discipline = new Discipline();
                    discipline.setId(rs.getInt("id_discipline"));
                    discipline.setDiscipline(rs.getString("discipline"));
                    mark.setDiscipline(discipline);

                    marks.add(mark);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return marks;
    }
}

