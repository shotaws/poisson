import java.io.*;
import java.util.regex.Pattern;


public class ConvertPosScenargie {

	public static void main(String[] args) {
		// TODO 自動生成されたメソッド・スタブ
		FileReader in;
		BufferedReader br;
		FileWriter out;
		BufferedWriter bw;
		
		try {
			in = new FileReader("in.csv");
			br = new BufferedReader(in);
			out = new FileWriter("out.pos");
			bw = new BufferedWriter(out);
			
			Pattern p = Pattern.compile("[,\\s]+");
			String line;
			
			int i = 1;
			while ((line = br.readLine()) != null) {		
				System.out.println(line);
				String[] lines = p.split(line);
				lines[0] = String.format("%.3f", Double.valueOf(lines[0]));
				lines[1] = String.format("%.3f", Double.valueOf(lines[1]));
				bw.write(i + " 0 " + lines[0] + " " + lines[1] + " 0.000 0 0");
				bw.newLine();
				i++;
			}
			
			bw.flush();
			out.close();
			br.close();
			in.close();
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			System.out.println(e);
		}

	}

}
