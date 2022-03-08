import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class pureaverage {
	//private static int[][] datas = new int[primes.length][3];
	private static int[] primes;

	public static void main(String[] args) throws FileNotFoundException {
		Scanner data = new Scanner(new File("../data.txt"));
		data.nextLine();
		String line = data.nextLine();
		primes = new int[1000];
		for(int i = 0; i < primes.length; i++){
			primes[i] = i + 1;
		}
		int[] count = new int[primes.length];
		int[] indices = new int[primes.length];
		int[] denom  = new int[primes.length];
		int[] averages  = new int[primes.length];
		while(data.hasNextLine()){
			int[] linedat = parse(line);
			if(linedat[0] % 2 == 1 && contains(primes, linedat[2])){
				//System.out.println(linedat[0] + " " + linedat[1] + " " + linedat[2]);
				int primedex = indexOf(primes,linedat[2]);
				count[primedex]++;
				int index = count[primedex];
				if(index == 1){
					indices[primedex] = linedat[0];
					denom[primedex] = linedat[1];
				} else if(index == 2 && linedat[1] == linedat[2] - denom[primedex]){
					averages[primedex] = (indices[primedex] + linedat[0]) / 2;
				} else{
					count[primedex]--;
				}
			}
			line = data.nextLine();
		}
		for (int i = 0; i < primes.length; i++) {
			System.out.println(primes[i] + " " + denom[i]);
					//+ ilog(averages[i] / 6));
		}
		/*
		int[][] 
		while(data.hasNextLine()){
			int[] parsed = parse(line);
			while(line.contains(", 29/") && parse(line)[2] != 1){
				System.out.println(parsed[0] + " " + parsed[1] + " " + parsed[2]);
			}
			line=data.nextLine();
		}
		*/
	}

	public static int ilog(int a){
		for (int i = 0; Math.pow(2, i) <= a; i++) {
			if(Math.pow(2,i) == a){
				return i;
			}
		}
		return -1;
	}

	public static int[] parse(String line){
		int[] datas = new int[3];
		datas[0] = Integer.valueOf(line.substring(1,line.indexOf(",")));
		if(!line.contains("/")){
			datas[1] = 1;
			datas[2] = Integer.valueOf(line.substring(line.indexOf(",") + 2, line.length() - 1));
		} else{
			datas[1] = Integer.valueOf(line.substring(line.indexOf("/") + 1, line.length() - 1));
			datas[2] = Integer.valueOf(line.substring(line.indexOf(",") + 2, line.indexOf("/")));
		}
		return datas;
	}

	//assume sorted list
	public static boolean contains(int[] primes, int check){
		for(int i = 0; i < primes.length; i++) {
			if(check == primes[i]){
				return true;
			}
		}
		return false;
	}

	//assumes arr contains check already
	public static int indexOf(int[] arr, int check){
		for (int i = 0 ; i < arr.length; i++) {
			if(arr[i] == check){
				return i;
			}
			
		}
		return -1;
	}
}
