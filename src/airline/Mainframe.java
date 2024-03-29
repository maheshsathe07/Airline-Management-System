package airline;

import java.awt.*;
import javax.swing.*;

public class Mainframe extends JFrame {

    public static void main(String[] args) {
        EventQueue.invokeLater(() -> {
            Mainframe mainFrame = new Mainframe();
            mainFrame.setVisible(true);
        });
    }

    public Mainframe() {
        super("AIRLINE RESERVATION MANAGEMENT SYSTEM");
        initialize();
    }

    private void initialize() {
        setForeground(Color.CYAN);
        setLayout(null);

        JLabel NewLabel = new JLabel("");
        NewLabel.setIcon(new ImageIcon(ClassLoader.getSystemResource("icon/front.jpg")));
        NewLabel.setBounds(0, 0, 1920, 990);
        add(NewLabel);

        JLabel AirlineManagementSystem = new JLabel("AIR INDIA WELCOMES YOU");
        AirlineManagementSystem.setForeground(Color.BLUE);
        AirlineManagementSystem.setFont(new Font("Tahoma", Font.PLAIN, 36));
        AirlineManagementSystem.setBounds(700, 60, 1000, 55);
        NewLabel.add(AirlineManagementSystem);

        JMenuBar menuBar = new JMenuBar();
        setJMenuBar(menuBar);

        JMenu AirlineSystem = new JMenu("AIRLINE SYSTEM");
        AirlineSystem.setForeground(Color.BLUE);
        menuBar.add(AirlineSystem);

        JMenuItem FlightDetails = new JMenuItem("FLIGHT_INFO");
        AirlineSystem.add(FlightDetails);

        JMenuItem ReservationDetails = new JMenuItem("ADD_CUSTOMER_DETAILS");
        AirlineSystem.add(ReservationDetails);

        JMenuItem PassengerDetails = new JMenuItem("JOURNEY_DETAILS");
        AirlineSystem.add(PassengerDetails);

        JMenuItem SectorDetails_1 = new JMenuItem("PAYMENT_DETAILS");
        AirlineSystem.add(SectorDetails_1);

        JMenuItem Cancellation = new JMenuItem("CANCELLATION");
        AirlineSystem.add(Cancellation);

        JMenu exit = new JMenu("Logout");
        exit.setForeground(Color.RED);
        menuBar.add(exit);

        JMenuItem logout = new JMenuItem("Logout");
        exit.add(logout);

        FlightDetails.addActionListener(e -> openFlightInfo());
        ReservationDetails.addActionListener(e -> openAddCustomerDetails());
        PassengerDetails.addActionListener(e -> openJourneyDetails());
        SectorDetails_1.addActionListener(e -> openPaymentDetails());
        Cancellation.addActionListener(e -> openCancellation());

        logout.addActionListener(e -> {
            setVisible(false);
            new Login().setVisible(true); // Redirect to login page
        });

        setSize(1950, 1090);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // Ensure the application exits when mainframe is closed
    }

    private void openFlightInfo() {
        EventQueue.invokeLater(() -> {
            Flight_Info flightInfo = new Flight_Info();
            flightInfo.setVisible(true);
            flightInfo.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE); // Set close operation to dispose on close
        });
    }

    private void openAddCustomerDetails() {
        EventQueue.invokeLater(() -> {
            try {
                Add_Customer addCustomer = new Add_Customer();
                addCustomer.setVisible(true);
                addCustomer.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE); // Set close operation to dispose on close
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        });
    }

    private void openJourneyDetails() {
        EventQueue.invokeLater(() -> {
            try {
                Journey_Details journeyDetails = new Journey_Details();
                journeyDetails.setVisible(true);
                journeyDetails.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE); // Set close operation to dispose on close
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        });
    }

    private void openPaymentDetails() {
        EventQueue.invokeLater(() -> {
            try {
                Payment_Details paymentDetails = new Payment_Details();
                paymentDetails.setVisible(true);
                paymentDetails.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE); // Set close operation to dispose on close
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        });
    }

    private void openCancellation() {
        EventQueue.invokeLater(() -> {
            Cancel cancel = new Cancel();
            cancel.setVisible(true);
            cancel.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE); // Set close operation to dispose on close
        });
    }
}
