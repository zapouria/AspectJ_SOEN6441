import java.util.ArrayList;
import java.util.stream.Stream;

public privileged aspect Logging {
	declare precedence: Logging, Authentication;


	before(Client c, Server s): call(* Server.attach(*)) && this (c) && target(s)  {
		System.out.println("CONNECTION REQUEST >>> "+c+ " requests connection to "+s);
	}
	after(Client c, Server s): call(* Server.attach(*)) && this (c) && target(s)  {
		ArrayList<Client> clients =s.clients;

		if(clients.contains(c)) {
			System.out.println("");

			System.out.println("Connection established between "+c+ " and "+s);

		    System.out.print("Clients Logged In: " + clients + "\n");
			System.out.println("");

		}
		
	

	}
	
	after(Client c, Server s): call(* Server.detach(*)) && this (c) && target(s)  {
		System.out.println("");
		System.out.println("Connection broken between "+c+ " and "+s);

		//c.getAllClients();
		ArrayList<Client> clients =s.clients;
	    System.out.print("Clients Logged In: " + clients + "\n");
		System.out.println("");

	}

}
