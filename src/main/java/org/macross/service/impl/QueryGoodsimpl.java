package org.macross.service.impl;

import org.macross.entity.Page;
import org.macross.entity.apple;
import org.macross.entity.shoppingcart;
import org.macross.mapper.Mapper;
import org.macross.service.IQueryGoods;

import java.util.List;

public class QueryGoodsimpl implements IQueryGoods {
    Mapper Mapper;

    public void setMapper(Mapper Mapper) {
        this.Mapper = Mapper;
    }

    @Override
    public List<apple> queryGoodsByPage(Page page) {
        return Mapper.queryGoodsByPage(page);
    }

    @Override
    public apple queryGoodDetailsByg_id(apple apple) {
        return Mapper.queryGoodDetailsByg_id(apple);
    }

    @Override
    public int addToshoppingCart(shoppingcart shoppingcart) {
        return Mapper.addToshoppingCart(shoppingcart);
    }

    @Override
    public List<shoppingcart> QueryShoppingCartByNameServlet(shoppingcart shoppingcart) {
        return Mapper.QueryShoppingCartByNameServlet(shoppingcart);
    }

    @Override
    public int DeleteGoodsByGidAndUname(shoppingcart shoppingcart) {
        return Mapper.DeleteGoodsByGidAndUname(shoppingcart);
    }
}
