package com.epds.epdsorder.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.aspectj.weaver.ast.Instanceof;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException.Unauthorized;
import org.springframework.web.servlet.ModelAndView;

import com.epds.epdsorder.component.EmailDetails;
import com.epds.epdsorder.entity.ERole;
import com.epds.epdsorder.entity.Role;
import com.epds.epdsorder.entity.User;
import com.epds.epdsorder.exception.MapValidationErrorService;
import com.epds.epdsorder.repository.RoleRepository;
import com.epds.epdsorder.repository.UserRepository;
import com.epds.epdsorder.request.LoginRequest;
import com.epds.epdsorder.request.SignupRequest;
import com.epds.epdsorder.service.EmailService;
import com.epds.epdsorder.service.UserDetailsImpl;

import lombok.extern.slf4j.Slf4j;

@CrossOrigin(origins = "http://localhost:8005")
@RestController
@RequestMapping("/api/auth")
@Slf4j
public class AuthController {
	@Autowired
	private AuthenticationManager authenticationManager;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private PasswordEncoder encoder;
	@Autowired
	private ModelMapper mapper;
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private MapValidationErrorService mapValidationErrorService;
	@Autowired
	private EmailDetails emailDetails;
	@Autowired
	private EmailService emailService;

	@SuppressWarnings("unlikely-arg-type")
	@PostMapping("/signin")

	public ModelAndView authenticateUser(@Valid @ModelAttribute("loginRequest") LoginRequest loginRequest,
			HttpServletRequest request, HttpServletResponse response, ModelAndView mv)
			throws IOException, ServletException {
		boolean isNotValid = true;
		String isAuthenticate = "true";
		try {
			Optional<User> findByEmail = this.userRepository.findByEmail(loginRequest.getUsername());
			if (findByEmail != null) {
				Authentication authentication = authenticationManager
						.authenticate(new UsernamePasswordAuthenticationToken(loginRequest.getUsername(),
								loginRequest.getPassword()));
				UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal(); // all user details

				List<String> roles = userDetails.getAuthorities().stream().map(item -> item.getAuthority())
						.collect(Collectors.toList());

				// checkAuthenticateUser.setAuthenticationSecurityContext(authentication,
				// request, response);

				if (roles.get(0) == "ROLE_ADMIN") {
					System.out.println("ADMIN");
					HttpSession session = request.getSession();
					session.setAttribute("auth", authentication);
					session.setAttribute("userid", userDetails.getId());
					isNotValid = false;
					mv.setViewName("redirect:/dashboard");
					return mv;
				}
				if (roles.get(0) == "ROLE_USER") {

					System.out.println("USER");
					mv.setViewName("redirect:/dashboard");
					return mv;

				}

//				if (roles.get(0) == "ROLE_USER") {
//					// Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//					HttpSession session = request.getSession();
//					// session.setAttribute("auth", userDetails.getUsername());
//					session.setAttribute("auth", authentication);
//					session.setAttribute("userid", userDetails.getId());
//					session.setAttribute("username", userDetails.getEmail());
//					log.info("UserName Is ::" + userDetails.getUsername());
//					session.setAttribute("firstname", findByEmail.get().getFirstname());
//					log.info("User Proccess");
//
//					log.info("Get The Image Picture From Session ::" + session.getAttribute("pictures"));
//					// mv.setViewName("My-Account");
//					isNotValid = false;
//					mv.setViewName("redirect:/api/auth/userdashboard");
//					return mv;
//				}	
			}

			else {

				// log.error("Authenticate User Is ::" + authentication2.getPrincipal());
				isAuthenticate = "false";
				mv.addObject("isNotValid", isNotValid);
				mv.addObject("isAuthenticate", isAuthenticate);
				mv.addObject("error", "Invalid UserName Or Password");
				mv.setViewName("redirect:/login");

				return mv;
			}
		} catch (BadCredentialsException e) {

			isNotValid = false;
			isAuthenticate = "false";
			mv.addObject("isAuthenticate", isAuthenticate);
			mv.addObject("isNotValid", isNotValid);
			mv.addObject("error", "Invalid UserName Or Password");
			mv.setViewName("redirect:/login");
			return mv;
		} catch (Unauthorized e) {
			isNotValid = false;
			isAuthenticate = "false";
			mv.addObject("isAuthenticate", isAuthenticate);
			mv.addObject("isNotValid", isNotValid);
			mv.addObject("error", "Invalid UserName Or Password");
			mv.setViewName("redirect:/login");
			return mv;

		} catch (Exception e) {
			isNotValid = false;
			isAuthenticate = "false";
			mv.addObject("isAuthenticate", isAuthenticate);
			mv.addObject("isNotValid", isNotValid);
			mv.addObject("error", "Invalid UserName Or Password");
			mv.setViewName("redirect:/login");
			e.getMessage();
			return mv;
		}
		return mv;
	}

	@PostMapping("/signup")
	public ResponseEntity<?> registerUser(@Valid @RequestBody SignupRequest signUpRequest, BindingResult result) {
		Map<String, String> errors = new HashMap<>();
		ResponseEntity<?> errorMap = mapValidationErrorService.MapValidationService(result);
		if (errorMap != null)
			return errorMap;

		Map<String, Object> body = new HashMap<>();
		System.out.println(" First Name " + signUpRequest.getFirstname());
		/*
		 * if (userRepository.existsByEmail(signUpRequest.getEmail())) {
		 * 
		 * body.put("message", "Your Account is Allready Exists - " +
		 * signUpRequest.getEmail()); body.put("status", "409"); return new
		 * ResponseEntity<>(body, HttpStatus.CONFLICT); }
		 */
		User userEntity = this.mapper.map(signUpRequest, User.class);

		/* == encoded password== */
		String encode = encoder.encode(userEntity.getPassword());
		userEntity.setPassword(encode);
		signUpRequest.setRole(signUpRequest.getRole());
		System.out.println("set Role is :: " + signUpRequest.getRole());
		Set<String> strRoles = signUpRequest.getRole();
		System.out.println(" get Role is :: " + strRoles);
		Set<Role> roles = new HashSet<>();
		System.out.println(" Add Role is :: " + roles);
		if (strRoles == null) {
			Role userRole = roleRepository.findByName(ERole.ROLE_USER)
					.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
			roles.add(userRole);
			System.out.println(" Add Role is :: " + roles);
		} else {
			strRoles.forEach(role -> {
				switch (role) {
				case "admin":
					Role adminRole = roleRepository.findByName(ERole.ROLE_ADMIN)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(adminRole);
					System.out.println(" Add Role is :: " + roles);

					break;
				case "mod":
					Role modRole = roleRepository.findByName(ERole.ROLE_MODERATOR)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(modRole);
					System.out.println(" Add Role is :: " + roles);

					break;
				default:
					Role userRole = roleRepository.findByName(ERole.ROLE_USER)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(userRole);
					System.out.println(" Add Role is :: " + roles);
				}
			});
		}
		userEntity.setRoles(roles);
		userEntity.setFirstname(signUpRequest.getFirstname());
		userEntity.setRegisteron(new Date());
		// userEntity.setUsername(RandomStringValue.getAlphaNumericString());
		User save = userRepository.save(userEntity);
		if (save instanceof User) {
			this.emailDetails.setRecipient(save.getEmail());
			this.emailDetails.setMsgBody("Your Account Is Created");
			this.emailDetails.setSubject("EPDS ACCOUNT");
			String sendSimpleMail = this.emailService.sendSimpleMail(emailDetails);
			body.put("message", sendSimpleMail);
			body.put("status", "200");
			return new ResponseEntity<>(body, HttpStatus.OK);
		}

		// ModelAndView modelAndView = new ModelAndView("api/test/Sign-Up");

		body.put("message", "Your Account Is Created !!");
		body.put("status", "200");

		return new ResponseEntity<>(body, HttpStatus.OK);

	}
}