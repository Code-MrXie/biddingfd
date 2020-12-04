package com.bgs.biddingfd.utility;

import com.aliyun.oss.*;
import com.aliyun.oss.model.*;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * @author 小毕
 * @desc 阿里云oss工具类
 **/

public class AliyunOSSUtil {
    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(com.bgs.biddingfd.utility.AliyunOSSUtil.class);

    public static String upload(File file) {
        logger.info("=========>OSS文件上传开始：" + file.getName());
        String endpoint = OSSProperties.ALIYUN_ENDPOINT;
        String accessKeyId = OSSProperties.ALIYUN_ACCESS_ID;
        String accessKeySecret = OSSProperties.ALIYUN_ACCESS_KEY;
        String bucketName = OSSProperties.ALIYUN_BUCKET;

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        if (null == file) {
            return null;
        }
        //创建一个服务器
        OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);

        ClientConfiguration clientConfiguration = new ClientConfiguration();
        /**
         * 连接超时时间为100秒
         */
        clientConfiguration.setConnectionTimeout(100000);
        try {
            //容器不存在，就创建
            if (!ossClient.doesBucketExist(bucketName)) {
                ossClient.createBucket(bucketName);
                CreateBucketRequest createBucketRequest = new CreateBucketRequest(bucketName);
                createBucketRequest.setCannedACL(CannedAccessControlList.PublicRead);
                ossClient.createBucket(createBucketRequest);
            }
            //创建文件路径..
            String fileUrl = "img/" + (UUID.randomUUID().toString().replace("-", "") + "-" + file.getName());
            //上传文件
            PutObjectResult result = ossClient.putObject(new PutObjectRequest(bucketName, fileUrl, file));

            //拉去文件------------------------------------------------------
            Date expiration = new Date(new Date().getTime() + 10* 365 * 24 * 60 * 60 * 1000);
           GeneratePresignedUrlRequest req = new GeneratePresignedUrlRequest(bucketName,fileUrl,HttpMethod.GET);
            req.setExpiration(expiration);
            URL url = ossClient.generatePresignedUrl(req);
            System.out.println("url----------"+url);
            //---------------------------------------------------------------------------
        /*    //设置权限 这里是公开读
            ossClient.setBucketAcl(bucketName,CannedAccessControlList.PublicRead);*/
            if (null != result) {
                logger.info("==========>OSS文件上传成功,OSS地址：" + ""+fileUrl);
                file.delete();
//                return "https://yuxinshi.oss-cn-beijing.aliyuncs.com/"+fileUrl;
                return  fileUrl;
            }
        } catch (OSSException oe) {
            logger.error(oe.getMessage());
        } catch (ClientException ce) {
            logger.error(ce.getMessage());
        } finally {
            //关闭
            ossClient.shutdown();
        }
        return null;
    }
}

