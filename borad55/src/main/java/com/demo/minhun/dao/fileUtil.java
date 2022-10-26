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
		if(file.exists() == false) {  // file 媛앹껜媛� 鍮꾩뼱�엳�뒗媛�? false �씪硫� 利� �뙆�씪�씠 �엳�떎硫�
			file.mkdirs();   // �뵒�젆�넗由� �깮�꽦 �뙆�씪�쓣 �뾽濡쒕뱶 �븯�뒗 怨쇱젙�씤�벏
		}
		
		while(iterator.hasNext()) {
			
			multipartFile = mpRequest.getFile(iterator.next()); // multipartFile�뿉 �뱾怨좎삩 �뙆�씪�쓣 �떞�븘以�
			
			if(multipartFile.isEmpty() == false) { // multipartFile�씠 鍮꾩뿀�뒗媛�? false 利� �뙆�씪�씠 �엳�떎硫�
				
				originalFileName = multipartFile.getOriginalFilename(); // �삱由� �뙆�씪�쓽 �씠由꾩쓣 �떞�븘以� ( 媛뺤븘吏�.png )
				
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				// �썝蹂� �뙆�씪 �솗�옣�옄瑜� �떞�븘�샂 .源뚯� �옄瑜대뒗 subString�쓣 �벐怨� �삁�떆濡� , 媛뺤븘吏�.png 媛� �엳�쑝硫� .源뚯� �옒�씪�꽌 .png�씪�뒗 �솗�옣�옄 紐낆쓣 諛쏆븘以�
				
				storedFileName = getRandomString() + originalFileExtension;
				
				file = new File("C:\\workspace-sts-3.9.11.RELEASE\\borad55\\src\\main\\webapp\\resources\\img" + "\\" +  storedFileName); // \img\ + 媛뺤븘吏�  +.png
				
				multipartFile.transferTo(file); // transferTo??
				
				memberImg = storedFileName;

				
				
				System.out.println(memberImg);
				

			}
		}
		return memberImg;
	}
	
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", ""); // UUID 濡� 以묐났諛⑹� �뙆�씪�씠由� �꽕�젙
	}
	
	
}
