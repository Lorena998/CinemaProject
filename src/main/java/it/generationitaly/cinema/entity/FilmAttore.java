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
@Table(name = "film_attore")
public class FilmAttore {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Long id;

	@ManyToOne
	@JoinColumn(name = "film_id", nullable = false)
	private Film film;

	@ManyToOne
	@JoinColumn(name = "attore_id", nullable = false)
	private Attore attore;

	public FilmAttore() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Film getFilm() {
		return film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

	public Attore getAttore() {
		return attore;
	}

	public void setAttore(Attore attore) {
		this.attore = attore;
	}

	@Override
	public String toString() {
		return "FilmAttore [id=" + id + ", film=" + film.getTitolo() + ", attore=" + attore.getNome() + " "
				+ attore.getCognome() + "]";
	}
}
