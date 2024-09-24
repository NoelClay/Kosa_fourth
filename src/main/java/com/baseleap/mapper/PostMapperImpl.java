package com.baseleap.mapper;

import com.baseleap.common.util.DataAccessException;
import com.baseleap.model.post.*;
import com.baseleap.service.post.port.PostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.List;

@RequiredArgsConstructor
@Repository
public class PostMapperImpl implements PostRepository {
    private final PostMapper postMapper;

    @Override
    public int insert(Post post){
        try{
            return postMapper.insert(post);
        }catch (Exception e){
            throw new DataAccessException("postinsert");
        }
    }

    @Override
    public PostFindOneModel findOne(Long postId, Long userId) {
        try{
            return postMapper.findOneById(postId, userId);
        }catch (Exception e){
            throw new DataAccessException("postFindOne");
        }

    }

    @Override
    public int update(PostUpdateModel postUpdateModel) {
        try{
            return postMapper.update(postUpdateModel);
        }catch (Exception e){
            throw new DataAccessException("postUpdate");
        }


    }

    @Override
    public List<PostListModel> findAll(List<Long> ids) {
        return postMapper.findAll(ids);

    }

    @Override
    public List<Long> postIds(int size, Long offset, Long homePageId) {
        return postMapper.ids(size, offset, homePageId);
    }

    @Override
    public int countByUserId(Long userId) {
        return postMapper.countByUserId(userId);

    }

    @Override
    public int delete(Long postId) {
       try{
           return postMapper.delete(postId);
       }catch (Exception e){
           throw new DataAccessException("postDelete");
       }

    }
}
