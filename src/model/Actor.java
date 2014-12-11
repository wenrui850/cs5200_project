package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the actor database table.
 * 
 */
@Entity
@NamedQuery(name="Actor.findAll", query="SELECT a FROM Actor a")
public class Actor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String name;

	private String rottenTomatoesId;

	//bi-directional many-to-one association to Cast
	@OneToMany(mappedBy="actor")
	private List<Cast> casts;

	public Actor() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRottenTomatoesId() {
		return this.rottenTomatoesId;
	}

	public void setRottenTomatoesId(String rottenTomatoesId) {
		this.rottenTomatoesId = rottenTomatoesId;
	}

	public List<Cast> getCasts() {
		return this.casts;
	}

	public void setCasts(List<Cast> casts) {
		this.casts = casts;
	}

	public Cast addCast(Cast cast) {
		getCasts().add(cast);
		cast.setActor(this);

		return cast;
	}

	public Cast removeCast(Cast cast) {
		getCasts().remove(cast);
		cast.setActor(null);

		return cast;
	}

}