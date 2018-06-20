package com.skycat.utils;

import java.io.File;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.region.Region;

public class FileUploadUtil {
	public static void uploadImage(File src, String desFileName) {
		// 1 初始化用户身份信息(secretId, secretKey)
		COSCredentials cred = new BasicCOSCredentials("AKIDxkIbgXYWfZEhvvtIhspX0FFD1bw5mjDV",
				"B6k8H9m9G7h27wUmlV4RYP0KODl38yYs");
		// 2 设置bucket的区域, COS地域的简称请参照
		// https://cloud.tencent.com/document/product/436/6224
		ClientConfig clientConfig = new ClientConfig(new Region("ap-guangzhou"));
		// 3 生成cos客户端
		COSClient cosclient = new COSClient(cred, clientConfig);
		// bucket的命名规则为{name}-{appid} ，此处填写的存储桶名称必须为此格式
		String bucketName = "skycat-1251718931";

		// 简单文件上传, 最大支持 5 GB, 适用于小文件上传, 建议 20 M 以下的文件使用该接口
		// 大文件上传请参照 API 文档高级 API 上传
		File localFile = src;
		// 指定要上传到 COS 上的路径
		String key = "/upload/" + desFileName;
		PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, localFile);
		PutObjectResult putObjectResult = cosclient.putObject(putObjectRequest);
	}
}
