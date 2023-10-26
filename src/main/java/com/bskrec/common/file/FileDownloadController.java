package com.bskrec.common.file;

import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	//이미지 저장경로
	private static String CURR_IMAGE_REPO_PATH = "C:\\bskrec\\file_repo";
	
	@RequestMapping("/download")
	protected void download(@RequestParam("fileName") String fileName,
							@RequestParam("goods_id") String goods_id,
							HttpServletResponse response) throws Exception{
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH+"\\";
		
		//member_id
	}
}
