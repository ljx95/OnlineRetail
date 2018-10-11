package com.shop.mapper;

import com.shop.pojo.BrandOrders;

import java.util.ArrayList;

public interface BrandOrdersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BrandOrders record);

    int insertSelective(BrandOrders record);

    BrandOrders selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BrandOrders record);

    int updateByPrimaryKey(BrandOrders record);

    /*neo*/
    ArrayList<BrandOrders> listAll(BrandOrders brandOrders);

}