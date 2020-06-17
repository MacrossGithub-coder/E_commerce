package org.macross.service;

import org.macross.entity.User;


public interface IVerifyLogin {

    int userLoginWithName(User user);

    int userLoginWithMobilephone(User user);

    int register(User user);

    User queryUserinfoByusername(User user);

    int updateUserinfoByusername(User user);

    int UpdateUserinfoWithoutPwd(User user);
}
