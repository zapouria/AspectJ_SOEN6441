
public aspect Logger {

	pointcut mutators(): call(* BStack.*(..));
	
	before(): mutators() {
		//System.out.println(">Message sent to update stack.");
		System.out.println(">Message sent to update stack: " + thisJoinPoint);
	}
}
