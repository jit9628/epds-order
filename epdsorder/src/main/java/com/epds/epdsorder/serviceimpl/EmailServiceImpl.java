package com.epds.epdsorder.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.epds.epdsorder.component.EmailDetails;
import com.epds.epdsorder.service.EmailService;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class EmailServiceImpl implements EmailService {
	@Autowired
	private JavaMailSender javaMailSender ;
	
	@Override
	public String sendSimpleMail(EmailDetails details) {
		// Try block to check for exceptions
		try {
			// Creating a simple mail message
			SimpleMailMessage mailMessage = new SimpleMailMessage();
			// Setting up necessary details
			mailMessage.setFrom("softwaree831@gmail.com");
			mailMessage.setTo(details.getRecipient()); // to email
			mailMessage.setText(details.getMsgBody()); // message body
			mailMessage.setSubject(details.getSubject()); // EPDS ACCOUNT
			
			// Sending the mail
			javaMailSender.send(mailMessage);
			return "Mail Sent Successfully...";
		}
		// Catch block to handle the exceptions
		catch (Exception e) {
			return "Error while Sending Mail" + e.getMessage();
		}
	}
	@Override
	public String sendMailWithAttachment(EmailDetails details) {
		return null;
		
	}
}
