package com.shop.service.impl;

import com.shop.mapper.BrandInfoMapper;
import com.shop.pojo.BrandInfo;
import com.shop.service.BrandInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BrandInfoServiceImpl implements BrandInfoService {

    @Autowired
    private BrandInfoMapper brandInfoMapper;

    public void add(BrandInfo brandInfo) {
        brandInfoMapper.insertSelective(brandInfo);
    }

}
