package database;


import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendEmail {

    public static void function(String emailToBeSent,String subject,String farmer_name,String farmer_no,String customer_name,String customer_no,String vegname,String quantity,String price,String total,String flag){

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
            if(flag.equals("CtoF"))
            {
           message.setContent(
              "<h1>Hai "+farmer_name+"</h1><br>"
                      + "<p><b><span style=\"color:green\">The Customer named :</b></span>"+customer_name+" wants to buy your "+vegname+" of "+quantity+" kg</p>"
                      + "<p><span style=\\\"color:green\\\">Customer phone number: </span>"+customer_no+"</p>",
             "text/html");
            }
            else if(flag.equals("FtoC"))
            {
             message.setContent(
                "<h1>Hai "+customer_name+"</h1><br>"
                        + "<p><b><span style=\"color:green\">The Farmer named :</b></span>"+farmer_name+" Dispatched  your "+vegname+" of "+quantity+" kg</p>"
                        + "<p><span style=\\\"color:green\\\">Famer phone number: </span>"+farmer_no+"</p>"
                        + "<p><span style=\\\"color:green\\\">Price per Kg: </span>"+price+"</p>"
                        +"<p><span style=\\\"color:green\\\">Amount to be paid: </span>"+total+"</p>",
               "text/html");
            }
            else
            {
             message.setContent(
                "<h1>Hai "+customer_name+"</h1><br>"
                        + "<p><b><span style=\"color:green\">You are Registered Successfully</b></span></p>"
                        + "<a href='http://localhost:8080/UlavarUrimai/Login.jsp'>Login into Portal</a>",
               "text/html");
            }
            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
    public static void main(String[] args)
    {
    	SendEmail.function("18euit084@skcet.ac.in", "Hi" ,"", "", "", "", "", "", "", "", "CtoF");
    }
}