import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import org.jibble.pircbot.*;

public class KartoffelBotMain {
  public static void main(String[] args) throws Exception {
      
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
      String password[] = Database.read("SELECT Password FROM config WHERE ID = '"+botid+"'", "Password");
      String channelName[] = Database.read("SELECT ChannelName FROM config WHERE ID = '"+botid+"'", "ChannelName");
      String server[] = Database.read("SELECT Server FROM config WHERE ID = '"+botid+"'", "Server");
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    /*  
       MySQL Stuff
       
            Database.write("INSERT INTO test01(ID, Test) VALUES(111, \"Zawos!\")");
            String Test[] = Database.read("SELECT Test FROM test01", "Test");
            
            System.out.println(Test[10]);
   */
      
      
      
    KartoffelBot bot = new KartoffelBot();      // this starts your bot
    bot.setVerbose(true);             // enable debugging, useful during programming
    //bot.connect("localhost");  // connect to localhost
    bot.connect(server[0], 6667, password[0]);  // connect to your IRC server (fill in your own)
    bot.joinChannel("#"+channelName[0]);    // join your channel
  }
}