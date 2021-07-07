package com.axsos.logandreg.controllers;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.axsos.logandreg.models.Category;
import com.axsos.logandreg.models.Pet;
import com.axsos.logandreg.models.User;
import com.axsos.logandreg.services.UserService;
import com.axsos.logandreg.validation.UserValidator;


@Controller
public class UserController {
	private final UserService userService;
	private final UserValidator userValidator;

	public UserController(UserService userService, UserValidator userValidator) {
		this.userService = userService;
		this.userValidator = userValidator;
	}

	@RequestMapping("")
	public String registerForm(@ModelAttribute("user") User user) {
		return "home.jsp";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
			HttpSession session) {
		userValidator.validate(user, result);

		if (result.hasErrors())
			return "home.jsp";
		if (userService.findByEmail(user.getEmail()) != null) {
			model.addAttribute("error", "This email already exist!!");
			return "home.jsp";
		}
		userService.registerUser(user);
		return "redirect:/";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginUser(@ModelAttribute("user") User user, @RequestParam("email") String email,
			@RequestParam("password") String password, Model model, HttpSession session) {
		if (userService.authenticateUser(email, password)) {
			session.setAttribute("userId", userService.findByEmail(email).getId());
			return "redirect:/home";
		} else {
			model.addAttribute("error", "Invalid User name or Password");
			return "home.jsp";
		}
	}

	// for second page
	@RequestMapping("/home")
	public String home(HttpSession session, Model model) {
		// get user from session, save them in the model and return the home page
		if (session.getAttribute("userId") == null)
			return "redirect:/";
		Long Id = (Long) session.getAttribute("userId");
		User u = userService.findUserById(Id);
		model.addAttribute("user", u);
		model.addAttribute("listofpets", userService.allpets());
		return "welcome.jsp";

	}

	// logout
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		// invalidate session
		// redirect to login page
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/profile/{id}")
	public String profile(@PathVariable("id") Long Id, Model model, HttpSession session) {
		if (session.getAttribute("userId") != null) {
			Long idd = (Long) session.getAttribute("userId");
			User user1 = userService.findUserById(idd);
			model.addAttribute("user", user1);
			return "profile.jsp";
			
		}
		return "redirect:/home";

	}
	
	
//	
//	@RequestMapping("/addpet")
//	public String createPet( @ModelAttribute("pet") Pet pet, Model model , HttpSession session) {
//		Long Id = (Long) session.getAttribute("userId");
//		User u = userService.findUserById(Id);		
//		model.addAttribute("categories", userService.allcategories() );
//		
//		return "add.jsp";
//		
//	}
	@RequestMapping("/pet/new")
	public String addPetPage(@ModelAttribute("pet") Pet pet, Model model,HttpSession session) {
		List<Category> cat= userService.allcategories();
		Long Id = (Long) session.getAttribute("userId");
		User u = userService.findUserById(Id);	
		model.addAttribute( "categories", cat);
		model.addAttribute("creator", u);
		return "add.jsp";
	}
	
	@PostMapping("/pet/new")
    public String addpet( @Valid @ModelAttribute("pet") Pet pet, BindingResult result,Model model , HttpSession session) {
		Long Id = (Long) session.getAttribute("userId");
		User u = userService.findUserById(Id);
		if(result.hasErrors()){
            return "add.jsp";

        }
        else {
        	System.out.println(pet.toString());
 
        	userService.createpet(pet);
    
            return "redirect:/home";
        }
   
	}
	@RequestMapping("/pet/{id}")
	public String updatepet(@PathVariable("id") Long id,@Valid @ModelAttribute("pet") Pet pet, BindingResult result,Model model , HttpSession session) {
		model.addAttribute("pet",userService.findpet(id));

		return "add.jsp";
		
	}
	@PutMapping("/pet/{id}")
	public String editpet(@Valid @ModelAttribute("pet") Pet pet, BindingResult result,Model model , HttpSession session) {
		
			
			userService.updatepet(pet);
			return "redirect:/home"; 
		}
	
	
	
	
	@RequestMapping("/contact")
	public String contact() {
		
		return "contact.jsp";
		
	}
	

	
		//Adding Category
		@RequestMapping("/category")
		public String createCat(@Valid @ModelAttribute("cat") Category cat, BindingResult result,Model model , HttpSession session) {
			Long Id = (Long) session.getAttribute("userId");
			User u = userService.findUserById(Id);		
			return "addcat.jsp";
			
		}
		
		@PostMapping("/category/new")
	    public String addcat( @Valid @ModelAttribute("cat") Category cat, BindingResult result,Model model , HttpSession session) {
			Long Id = (Long) session.getAttribute("userId");
			User u = userService.findUserById(Id);
			if(result.hasErrors()){
	            return "addcat.jsp";
	        }
	        else {
	        	userService.createcatt(cat);
	            return "redirect:/home";
	        }
			
			
			
			
		}
		
		@RequestMapping("/category/{id}")
	    public String show(@PathVariable("id") Long id, Model model){
	        Category category = userService.findcategory(id);
	        model.addAttribute("category",category);
	        return "category.jsp";
	    }
		

		
		

		@PutMapping("/adoptme")
		public String adoptme() {
		
				return "redirect:/category"; 
			}	
		  @RequestMapping("/Pet/{id}/edit")
		    public String editcourse (@PathVariable("id")Long Id,Model model,Pet U) {
					model.addAttribute("pet",userService.editpet(U));
					model.addAttribute("user",userService.findpet(Id));

					return "edit.jsp";

				}
		    @PutMapping("/pet/{id}/edit")
		    public String update(@Valid @ModelAttribute("pet") Pet pets) {
				
		        	userService.editpet(pets);
		        	
		            return "redirect:/profile.jsp";
		        }
		    
		    @RequestMapping("/detailes/{id}")
		    public String deatieles(@PathVariable("id")Long Id,Model model) {
		    	model.addAttribute("pet", userService.findpet(Id));
		    	return "detailes.jsp";
		    }

		    @RequestMapping("/sendmail/{mailTo}")
		    public String sendEmail(@PathVariable("mailTo") String reciever) {
		        String message = " Thank you for using our website. \n your pet adoption is reserved ";
		        System.out.println("sending new mail to... "+reciever+message);
		        userService.sendingMail(reciever, message, "Save a Soul");
		        return "redirect:/home";
		    }
		    @PostMapping("/pet/{id}")
		    public String adoptme(@PathVariable("id")Long petID, HttpSession session  ) {
		    	System.out.println("test1");
		    	Pet adopetme = userService.findPetById(petID);
		    	System.out.println("test2");
		    	Long Id = (Long) session.getAttribute("userId");
		    	System.out.println("test3");
				User u = userService.findUserById(Id);
				System.out.println("test4");
				userService.adoptPet(u,adopetme);
				String message = " Thank you for using our website. \n your pet adoption is reserved ";
		        userService.sendingMail(u.getEmail(), message, "Save a Soul");
		        return "redirect:/home";
				
		    }
	
		    
		    @RequestMapping("/delete/{id}")
            public String update(@PathVariable("id")Long Id) {

                    userService.delete(Id);

                    return "redirect:/home";
                }
}

