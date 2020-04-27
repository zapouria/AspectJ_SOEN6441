
public class Main {

	public static void main(String[]args) {
		Server host = new Server("My Server");
		Client jack = new Client("Jack", "evil.net");
		Client jill = new Client("Jill", "evil.net");
		Client jekyll = new Client("Jekyll", "student.net");
		Client hyde = new Client("Hyde", "evil.net");
		
		jack.connect(host); // accommodate
		jill.connect(host); // accommodate
		jekyll.connect(host); // accommodate
		
		jekyll.disconnect(host);
		
		jack.getAllClients();
		jill.pingServer();
		jill.getAllClients();
		jill.getAllClients();
		
		jill.connect(host);
		hyde.connect(host);
		
		host.getClients();
		
	}
}
