package airline;

import net.proteanit.sql.DbUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

public class Flight_Info extends JFrame {  //Second Frame

	private JTable table;
	private JTextField textField;

	public static void main(String[] args) {
		new Flight_Info().setVisible(true);
	}

	public Flight_Info() {
		initialize();
	}

	private void initialize() {
		getContentPane().setBackground(Color.WHITE);
		getContentPane().setFont(new Font("Tahoma", Font.PLAIN, 13));

		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setSize(860, 523);
		setLayout(null);
		setVisible(true);

		JLabel Fcode = new JLabel("FLIGHT CODE");
		Fcode.setFont(new Font("Tahoma", Font.PLAIN, 17));
		Fcode.setBounds(50, 100, 200, 30);
		add(Fcode);

		JLabel FlightDetails = new JLabel("FLIGHT INFORMATION");
		FlightDetails.setFont(new Font("Tahoma", Font.PLAIN, 31));
		FlightDetails.setForeground(new Color(100, 149, 237));
		FlightDetails.setBounds(50, 20, 570, 35);
		add(FlightDetails);

		JButton btnShow = new JButton("SHOW");
		btnShow.setFont(new Font("Tahoma", Font.PLAIN, 20));
		btnShow.setBounds(220, 150, 120, 30);
		add(btnShow);

		table = new JTable();
		table.setBackground(Color.WHITE);

		JScrollPane pane = new JScrollPane(table);
		pane.setBounds(23, 250, 800, 300);
		pane.setBackground(Color.WHITE);
		add(pane);

		textField = new JTextField();
		textField.setBounds(220, 100, 200, 30);
		add(textField);

		btnShow.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent ae) {
				String code = textField.getText();

				try {
					conn c = new conn();
					String str = "SELECT flight.f_code, flight.f_name, flight.src, flight.dst, sector.capacity, sector.class_code, sector.class_name " +
							"FROM flight " +
							"INNER JOIN sector ON flight.f_code = sector.flight_code " +
							"WHERE flight.f_code = '" + code + "'";

					ResultSet rs = c.s.executeQuery(str);
					table.setModel(DbUtils.resultSetToTableModel(rs));

				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		});

		setSize(900, 650);
		setLocation(400, 200);
	}
}
