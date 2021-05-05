package database;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ContactEmail {
	
	public static void function(String emailToBeSent,String subject,String messageToBeSent,String username1)
	{
		final String username = "farmerproject2021@gmail.com";
        final String password = "Abc@1234";

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
          });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("aravind102001@gmail.com"));
            String[] mailAddressTo = new String[1];    
            mailAddressTo[0] = emailToBeSent;  
     
         
           

           InternetAddress[] mailAddress_TO = new InternetAddress[mailAddressTo.length];

            for (int i = 0; i < mailAddressTo.length; i++)
            {
                mailAddress_TO[i] = new InternetAddress(mailAddressTo[i]);
            }

            message.addRecipients(Message.RecipientType.TO, mailAddress_TO);
          //  message.setRecipients(Message.RecipientType.TO,InternetAddress.parse("18euit080@skcet.ac.in"));
            message.setSubject(subject);
            message.setText("Hai User,"
                + "\n\n No spam to my email, please!");
            //Message
          
             message.setContent(
                "<h1>From "+username1+"</h1><br>"
                        + "<p><b><span style=\"color:green\">"+messageToBeSent+"</b></span></p>",
               "text/html");
            
            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
	}

}
