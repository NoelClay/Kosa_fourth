package com.baseleap.service.post;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface S3Service{
     List<String> savePostImages(List<MultipartFile> postImages, Long postId);
     List<String> uploadFile(List<File> uploadFile, Long postId);
     String uploadS3(File uploadFile, String fileName);
     void removeFile(File targetFile);
     List<File> convertFile(List<MultipartFile> file);
     List<String> updateImage(List<MultipartFile> fileName, Long postId);
     void deleteBucket(Long postId);
}


