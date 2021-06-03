import java.io.FileWriter;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.io.BufferedWriter;

public aspect Logger {

	 Calendar cal = Calendar.getInstance();
	 
	 pointcut done() : execution(* moneyWithdrawal() ) || execution(* moneyMakeTransaction());
	 after(): done(){
		 
		 String cadena = "";
		 String hora = "";
		 
		 if(thisJoinPointStaticPart.getSignature().getName().equalsIgnoreCase("moneyMakeTransaction")) {
			 cadena += "Se Hizo la transaccion";
			 hora += "realizado a las:";
		 }else {
			 cadena += "Se hizo el retiro";
			 hora += "realizado:";
		 }
		 
		 System.out.println(cadena);
		 System.out.println(hora + cal.getTime());
		 
		 try(FileWriter f = new FileWriter("log.txt", true);
				 BufferedWriter b = new BufferedWriter(f);
				 PrintWriter p = new PrintWriter(b))
		 		{
			 		f.write(cadena+","+hora+cal.getTime());
			 		f.write("\n");
			 		f.close();
			 
		 		}catch (IOException e) {
		 
	 }
	 
	 }
}