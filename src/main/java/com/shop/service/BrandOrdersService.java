package com.shop.service;

import com.shop.pojo.BrandOrders;

import java.util.ArrayList;

public interface BrandOrdersService {

    ArrayList<BrandOrders> listAll(BrandOrders brandOrders);

    void shipItem(BrandOrders brandOrders);

    void cancel(BrandOrders brandOrders);
}
