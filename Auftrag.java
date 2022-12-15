import java.util.ArrayList;

public class Auftrag {
	private int nummer;
	private ArrayList<Position> positionen = new ArrayList<Position>();

	public Auftrag(int nummer) {
		this.nummer = nummer;
	}

	public int getNummer() {
		return nummer;
	}

	public double getEndpreis() {
		double endpreis = 0;
		for (int i = 0; i < positionen.size(); i++) {
			endpreis += (positionen.get(i).getAnzahl() * positionen.get(i).getArtikel().getPreis());
		}
		return endpreis;
	}
	
}
