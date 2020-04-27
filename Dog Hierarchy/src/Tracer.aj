
public aspect Tracer {

	before(): call(void Dog.whatIdo()) {
		System.out.println(">Captured message to object of type Dog(call): " + thisJoinPoint);
	}
	
	before(): call(void Collie.whatIdo()) {
		System.out.println(">Captured message to object of type Collie(call): " + thisJoinPoint);
	}
	
	before(): call(* GrandSon.*()) {
		System.out.println(">Captured message to object of type GrandSon(call): " + thisJoinPoint);
	}
	
	before(): call(* GrandGrandSon.*()) {
		System.out.println(">Captured message to object of type GrandGrandSon(call): " + thisJoinPoint);
	}
	
	before(): execution(* Dog.*()) {
		System.out.println(">Captured message to object of type Dog(execution): " + thisJoinPoint);
	}
	
	before(): execution(* Collie.*()) {
		System.out.println(">Captured message to object of type Collie(execution): " + thisJoinPoint);
	}
	
	before(): execution(* GrandSon.*()) {
		System.out.println(">Captured message to object of type GrandSon(execution): " + thisJoinPoint);
	}
	
	before(): execution(* GrandGrandSon.*()) {
		System.out.println(">Captured message to object of type GrandGrandSon(execution): " + thisJoinPoint);
	}
//	after() : call(* Dog.*()) {
//		System.out.println(">Captured call in class Dog: " + thisJoinPoint);
//	}
//	after() : call(* Collie.*()) {
//		System.out.println(">Captured call in class Collie: " + thisJoinPoint);
//	}
//
//	after() : execution(* Dog.*()) {
//		System.out.println(">Captured execution in class Dog: " + thisJoinPoint);
//	}
//	after() : execution(* Collie.*()) {
//		System.out.println(">Captured execution in class Collie: " + thisJoinPoint);
//	}
}
