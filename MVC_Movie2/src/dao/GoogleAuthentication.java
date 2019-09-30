package dao;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
    
    public GoogleAuthentication(){
        passAuth = new PasswordAuthentication("qhrud961123", "qwerty9556!!");
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        return passAuth;
    }
}
