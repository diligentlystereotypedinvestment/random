import java.util.*;
import java.io.*;

public class gauss {
	public static gauss main;
	public static Queue<int[][]> fRoot = new LinkedList<int[][]>();
	public static Queue<int[][]> temp1 = new LinkedList<int[][]>();
	public static Queue<int[][]> temp2 = new LinkedList<int[][]>();
	public static Set<Integer> norms = new HashSet<Integer>();
	public int[][] ab;
	public gauss lNode = null;
	public gauss rNode = null;
	public static int cRoot = 1;
	public static int rRoot = 1;
	public int depth = 5;
	public static int d = 5;
	public static ArrayList<gauss> deep = new ArrayList<gauss>();
	public static boolean printTree;
	public boolean onDiagonal = false;

	public gauss(int[][] ab, int depth){
		this.ab = ab;
		this.depth = depth;
	}

	public static void calc(gauss G, int index){
		if(index == 0){
		} else{
			lcalc(G);
			rcalc(G);
			calc(G.lNode, index - 1);
			calc(G.rNode, index - 1);
		}
		main = this;
	}

	public void mark(){
		if(lNode != null){
			lNode.onDiagonal = true;
			if(lNode.rNode != null){
				lNode.rNode.onDiagonal = true;
				lNode.rNode.mark();
			}
		}
		if(rNode != null){
			rNode.onDiagonal = true;
			if(rNode.lNode != null){
				rNode.lNode.onDiagonal = true;
				rNode.lNode.mark();
			}
		}
	}

	public void search(){
		if(lNode != null){
			temp1.add(lNode.ab);
		}
		if(rNode != null){
			temp1.add(rNode.ab);
		}
		temp2.add(temp1.remove());
		if(!temp2.peek().onDiagonal){
			fRoot.add(temp2.peek());
			temp2.peek().mark();
		}
		if(lNode != null){
			lNode.search();
		}
		if(lNode != null){
			lNode.search();
		}
	}

	public static void lcalc(gauss G){
		int[][] left = new int[2][2];
		left[0] = G.ab[0];
		left[1] = new int[] {G.ab[0][0] + G.ab[1][0], G.ab[0][1] + G.ab[1][1]};
		G.lNode = new gauss(left, G.depth + 1);
		norms.add(rRoot * G.ab[0][0] * G.ab[0][0] - cRoot *( G.ab[0][1] * G.ab[0][1]));
		norms.add(rRoot * G.ab[1][0] * G.ab[1][0] - cRoot * (G.ab[1][1] * G.ab[1][1]));
	}

	public static void rcalc(gauss G){
		int[][] right = new int[2][2];
		right[1] = G.ab[1];
		right[0] = new int[] {G.ab[0][0] + G.ab[1][0], G.ab[0][1] + G.ab[1][1]};
		G.rNode = new gauss(right, G.depth + 1);
		norms.add(rRoot * G.ab[0][0] * G.ab[0][0] - cRoot*(G.ab[0][1] * G.ab[0][1]));
		norms.add(rRoot * G.ab[1][0] * G.ab[1][0] - cRoot*(G.ab[1][1] * G.ab[1][1]));
	}

	public String toString(){
		//print(ab);
		if(lNode != null){
			System.out.println();
			System.out.print(lNode);
			System.out.print(rNode);
		}
		return "";
	}

	public String getValue(){
		return (ab[0][0] + " + " + ab[0][1] + "i / " + ab[1][0] + " + " + ab[1][1] + "i ");
	}
	
	public void print(PrintStream os) {
		StringBuilder sb = new StringBuilder();
		traversePreOrder(sb, "", "", this);
		if(printTree){
			os.print(sb.toString());
		}
	}

	public void traversePreOrder(StringBuilder sb, String padding, String pointer, gauss node) {
		if (node != null) {
			if(node.depth == d){
				deep.add(node);
			}
			sb.append(padding);
			sb.append(pointer);
			sb.append(node.getValue());
			sb.append("\n");
			StringBuilder paddingBuilder = new StringBuilder(padding);
			paddingBuilder.append("│  ");
			String paddingForBoth = paddingBuilder.toString();
			String pointerForRight = "└──";
			String pointerForLeft = (node.rNode != null) ? "├──" : "└──";
			traversePreOrder(sb, paddingForBoth, pointerForLeft, node.lNode);
			traversePreOrder(sb, paddingForBoth, pointerForRight, node.rNode);
		}
	}

	public static int[] sub(gauss g1, gauss g2){
		int real = g2.ab[1][0] - g1.ab[0][0];
		int imaginary = g2.ab[1][1] - g1.ab[0][1];
		return new int[] {real,imaginary};
	}

	public static int norm(int[] alpha){
		return rRoot * (int)Math.pow(alpha[0], 2) - cRoot * (int)Math.pow(alpha[1],2);
	}

	public static void test(int n){
		boolean isRoot = false;
		for (int i = 0; i < n; i++) {
			if(Math.pow(i,2) % n == n + cRoot){
				isRoot = true;
				break;
			}
		}
		if(!isRoot){
			System.out.println(false);
		}
	}

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		gauss Tree = new gauss(new int[][] {{1,0},{1,0}}, 5);
		calc(Tree, 0);
		Tree.lNode = null;
		Tree.mark();
		temp1.add(Tree.ab);
		Tree.search();
		System.out.println(fRoot);

	}
}
