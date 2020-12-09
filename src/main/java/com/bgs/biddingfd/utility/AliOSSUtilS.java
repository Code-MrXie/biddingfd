package com.bgs.biddingfd.utility;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.*;

import java.io.*;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/*
 * Created by rayfoo@qq.com Luna on 2020/4/15 23:12
 * Description:阿里云 OSS 文件上传工具类
 * oranName ： 代表用户传过来未经处理的文件名 例如/img/a.jpg
 * objectName : 代表去掉前面/ 加上uuid后的文件名 如img/330ddd7feb6d456f8ee97092d7675c90a.jgp
 * getRealName(objectName) : 指的是存放在OSS中的全路径

 */


public class AliOSSUtilS {

    //AccessKey
    private static String accessKeyId = null;
    //AccessKeySecret
    private static String accessKeySecret = null;
    //Endpoint
    private static String endpoint = null;
    //bucketName
    private static String bucketName = null;

    //静态块
    static {
//        //初始化AccessKey
//        accessKeyId = PropertiesReader.get("accessKeyId");
//        //初始化AccessKeySecret
//        accessKeySecret = PropertiesReader.get("accessKeySecret");
//        //初始化Endpoint
//        endpoint = PropertiesReader.get("endpoint");
//        //初始化bucketName
//        bucketName = PropertiesReader.get("bucket");
        //初始化AccessKey
        accessKeyId = "LTAI4G3SS6a2RZohGusv8wVe";
        //初始化AccessKeySecret
        accessKeySecret = "RIxpOII0Oe8S0XEJ88LrtCf41B9aTF";
        //初始化Endpoint
        endpoint = "oss-cn-beijing.aliyuncs.com";
        //初始化bucketName
        bucketName = "yuxinshi";

    }

    /*私有化构造*/
    private AliOSSUtilS() {

    }

    /*
     * 获取图片的URL头信息
     *
     * @return 返回url头信息*/

    /**
     * 获取图片的URL头信息
     *
     * @return 返回url头信息
     */
    private static String getURLHead() {
        //从哪个位置截取
        int cutPoint = endpoint.lastIndexOf('/') + 1;
        System.out.println(cutPoint);
        //http头
        String head = endpoint.substring(0, cutPoint);      //      截出来的：https://
        System.out.println(head);
        //服务器地址信息
        String tail = endpoint.substring(cutPoint);
        System.out.println(tail);
        //返回结果
        return head + bucketName + "." + tail + "/";        //  https://wtsdsb.oss-cn-beijing.aliyuncs.com/
    }



    /**
     * 通过文件URL反向解析文件名
     *
     * @param fileURL 文件URL
     * @return 原文件名
     */
    private static String getObjectName(String fileURL) {
        return fileURL.substring(getURLHead().length());
    }

    /**
     * 批量获取 objectName
     *
     * @param fileURLs url列表
     * @return objectName列表
     */
    private static List<String> getObjectNames(List<String> fileURLs) {
        //创建返回对象
        List<String> result = null;
        //迭代转换
        for (String item : fileURLs) {
            result.add(item.substring(getURLHead().length()));
        }
        return result;
    }

    /**
     * 获取存储在服务器上的地址
     *
     * @param oranName 文件名
     * @return 文件URL
     */
    private static String getRealName(String oranName) {
        return getURLHead() + oranName;
    }

    /**
     * 打印文件的存储地址
     *
     * @param fileURL 文件URL
     */
    private static void printUploadSuccessInfo(String fileURL) {
        //上传成功
        System.out.println("upload success， path = " + getRealName(fileURL));
    }

    /**
     * 打印文件的存储地址
     *
     * @param fileURL 文件URL
     */
    private static void printDeleteSuccessInfo(String fileURL) {
        //上传成功
        System.out.println("delete success， path = " + getRealName(fileURL));
    }


    /**
     * 获取一个随机的文件名
     *
     * @param oranName 初始的文件名
     * @return 返回加uuid后的文件名
     */
    private static String getRandomImageName(String oranName) {
        //获取一个uuid 去掉-
        String uuid = UUID.randomUUID().toString().replace("-", "");
        //查一下是否带路径
        int cutPoint = oranName.lastIndexOf("/") + 1;
        //如果存在路径
        if (cutPoint != 0) {
            //掐头 如果开头是/ 则去掉
            String head = oranName.indexOf("/") == 0 ? oranName.substring(1, cutPoint) : oranName.substring(0, cutPoint);
            //去尾
            String tail = oranName.substring(cutPoint);
            //返回正确的带路径的图片名称
            return head + uuid + tail;
        }
        //不存在 直接返回
        return uuid + oranName;
    }

    /**
     * 创建一个Bucket，这个参数由参数传入 并非配置文件读取
     *
     * @param bucket BucketName 此处参数名喂Bucket是为了不和buckName冲突
     */
    public static String createBucket(String bucket) {

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        // 创建存储空间。
        ossClient.createBucket(bucket);

        // 关闭OSSClient。
        ossClient.shutdown();

        return bucket;

    }


    /**
     * 根据url获取bucketName
     *
     * @param fileURL 文件的URL
     * @return bucketName
     */
    public static String getBucketName(String fileURL) {
        //前缀
        String prefix = "http://";
        //后缀
        String suffix = ".";
        //截取起始位置
        int beginIndex = fileURL.indexOf(prefix);
        //截取结束位置
        int endIndex = fileURL.indexOf(suffix);
        //如果不是http
        if (beginIndex == -1) {
            prefix = "https://";
            beginIndex = fileURL.indexOf(prefix);
            //如果还是-1 那就是没找到 返回-1即可
            if (beginIndex == -1)
                return null;
        }
        //设置起始位置
        beginIndex = prefix.length();
        //返回bucketName
        return fileURL.substring(beginIndex, endIndex);
    }
//
//    /**
//     * 切换bucket
//     *
//     * @param bucket 新的bucket名称
//     */
//    public static void useBucketName(String bucket) {
//        bucketName = bucket;
//        PropertiesReader.set("Buckets", bucket);
//    }
//
//    /**
//     * 切换bucket
//     *
//     * @param fileURL 根据URL设置新的BucketName
//     */
//    public static void useBucketNameByURL(String fileURL) {
//        PropertiesReader.set("Buckets", getBucketName(fileURL));
//    }

    /**
     * 上传一个文本文件到服务器上
     *
     * @param oranFileName 上传到服务器上的文件路径和名称 文本文件一般以.txt为后缀
     * @param content      上传的内容
     */
    public static String upLoadTextFile(String oranFileName, String content) {

        // <yourObjectName>上传文件到OSS时需要指定包含文件后缀在内的完整路径，例如abc/efg/123.jpg
        String objectName = getRandomImageName(oranFileName);

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        // 上传内容到指定的存储空间（bucketName）并保存为指定的文件名称（objectName）。
        ossClient.putObject(bucketName, objectName, new ByteArrayInputStream(content.getBytes()));

        //上传成功 打印文件存储地址
        printUploadSuccessInfo(objectName);

        // 关闭OSSClient。
        ossClient.shutdown();

        //返回文件在服务器上的全路径+名称
        return getRealName(objectName);
    }


    /**
     * 上传一个byte数组到服务器上
     *
     * @param oranFileName 上传到服务器上的文件路径和名称
     * @param content      上传的内容
     */
    public static String uploadBytesFile(String oranFileName, byte[] content) {

        // <yourObjectName>上传文件到OSS时需要指定包含文件后缀在内的完整路径，例如abc/efg/123.jpg
        String objectName = getRandomImageName(oranFileName);

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        // 上传Byte数组。
        ossClient.putObject(bucketName, objectName, new ByteArrayInputStream(content));

        //上传成功 打印文件存储地址
        printUploadSuccessInfo(objectName);

        // 关闭OSSClient。
        ossClient.shutdown();

        //返回文件在服务器上的全路径+名称
        return getRealName(objectName);
    }

    /**
     * 上传网络流
     *
     * @param oranFileName 上传到服务器上的文件路径和名称
     * @param url          网络上文件的url
     */
    public static String uploadNetworkFlows(String oranFileName, String url) {

        // <yourObjectName>上传文件到OSS时需要指定包含文件后缀在内的完整路径，例如abc/efg/123.jpg
        String objectName = getRandomImageName(oranFileName);

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        try (
                // 上传网络流。
                InputStream inputStream = new URL(url).openStream();) {

            //上传到OSS
            ossClient.putObject(bucketName, objectName, inputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //上传成功 打印文件存储地址
        printUploadSuccessInfo(objectName);

        // 关闭OSSClient。
        ossClient.shutdown();

        //返回文件在服务器上的全路径+名称
        return getRealName(objectName);
    }

    /**
     * 上传文件流
     *
     * @param oranFileName 上传到服务器上的文件路径和名称
     * @param file         来自本地的文件或者文件流
     */
    public static String uploadFileInputSteam(String oranFileName, File file) {

        // <yourObjectName>上传文件到OSS时需要指定包含文件后缀在内的完整路径，例如abc/efg/123.jpg
        String objectName = getRandomImageName(oranFileName);

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        // 上传文件流。
        try (InputStream inputStream = new FileInputStream(file);) {
            //上传到OSS
            ossClient.putObject(bucketName, objectName, inputStream);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //上传成功 打印文件存储地址
        printUploadSuccessInfo(objectName);

        // 关闭OSSClient。
        ossClient.shutdown();

        //返回文件在服务器上的全路径+名称
        return getRealName(objectName);
    }

    /**
     * 上传一个本地文件
     *
     * @param oranFileName  上传到服务器上的名称和路径
     * @param localFileName 需要提供路径和文件名
     */
    public static String uploadLocalFile(String oranFileName, String localFileName) {

        // <yourObjectName>上传文件到OSS时需要指定包含文件后缀在内的完整路径，例如abc/efg/123.jpg
        String objectName = getRandomImageName(oranFileName);

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        // 创建PutObjectRequest对象。
        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, objectName, new File(localFileName));

        // 如果需要上传时设置存储类型与访问权限，请参考以下示例代码。
        // ObjectMetadata metadata = new ObjectMetadata();
        // metadata.setHeader(OSSHeaders.OSS_STORAGE_CLASS, StorageClass.Standard.toString());
        // metadata.setObjectAcl(CannedAccessControlList.Private);
        // putObjectRequest.setMetadata(metadata);

        // 上传文件。
        ossClient.putObject(putObjectRequest);

        //上传成功 打印文件存储地址
        printUploadSuccessInfo(objectName);

        // 关闭OSSClient。
        ossClient.shutdown();

        //返回文件在服务器上的全路径+名称
        return getRealName(objectName);
    }


    /**
     * 删除指定路径下的一个文件
     *
     * @param fileURL 文件的全称
     */
    public static void deleteFile(String fileURL) {

        // 反向解析文件名
        String objectName = getObjectName(fileURL);

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        // 删除文件。如需删除文件夹，请将ObjectName设置为对应的文件夹名称。如果文件夹非空，则需要将文件夹下的所有object删除后才能删除该文件夹。
        ossClient.deleteObject(bucketName, objectName);

        //删除成功 打印文件存储地址
        printDeleteSuccessInfo(fileURL);

        // 关闭OSSClient。
        ossClient.shutdown();
    }

    /**
     * 删除指定路径下的多个文件--该方法未测试
     *
     * @param fileURL 要删除的多个文件的集合
     */
    public static void deleteFile(List<String> fileURL) {

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        // 删除文件。key等同于ObjectName，表示删除OSS文件时需要指定包含文件后缀在内的完整路径，例如abc/efg/123.jpg。
        List<String> keys = new ArrayList<>();
        //批量添加要删除的元素
        for (String item : fileURL) {
            keys.add(getObjectName(item));
        }

        //删除
        DeleteObjectsResult deleteObjectsResult = ossClient.deleteObjects(new DeleteObjectsRequest(bucketName).withKeys(keys));
        List<String> deletedObjects = deleteObjectsResult.getDeletedObjects();

        //批量添加要删除的元素
        for (String item : fileURL) {
            printDeleteSuccessInfo(item);
        }

        // 关闭OSSClient。
        ossClient.shutdown();
    }

    /**
     * 通过文件的URL 判断文件是否存在
     *
     * @param fileURL 文件的URL
     * @return 文件是否存在
     */
    public static boolean exists(String fileURL) {
        // 反向解析文件名
        String objectName = getObjectName(fileURL);
        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
        // 判断文件是否存在。doesObjectExist还有一个参数isOnlyInOSS，如果为true则忽略302重定向或镜像；如果为false，则考虑302重定向或镜像。
        boolean found = ossClient.doesObjectExist(bucketName, objectName);
        // 关闭OSSClient。
        ossClient.shutdown();
        //  返回是否存在
        return found;
    }

    /**
     * 从OSS中下载一个文件
     *
     * @param fileURL       文件的url
     * @param localFileName 下载到本地的文件名称
     */
    public static void downloadFileToLoacal(String fileURL, String localFileName) {

        //将url解析成objectName
        String objectName = getObjectName(fileURL);
        System.out.println(""+"------------------"+objectName);

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        // 下载OSS文件到本地文件。如果指定的本地文件存在会覆盖，不存在则新建。
        ossClient.getObject(new GetObjectRequest(bucketName, objectName), new File(localFileName));

        // 关闭OSSClient。
        ossClient.shutdown();

    }


    /**
     * 以流的方式读取一个文件 并打印
     *
     * @param fileURL 文件的url
     */
    public static StringBuffer downloadStream(String fileURL) {
        //<yourObjectName>表示从OSS下载文件时需要指定包含文件后缀在内的完整路径，例如abc/efg/123.jpg。
        String objectName = getObjectName(fileURL);

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        // ossObject包含文件所在的存储空间名称、文件名称、文件元信息以及一个输入流。
        OSSObject ossObject = ossClient.getObject(bucketName, objectName);

        // 读取文件内容。
        System.out.println("Object content:");

        StringBuffer sb = new StringBuffer();
        //使用try(){}..关闭资源
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(ossObject.getObjectContent()));) {
            //读取
            while (true) {
                String line = reader.readLine();
                if (line == null) break;
                sb.append(line);
                System.out.println("\n" + line);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        // 关闭OSSClient。
        ossClient.shutdown();
        //返回读取到的内容
        return sb;
    }

    /**
     * 以流的方式读取一个云端properties文件的key对应的value 并打印
     *
     * @param fileName 文件的url
     */
//    public static Object getCloudPropertiesGetValue(String fileName, String key) {
//
//        //properties 文件夹的前缀
//        String prefix = "properties/";
//        //properties 文件夹的后缀
//        String suffix = ".properties";
//
//        //<yourObjectName>表示从OSS下载文件时需要指定包含文件后缀在内的完整路径，例如abc/efg/123.jpg。
//        String objectName = prefix + fileName + suffix;
//
//        // 创建OSSClient实例。
//        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
//
//        // ossObject包含文件所在的存储空间名称、文件名称、文件元信息以及一个输入流。
//        OSSObject ossObject = ossClient.getObject(bucketName, objectName);
//
//        // 读取文件内容。
//        System.out.println("Object content:");
//
//        //获取一个Properties对象
//        Properties properties = PropertiesReader.getProperties();
//
//        try (
//                //获取文件流
//                InputStream inputStream = ossObject.getObjectContent();) {
//            properties.load(inputStream);
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//
//        // 关闭OSSClient。
//        ossClient.shutdown();
//        //返回读取到的内容
//        return properties.get(key);
//    }
//
//
}