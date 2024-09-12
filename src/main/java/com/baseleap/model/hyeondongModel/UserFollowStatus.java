package com.baseleap.model.hyeondongModel;

import lombok.Data;

@Data
public class UserFollowStatus {
    private UserDTO userDTO;
    private boolean isFollow;
}
