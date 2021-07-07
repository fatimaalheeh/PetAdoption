package com.axsos.logandreg.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.axsos.logandreg.models.Category;
import com.axsos.logandreg.models.Pet;
import com.axsos.logandreg.models.User;
import com.axsos.logandreg.repositories.CategoryRepository;
import com.axsos.logandreg.repositories.PetRepository;
import com.axsos.logandreg.repositories.UserRepository;


@Service
public class UserService {
    private final UserRepository userRepository;
    private final PetRepository  petRepository;
    private final CategoryRepository categoryRepo;
    
    @Autowired
    private JavaMailSender jMS;

	public UserService(UserRepository userRepository, PetRepository petRepository, CategoryRepository categoryRepo) {
		this.userRepository = userRepository;
		this.petRepository = petRepository;
		this.categoryRepo = categoryRepo;
	}

	// register user and hash their password
    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepository.save(user);
    }
    
    // find user by email
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    
    // find user by id
    public User findUserById(Long id) {
    	Optional<User> u = userRepository.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
    
    // authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        User user = userRepository.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
            // if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }

    public  User finduser(String email) {
        return userRepository.findByEmail(email);
    }
   
    public Pet createpet(Pet newpet) {
    	System.out.println(newpet.toString());
        return petRepository.save(newpet);
}
   
    public List<Pet> allpets(){
    	return petRepository.findAll();
    }
    public Optional<Pet> findpet(Long id){
    return petRepository.findById(id);
}
    
    public void updatepet(Pet event) {
    	petRepository.save(event);
	
	}
    
    public List<Category> allcategories(){
    	return categoryRepo.findAll();
    }
    
    public Category createcatt(Category newcat) {
        return categoryRepo.save(newcat);
}
    public Category findcategory(Long id){
        return categoryRepo.findById(id).orElse(null);
}
    
    public List<Category> findpetcategory() {
    	return categoryRepo.findAll();
    	
    }
 // for update course 
    public Pet editpet(Pet updpet) {
    	return petRepository.save(updpet);
    	
    }
    
    public  User finduserr(String email) {
        return userRepository.findByEmail(email);
    }


    public void sendingMail(String sendTo, String messageBody, String messageTitle) {
    SimpleMailMessage sMM = new SimpleMailMessage();
    sMM.setFrom("hani.ikhmais@gmail.com");
    sMM.setTo(sendTo);
    sMM.setSubject(messageTitle);
    sMM.setText(messageBody);
    jMS.send(sMM);
}
    public Pet findPetById(Long id) {
    	Optional<Pet> p = petRepository.findById(id);
    	
    	if(p.isPresent()) {
            return p.get();
    	} else {
    	    return null;
    	}
    }

	public void adoptPet(User u, Pet adopetme) {
		 List<Pet> pets=u.getAdoptedpets();
		 System.out.println("in services");
		 adopetme.setAdopter(u);
		 petRepository.save(adopetme);
		 
		
	}
	
	public void delete (Long id) {
	    Optional<Pet> deletepet = findpet(id);
	    Pet y = deletepet.get();
	    petRepository.delete(y);

	}
	
}

