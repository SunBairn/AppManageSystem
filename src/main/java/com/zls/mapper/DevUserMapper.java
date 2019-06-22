package com.zls.mapper;


import com.zls.pojo.DevUser;

import java.util.List;

public interface DevUserMapper {
    List<DevUser> queryByNamePwd(DevUser devUser);


}