package it.generationitaly.cinema.entity;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "film")
public class Film {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Long id;

	@Column(name = "titolo", length = 100, nullable = false)
	private String titolo;

	@Column(name = "trama", length = 3000, nullable = false)
	private String trama;

	@Column(name = "locandina", length = 3000, nullable = false)
	private String locandina;

	@Temporal(TemporalType.DATE)
	@Column(name = "data_uscita", nullable = false)
	private Date dataUscita;

	@Column(name = "durata", nullable = false)
	private int durata;

	@ManyToOne
	@JoinColumn(name = "categoria_id", nullable = false)
	private Categoria categoria;

	@Column(name = "budget_produzione", nullable = false)
	private int budget;

	@OneToMany(mappedBy = "film", fetch = FetchType.EAGER)
	private List<Recensione> recensioni;

	@ManyToMany(fetch = FetchType.EAGER)
	//indica la tabella intermedia 
	@JoinTable(name = "film_attore", joinColumns =
	//indica la colonna che contiene l'id del film
	@JoinColumn(name = "film_id"), inverseJoinColumns = 
	//indica la colonna che contiene l'id dell'attore
	@JoinColumn(name = "attore_id"))
	private List<Attore> attori;

	public Film() {

	}
	
	public Film(String titolo) {
		this.titolo = titolo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getTrama() {
		return trama;
	}

	public void setTrama(String trama) {
		this.trama = trama;
	}

	public String getLocandina() {
		return locandina;
	}

	public void setLocandina(String locandina) {
		this.locandina = locandina;
	}

	public Date getDataUscita() {
		return dataUscita;
	}

	public void setDataUscita(Date dataUscita) {
		this.dataUscita = dataUscita;
	}

	public int getDurata() {
		return durata;
	}

	public void setDurata(int durata) {
		this.durata = durata;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public int getBudget() {
		return budget;
	}

	public void setBudget(int budget) {
		this.budget = budget;
	}

	public List<Recensione> getRecensioni() {
		return recensioni;
	}

	public void setRecensioni(List<Recensione> recensioni) {
		this.recensioni = recensioni;
	}

	public List<Attore> getAttori() {
		return attori;
	}

	public void setAttori(List<Attore> attori) {
		this.attori = attori;
	}

	@Override
	public String toString() {
		return "Film [id=" + id + ", titolo=" + titolo + ", trama=" + trama + ", locandina=" + locandina
				+ ", dataUscita=" + dataUscita + ", durata=" + durata + ", categoria=" + categoria + ", budget="
				+ budget + "]";
	}
}