package com.skycat.fileupload;

import java.io.File;

import org.junit.Test;

import com.skycat.utils.FileUploadUtil;

public class TestFileUpload {
	@Test
	public void test() {
		File file = new File("src/main/resources/spring-mybatis.xml");
		// 大图路径写法
		 FileUploadUtil.uploadImage(file, "big/spring.xml");
		// 缩略图路径写法
		// FileUploadUtil.uploadImage(file, "small/spring.xml");
		// 评价图片路径写法
		// FileUploadUtil.uploadImage(file, "comment/spring.xml");
		 
		/*
		 * 访问路径写法：
		 * https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/(big/small/comment)/文件名 
		 */
	}
}
