package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class MessageDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("Movie");
	
	public boolean createMessage(Message newMessage)
	{
		boolean success = false;
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(newMessage);
		
		em.getTransaction().commit();
		em.close();
		
		
			success = true;
		return success;
	}
	public int findMessageSender(String messagecontent) 
	{
		int messageId = 0;
		List<Message> messages = new ArrayList<Message>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		messages = getAllMessages();
		for (Message message: messages)
		{
			if (message.getReceivername().equals(messagecontent) )
				messageId = message.getId();
		}

		em.getTransaction().commit();
		em.close();
		return messageId;
	}
	public List<Message> getAllMessages()
	{
		List<Message> messages = new ArrayList<Message>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("select m from Message m");
		messages = (List<Message>)query.getResultList();

		em.getTransaction().commit();
		em.close();
		return messages;
	}
}
