package org.macross.mapper;

import org.macross.entity.Page;
import org.macross.entity.User;
import org.macross.entity.apple;
import org.macross.entity.shoppingcart;

import java.util.List;

public interface Mapper {

    int queryUserByNameAndPwd(User user);

    int queryUserByMobilephoneAndPwd(User user);

    int register(User user);

    List<apple> queryGoodsByPage(Page page);

    User queryUserinfoByusername(User user);

    int UpdateUserinfo(User user);

    int UpdateUserinfoWithoutPwd(User user);

    apple queryGoodDetailsByg_id(apple apple);

    int addToshoppingCart(shoppingcart shoppingcart);

    List<shoppingcart> QueryShoppingCartByNameServlet(shoppingcart shoppingcart);

    int DeleteGoodsByGidAndUname(shoppingcart shoppingcart);
}
