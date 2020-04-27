import java.util.ArrayList;

public privileged aspect Authentication {

	
	private  ArrayList<String> Server.blackList = new ArrayList<String>();
	
	pointcut criticalServer(Client c,Server s) : (  call(* Server.isActive(..)) || call(* Server.attach(..)) ||
			call(* Server.detach(..)) || call(* Server.ping(..)))
	
	&& this(c) && target (s);
	
	
	  Object around(Client c,Server s):criticalServer( c, s)  {
		  
		  //Check if the client is blckListed
		  if( (s.blackList).contains(c.getAddress()) ) {
			  ArrayList<Client> clients =s.clients;
			  if(clients.contains(c)) {
				  //for connect case
					//Disconnect the client
					System.out.println("Connection broken between "+c+ " and "+s);
					
					clients.remove(c);
				    System.out.print("Clients Logged In: " + clients + "\n");
			  }
			  return "Can't proceed";

		  }else {
			  return proceed(c,s);
		  }
	 }

	  void around(Client c,Server s): call(* Server.getClients(..)) && this(c) && target (s){
		  
		  if( !((s.blackList).contains(c.getAddress()) ) ) {
			  System.out.println("WARNING >>> Suspicious call from "+c.getAddress()+" to "+thisJoinPoint);
			  
			  	//Disconnect the client
			  	System.out.println("Connection broken between "+c+ " and "+s);
			  	
				ArrayList<Client> clients =s.clients;

			    clients.remove(c);

			    System.out.print("Clients Logged In: " + clients + "\n");
			  //Add the client address to the server blackList
			  (s.blackList).add(c.getAddress());
		  }
	  }
	 
}
