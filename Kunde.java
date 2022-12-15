import java.util.ArrayList;

public class Kunde {
	private int nummer;
	private String name;
	private ArrayList<Auftrag> auftraege = new ArrayList<Auftrag>();
	
	public Kunde(int nummer, String name) {
		super();
		this.nummer = nummer;
		this.name = name;
	}
	
	public ArrayList<Auftrag> getAuftraegeByLimit(double gesamtpreis) {
		ArrayList<Auftrag> a = new ArrayList<Auftrag>();
		for (int i = 0; i < auftraege.size(); i++) {
			if (auftraege.get(i).getEndpreis() >= gesamtpreis) {
				a.add(auftraege.get(i));
			}
		}
		return a;
	}
	
	public Auftrag getAuftrag(int auftragsnr) {
		for (int i = 0; i < auftraege.size(); i++) {
			if (auftraege.get(i).getNummer() == auftragsnr) {
				Auftrag a = auftraege.get(i);
				return a;
			}
		}
		return null;
	}
}
