package in.sp.main.utils;



import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class CSVImporter {

    public static void main(String[] args) {
        // 1. Path to your CSV file
        String csvFilePath = "C:/path/to/your/groundwater_data.csv";
        
        // 2. MySQL Connection Details (Updated for MySQL)
        String jdbcURL = "jdbc:mysql://localhost:3306/groundwater?useSSL=false&serverTimezone=UTC";
        String username = "root"; // Change if your MySQL user is different
        String password = "asish2005";

        String sql = "INSERT INTO groundwater_levels (state_name, district_name, annual_extractable_water, current_extraction, extraction_percentage, status) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            // Register MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            try (Connection connection = DriverManager.getConnection(jdbcURL, username, password);
                 PreparedStatement statement = connection.prepareStatement(sql);
                 BufferedReader lineReader = new BufferedReader(new FileReader(csvFilePath))) {

                connection.setAutoCommit(false);
                lineReader.readLine(); // Skip header

                String lineText;
                int count = 0;

                while ((lineText = lineReader.readLine()) != null) {
                    String[] data = lineText.split(",");
                    
                    // Note: Ensure your CSV columns match this order
                    statement.setString(1, data[0]); // State
                    statement.setString(2, data[1]); // District
                    statement.setDouble(3, Double.parseDouble(data[2])); // Annual Water
                    statement.setDouble(4, Double.parseDouble(data[3])); // Extraction
                    statement.setDouble(5, Double.parseDouble(data[4])); // %
                    statement.setString(6, data[5]); // Status

                    statement.addBatch();

                    if (++count % 100 == 0) {
                        statement.executeBatch();
                    }
                }

                statement.executeBatch();
                connection.commit();
                System.out.println("MySQL Upload Complete! Total rows: " + count);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}