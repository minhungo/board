package com.demo.minhun.dao;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import java.io.File;
import java.util.Iterator;
import java.util.UUID;

public class fileUtil {

	public static String updateImg(
			MultipartHttpServletRequest mpRequest) throws Exception{
		
		
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		String memberImg = "";
		
		File file = new File("/img");
		if(file.exists() == false) { 
			file.mkdirs();   //
		}
		
		while(iterator.hasNext()) {
			
			multipartFile = mpRequest.getFile(iterator.next()); 
			
			if(multipartFile.isEmpty() == false) { 
				
				originalFileName = multipartFile.getOriginalFilename(); 
				
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				storedFileName = getRandomString() + originalFileExtension;
				
				file = new File("C:\\workspace-sts-3.9.11.RELEASE\\board\\borad55\\src\\main\\webapp\\resources\\img" + "\\" +  storedFileName); // \img\ + 媛뺤븘吏�  +.png
				
				multipartFile.transferTo(file);
				
				memberImg = storedFileName;

				
				
				System.out.println(memberImg);
				

			}
		}
		return memberImg;
	}
	
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", ""); 
	}
	
	
}
