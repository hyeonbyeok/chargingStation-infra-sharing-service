package kr.ac.kopo.charge.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class Uploader<T extends UploadFile> {
	final String uploadPath = "d:/upload/";

	public List<T> makeList(List<MultipartFile> files, Class<T> type) throws Exception {
		List<T> result = new ArrayList<>();
		
		for(MultipartFile file : files) {
			
			if(!file.isEmpty()) {		
				String filename = file.getOriginalFilename(); //파일의 실제 이름을 반환한다.
				String uuid = UUID.randomUUID().toString();	//UUID를 생성하고 UUID가 객체이므로 문자값으로 반환
				
				file.transferTo(new File(uploadPath + uuid + "_" + filename)); //transferTo 파일을 저장
											//전달받은 파일을 위경로의 파일명으로 저장 
				T item = type.getDeclaredConstructor().newInstance();
					//????
				
				item.setFilename(filename); 
				item.setUuid(uuid);
				
				result.add(item);
			}
		}
		
		return result;
	}

}
