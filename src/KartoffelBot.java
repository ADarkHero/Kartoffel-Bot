import org.jibble.pircbot.*;
import java.io.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JFrame;
import javax.swing.Timer;




public class KartoffelBot extends PircBot {
    
    int first = 0;
    
  public KartoffelBot() {
      String fileName = "config/id.txt";
      String line = null;
      String botid = "";

                                        try {
                                                FileReader fileReader = new FileReader(fileName);

                                                BufferedReader bufferedReader = new BufferedReader(fileReader);

                                                while((line = bufferedReader.readLine()) != null) {
                                                    botid = line;
                                                }	

                                                bufferedReader.close();			
                                            }
                                            catch(FileNotFoundException ex) {
                                                System.out.println(
                                                    "Unable to open file '" + fileName + "'");				
                                            }
                                            catch(IOException ex) {
                                                System.out.println("Error reading file '" + fileName + "'");
                                            }
                                        
     String botname[] = Database.read("SELECT BotName FROM config WHERE ID = '"+botid+"'", "BotName");
      
    this.setName(botname[0]);          // use your own nick here
  }
  
  
  //Notiz: u.isOp() funktioniert nicht richtig auf Twitch. q.q
                          private static int cnt;

       
  
                          
  
	  public void onMessage(String channel, String sender, String login, String hostname, String message) {
            
            //Chatlog  
             String readlog[] = Database.read("SELECT ID FROM log", "ID");
             Database.write("INSERT INTO log(ID, Channel, User, Message) VALUES("+readlog.length+", \""+channel+"\",\""+sender+"\",\""+message+"\")");

			
		//Testcommand
			if (message.equals("!test")) {
			   sendMessage(channel, sender + " sagte: " + message);
			}
		
		//OP Rechte abfragen
			if (message.equals("!isop")) {
				User users[] = getUsers( channel );
				User u = null;

				for( User user : users ){
				   if( sender.equals( user.getNick() ) ){
					  u = user;
					  break;
				   }
                                   System.out.println("Test");
				}
			
				if ( u.isOp() || sender.equals("adarkhero") ){
                                    sendMessage(channel, "You currently have OP rights!");
                            }
				else {
                                    sendMessage(channel, "You currently have NO OP rights!");
                            }
			}
			
			
	
                        
                       
                        
                        
                        
                        
                        
                        String botid = "";   
      String fileName = "config/id.txt";
      String line = null;

                                        try {
                                                FileReader fileReader = new FileReader(fileName);

                                                BufferedReader bufferedReader = new BufferedReader(fileReader);

                                                while((line = bufferedReader.readLine()) != null) {
                                                    botid = line;
                                                }	

                                                bufferedReader.close();			
                                            }
                                            catch(FileNotFoundException ex) {
                                                System.out.println(
                                                    "Unable to open file '" + fileName + "'");				
                                            }
                                            catch(IOException ex) {
                                                System.out.println("Error reading file '" + fileName + "'");
                                            }
   
      String botname[] = Database.read("SELECT BotName FROM config WHERE ID = '"+botid+"'", "BotName");
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
          //NORMAL Commands
                int count = 0;
                String normalcmd[] = Database.read("SELECT Command FROM commands WHERE Type = 'Normal' && (User = '' || User = '"+botname[0]+"')", "Command");
                
                while (count < normalcmd.length) {                    
                    if (message.equals(normalcmd[count])) {
                        String op[] = Database.read("SELECT OP FROM commands WHERE Command ='"+message+"'", "OP");
                        //OP Abfrage
                        if (op[0] == "1"){
                                  
                                        User users[] = getUsers( channel );
                                         User u = null;

                                         for( User user : users ){
                                            if( sender.equals( user.getNick() ) ){
                                                   u = user;
                                                   break;
                                            }
                                         }
                              
                                     if(u.isOp() || sender.equals("adarkhero")){
                                         
                                     }
                                     else{
                                         break;
                                     }
                                         
                              
                              }
                        
                           String cmd[] = Database.read("SELECT Options FROM commands WHERE Command = '"+message+"'", "Options");
			   sendMessage(channel, cmd[0]);
			}
                    
                    count++;
                } 
                
                
         //REACT Input       
                count = 0;
                String reactcmd[] = Database.read("SELECT Command FROM commands WHERE Type = 'React' && (User = '' || User = '"+botname[0]+"')", "Command");
                
                while (count < reactcmd.length) {                    
                    if (message.contains(reactcmd[count])) {                         
                              String value[] = message.split(" ");
                              String cmd[] = Database.read("SELECT Options FROM commands WHERE Command ='"+value[0]+"'", "Options");
                              String op[] = Database.read("SELECT OP FROM commands WHERE Command ='"+value[0]+"'", "OP");

                              
                             //OP Abfrage 
                              if (op[0] == "1"){
                                  
                                        User users[] = getUsers( channel );
                                         User u = null;

                                         for( User user : users ){
                                            if( sender.equals( user.getNick() ) ){
                                                   u = user;
                                                   break;
                                            }
                                         }
                              
                                     if(u.isOp() || sender.equals("adarkhero")){
                                         
                                     }
                                     else{
                                         break;
                                     }
                                         
                              
                              }
                                  
                              
                              
                           if (value.length == 1) { break; }   
                           if (value.length >= 2) {                                     
                               int counter = 1;
                               String valueup = "";
                                    while (value.length > counter){
                                        valueup = valueup + value[counter] + "";
                                        
                                        counter++;
                                    }
                              
                              cmd[0] = cmd[0].replace("$$value$$",valueup);      
                              cmd[0] = cmd[0].replace("$$value01$$",value[1]); }			   
                           if (value.length >= 3) { cmd[0] = cmd[0].replace("$$value02$$",value[2]); } 			   
                           cmd[0] = cmd[0].replace("$$user$$",sender);			   
                           
                           
                           sendMessage(channel, cmd[0]);
			
                    }
                    
                    count++;
                }        

                
                
          //WRITE Input
                count = 0;
                String writecmd[] = Database.read("SELECT Command FROM commands WHERE Type = 'Write' && (User = '' || User = '"+botname[0]+"')", "Command");
                
                while (count < writecmd.length) {                    
                    if (message.contains(writecmd[count])) {
                        String value[] = message.split(" ");
                        String op[] = Database.read("SELECT OP FROM commands WHERE Command ='"+value[0]+"'", "OP");
                                                      
                        //OP Abfrage
                        if (op[0].equals("1")){
                                  
                                        User users[] = getUsers( channel );
                                         User u = null;

                                         for( User user : users ){
                                            if( sender.equals( user.getNick() ) ){
                                                   u = user;
                                                   break;
                                            }
                                         }
                              
                                     if(u.isOp() || sender.equals("adarkhero")){
                                         
                                     }
                                     else{
                                         break;
                                     }
                                         
                              
                              }
                        
                           
                           
                        String dbwrite[] = Database.read("SELECT Options02 FROM commands WHERE Command = '"+value[0]+"'", "Options02");
                        if (value.length >= 2){ dbwrite[0] = dbwrite[0].replace("$$value$$",value[1]); }
                        if (value.length >= 3){ dbwrite[0] = dbwrite[0].replace("$$value01$$",value[2]); }
                        dbwrite[0] = dbwrite[0].replace("$$user$$",sender);
                        dbwrite[0] = dbwrite[0].replace("$$channel$$",channel);
                        
                        if (value.length >= 2){ 
                            String newmsg = message.substring(value[0].length());
                            dbwrite[0] = dbwrite[0].replace("$$message$$",newmsg); }
                        
                        Database.write(dbwrite[0]);
                        
                           String cmd[] = Database.read("SELECT Options FROM commands WHERE Command = '"+value[0]+"'", "Options");
                           cmd[0] = cmd[0].replace("$$user$$",sender);
			   sendMessage(channel, cmd[0]);
			}
                    
                    count++;
                } 
                
          //READ Input      
            count = 0;
                String readcmd[] = Database.read("SELECT Command FROM commands WHERE Type = 'Read' && (User = '' || User = '"+botname[0]+"')", "Command");
                
                while (count < readcmd.length) {                    
                    if (message.equals(readcmd[count])) {
                        String op[] = Database.read("SELECT OP FROM commands WHERE Command ='"+message+"'", "OP");
                        //OP Abfrage
                        if (op[0] == "1"){
                                  
                                        User users[] = getUsers( channel );
                                         User u = null;

                                         for( User user : users ){
                                            if( sender.equals( user.getNick() ) ){
                                                   u = user;
                                                   break;
                                            }
                                         }
                              
                                     if(u.isOp() || sender.equals("adarkhero")){
                                         
                                     }
                                     else{
                                         break;
                                     }
                                         
                              
                              }
                        String dbread[] = Database.read("SELECT Options02 FROM commands WHERE Command = '"+message+"'", "Options02");
                        String dbread02[] = Database.read("SELECT Options03 FROM commands WHERE Command = '"+message+"'", "Options03");
                        dbread[0] = dbread[0].replace("$$user$$",sender);
                        String dbreadcmd[] = Database.read(dbread[0], dbread02[0]);                 
                                              
                        
                           String cmd[] = Database.read("SELECT Options FROM commands WHERE Command = '"+message+"'", "Options");
                           
                            cmd[0] = cmd[0].replace("$$user$$",sender);
                            cmd[0] = cmd[0].replace("$$value$$",dbreadcmd[0]);
                           
			   sendMessage(channel, cmd[0]);
			}
                    
                    count++;
                }    
			
			
		//BADWORDS
                count = 0;
                String badcmd[] = Database.read("SELECT Badword FROM badwords WHERE Channel = '' || Channel = '"+botname[0]+"'", "Badword");
                
                while (count < badcmd.length) {                    
                    if (message.contains(badcmd[count])) {                         
                                  
                                        User users[] = getUsers( channel );
                                         User u = null;

                                         for( User user : users ){
                                            if( sender.equals( user.getNick() ) ){
                                                   u = user;
                                                   break;
                                            }
                                         }
                              
                                     if(u.isOp() || sender.equals("adarkhero")){
                                         break;
                                     }
                                     else{
                                         kick(channel, sender);
       		   
                           
                                            String kickcmd[] = Database.read("SELECT Options FROM commands WHERE Command = '!badword'", "Options");
                                            sendMessage(channel, kickcmd[0]);
                                     }
                                         
                              
                              }

                    
                    
                    count++;
                }      

  
                        
	}
	
          
          
          
          
          
          
          
          
          

          
          
          
          
          
          
          
	
	
	
	//Begrüssung
	protected void onJoin(final String channel, String sender, String login, String hostname){
           String joinmsg = "";
           int rank = 0;
           Database.write("INSERT INTO rank(ID, User, Rank) VALUES(0, \""+sender+"\", 0)"); 


              String rankdb[] = Database.read("SELECT Rank FROM rank WHERE User='"+sender+"'","Rank");

          
                rank = Integer.parseInt(rankdb[0]);
           
            
                rank++;
               Database.write("UPDATE rank SET Rank = "+rank+" WHERE User = \""+sender+"\"");
      
               
     if (joinmsg.equals("undercover")){
         
     }
     else{
        sendMessage(channel, "Welcome to the stream " + sender + "! FrankerZ [Rank " + rank + "]");
     }
     
     
     
     
     if(first == 0){
         //Automessage
                        ActionListener actListner = new ActionListener() {

                        @Override

                        public void actionPerformed(ActionEvent event) {

                            sendMessage(channel, "Welcome to the land of bad (flat) jokes, I'm your travel guide! Our journey starts irregular in the night (german time / UTC+1). Our voyage includes 'RPG Maker Firstlooks', 'Speedruns' or 'Just Random Games' in the beautiful languages german and english!");

                        }

                          };

                          Timer timer = new Timer(600000, actListner);

                          timer.start();
                          
           //Automessage
                        ActionListener actListner02 = new ActionListener() {

                        @Override

                        public void actionPerformed(ActionEvent event) {

                            sendMessage(channel, "Don't forget, to check out the description!");

                        }

                          };

                          Timer timer02 = new Timer(666666, actListner02);

                          timer02.start();               
                          
                          
                          first = 1;
     }
           
           
      }
      
      
      
      
     
	
	//Verabschiedung
	protected void onPart(String channel, String sender, String login, String hostname){
		sendMessage(channel, "Bye " + sender + "! We will miss you! RalpherZ"); 
	}
	
	protected void onQuit(String channel, String sender, String login, String hostname){
		sendMessage(channel, "Bye " + sender + "! We will miss you! RalpherZ"); 
	}

        
        

	
	
	
	
	
	
	
	
}