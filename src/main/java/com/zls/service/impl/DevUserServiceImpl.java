package com.zls.service.impl;


import com.zls.mapper.DevUserMapper;
import com.zls.pojo.DevUser;
import com.zls.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("devUserService")
public class DevUserServiceImpl implements DevUserService {
    @Autowired
    private DevUserMapper devUserMapper;
    @Override
    public DevUser login(DevUser devUser) {
        List<DevUser> uses = devUserMapper.queryByNamePwd(devUser);
        if (uses!=null&&uses.size()==1){
            return uses.get(0);
        }
        return null;
    }
}
