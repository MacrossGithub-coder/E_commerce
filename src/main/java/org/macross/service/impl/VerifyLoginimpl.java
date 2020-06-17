package org.macross.service.impl;

import org.macross.entity.Page;
import org.macross.entity.User;
import org.macross.entity.apple;
import org.macross.mapper.Mapper;
import org.macross.service.IVerifyLogin;

import java.util.List;

public class VerifyLoginimpl implements IVerifyLogin {
    Mapper Mapper;

    public void setMapper(Mapper Mapper) {
        this.Mapper = Mapper;
    }


    @Override
    public int userLoginWithName(User user) {
        return Mapper.queryUserByNameAndPwd(user);
    }

    @Override
    public int userLoginWithMobilephone(User user) {
        return Mapper.queryUserByMobilephoneAndPwd(user);
    }

    @Override
    public int register(User user) {return Mapper.register(user); }

    @Override
    public User queryUserinfoByusername(User user) {return Mapper.queryUserinfoByusername(user);}

    @Override
    public int updateUserinfoByusername(User user) {
        return Mapper.UpdateUserinfo(user);
    }

    @Override
    public int UpdateUserinfoWithoutPwd(User user) {
        return Mapper.UpdateUserinfoWithoutPwd(user);
    }


}

