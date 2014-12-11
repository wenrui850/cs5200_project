package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Movie;
import model.Review;
import model.User;

public class UserDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("Movie");
	

	
	public boolean createUser(User newUser)
	{
		boolean success = false;
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(newUser);
		
		em.getTransaction().commit();
		em.close();
		
		int check = findUserId(newUser.getUsername());
		if(check!=0)
			success = true;
		return success;
	}
	
	public List<User> getAllUsers()
	{
		List<User> users = new ArrayList<User>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("select u from User u");
		users = (List<User>)query.getResultList();

		em.getTransaction().commit();
		em.close();
		return users;
	}
	
	public int findUserId(String username) 
	{
		int userId = 0;
		List<User> users = new ArrayList<User>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		users = getAllUsers();
		for (User user: users)
		{
			if (user.getUsername().equals(username) )
				userId = user.getId();
		}

		em.getTransaction().commit();
		em.close();
		return userId;
	}
	
	public boolean verifyUser(User user)
	{
		boolean checkUser = false;
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		int userId = findUserId(user.getUsername());
		User realUser = em.find(User.class, userId);
		
		if(realUser != null)
		{
			if (user.getPassword().equals(realUser.getPassword()))
				checkUser = true;
		}

		em.getTransaction().commit();
		em.close();
		return checkUser;
	}
	
	public List<Review> getReviewsForUser(String username)
	{
		List<Review> reviews = new ArrayList<Review>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		User user = em.find(User.class, username);
		reviews = user.getReviews();

		em.getTransaction().commit();
		em.close();
		return reviews;
	}
	
	public void updateUser(String username, User user)
	{
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		int userId = findUserId(username);
		User userToUpdate = em.find(User.class, userId);		
		
		userToUpdate.setPassword(user.getPassword());
		userToUpdate.setFirstName(user.getFirstName());
		userToUpdate.setLastName(user.getLastName());
		userToUpdate.setDateOfBirth(user.getDateOfBirth());
		userToUpdate.setEmail(user.getEmail());
		
		em.merge(userToUpdate);

		em.getTransaction().commit();
		em.close();
	}
	
	public void addReviewForMovie(String username, int movieId, Review review)
	{
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(review);
		
		User user = em.find(User.class, username);
		Movie movie = em.find(Movie.class, movieId);
		
		review.setUser(user);
		review.setMovie(movie);
		em.merge(review);
		
		user.getReviews().add(review);
		em.merge(user);
		
		movie.getReviews().add(review);
		em.merge(movie);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public User getUser(int userId)
	{
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		User user = em.find(User.class, userId);
		

		em.getTransaction().commit();
		em.close();
		
		return user;
	}

}
