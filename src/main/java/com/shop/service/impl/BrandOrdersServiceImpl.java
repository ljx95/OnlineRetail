package com.shop.service.impl;

import com.shop.mapper.BrandOrdersMapper;
import com.shop.pojo.BrandOrders;
import com.shop.service.BrandOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class BrandOrdersServiceImpl implements BrandOrdersService {
    @Autowired
    private BrandOrdersMapper brandOrdersMapper;

    public ArrayList<BrandOrders> listAll(BrandOrders brandOrders) {
        return brandOrdersMapper.listAll(brandOrders);
    }

    //发货
    public void shipItem(BrandOrders brandOrders) {
        brandOrders.setStatus(3);
        brandOrdersMapper.updateByPrimaryKeySelective(brandOrders);
    }

    //取消
    public void cancel(BrandOrders brandOrders) {
        brandOrders.setStatus(5);
        brandOrdersMapper.updateByPrimaryKeySelective(brandOrders);
    }
}
