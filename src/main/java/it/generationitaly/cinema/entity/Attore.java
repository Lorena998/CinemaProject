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
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "attore")
public class Attore {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Long id;

	@Column(name = "nome", length = 45, nullable = false)
	private String nome;

	@Column(name = "cognome", length = 45, nullable = false)
	private String cognome;

	@Temporal(TemporalType.DATE)
	@Column(name = "data_nascita", nullable = false)
	private Date dataNascita;

	@Column(name = "foto", length = 3000, nullable = false)
	private String foto;

	@Column(name = "biografia", length = 3000, nullable = false)
	private String biografia;

	@ManyToMany(fetch = FetchType.EAGER)
	// indica la tabella intermedia
	@JoinTable(name = "film_attore", joinColumns =
	// indica la colonna che contiene l'id dell'attore
	@JoinColumn(name = "attore_id"), inverseJoinColumns =
	// indica la colonna che contiene l'id del film
	@JoinColumn(name = "film_id"))
	private List<Film> film;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public Date getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(Date dataNascita) {
		this.dataNascita = dataNascita;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getBiografia() {
		return biografia;
	}

	public void setBiografia(String biografia) {
		this.biografia = biografia;
	}

	public List<Film> getFilm() {
		return film;
	}

	public void setFilm(List<Film> film) {
		this.film = film;
	}

	@Override
	public String toString() {
		return "Attore [id=" + id + ", nome=" + nome + ", cognome=" + cognome + ", dataNascita=" + dataNascita
				+ ", foto=" + foto + ", biografia=" + biografia + "]";
	}
}