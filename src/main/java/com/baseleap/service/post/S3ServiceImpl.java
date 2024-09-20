package com.baseleap.service.post;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@Transactional
@RequiredArgsConstructor
public class S3ServiceImpl implements S3Service{
    @Value("${cloud.aws.s3.bucket}")
    private String bucket;

    private final String s3DirName = "postImage/";

    private final AmazonS3Client amazonS3Client;
    @Override
    public List<String> savePostImages(List<MultipartFile> postImages, Long postId) {
        // 변환파일 받아온다.
        List<File> files = convertFile(postImages);
        return uploadFile(files, postId);
    }

    @Override
    public List<String> uploadFile(List<File> uploadFiles, Long postId) {
        List<String> uploadUrl = new ArrayList<>();
        for(File file : uploadFiles){
            if(file != null){
                String fileName =s3DirName + postId +"/"+UUID.randomUUID(); // 길이가 때문에 file.getName()은 빼고 해보자
                uploadUrl.add(uploadS3(file, fileName));
            }else uploadUrl.add(null);
        }
        return uploadUrl;
    }

    @Override
    public String uploadS3(File uploadFile, String fileName) {
        PutObjectRequest request = new PutObjectRequest(bucket, fileName, uploadFile);
        amazonS3Client.putObject(request); // Do not set ACL here
        return amazonS3Client.getUrl(bucket, fileName).toString();
    }

    @Override
    public void removeFile(File targetFile) {

    }

    @Override
    public List<File> convertFile(List<MultipartFile> files) {
        List<File> fileList = new ArrayList<>();
        for(MultipartFile file : files){
            if(file != null && !file.isEmpty()){
                System.out.println("여긴 파일 오리지널네임 ==>> " + file.getOriginalFilename());
                File convertFile = new File("/Users/junghunmok/Desktop/1조/postimage/"+file.getOriginalFilename());
                try{
                    if(convertFile.createNewFile()){
                        try(FileOutputStream fos = new FileOutputStream(convertFile)){
                            fos.write(file.getBytes());
                        }
                    }
                }catch (IOException e){

                }
                fileList.add(convertFile);
            }else{
                fileList.add(null);
            }
        }
        return fileList;
    }

    @Override
    public List<String> updateImage(List<MultipartFile> file, Long postId) {
        deleteBucket(postId);
        List<File> updateImageFiles =  convertFile(file);
        return uploadFile(updateImageFiles, postId);
    }

    @Override
    public void deleteBucket(Long postId){
        ObjectListing objectListing = amazonS3Client.listObjects(bucket,s3DirName + postId);
        for(S3ObjectSummary aa : objectListing.getObjectSummaries()){
            amazonS3Client.deleteObject(bucket, aa.getKey());
        }
    }

}
