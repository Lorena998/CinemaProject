package it.generationitaly.cinema.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "recensione")
public class Recensione {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Long id;

	@Column(name = "recensione", length = 3000)
	private String recensione;

	@ManyToOne
	@JoinColumn(name = "utente_id", nullable = false)
	private Utente utente;

	@ManyToOne
	@JoinColumn(name = "film_id", nullable = false)
	private Film film;
	
	

	public Recensione() {
	}

	public Recensione(String recensione, Utente utente, Film film) {
		this.recensione = recensione;
		this.utente = utente;
		this.film = film;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRecensione() {
		return recensione;
	}

	public void setRecensione(String recensione) {
		this.recensione = recensione;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

	public Film getFilm() {
		return film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

	@Override
	public String toString() {
		return "Recensione [id=" + id + ", recensione=" + recensione + ", utente=" + utente + ", film=" + film + "]";
	}
}