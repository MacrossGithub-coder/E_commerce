package org.macross.service;

import org.macross.entity.Page;
import org.macross.entity.apple;
import org.macross.entity.shoppingcart;

import java.util.List;

public interface IQueryGoods {
    List<apple> queryGoodsByPage(Page page);

    apple queryGoodDetailsByg_id(apple apple);

    int addToshoppingCart(shoppingcart shoppingcart);

    List<shoppingcart> QueryShoppingCartByNameServlet(shoppingcart shoppingcart);

    int DeleteGoodsByGidAndUname(shoppingcart shoppingcart);
}
