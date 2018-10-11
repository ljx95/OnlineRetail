package com.shop.service;

import com.shop.pojo.Parameter;

import java.util.ArrayList;

public interface ParameterService {
    ArrayList<Parameter> listAll(Parameter parameter, Integer page, Integer pageSize);

    //增加
    void add(Parameter parameter);

    //修改
    void update(Parameter parameter);

    //删除
    void delete(Integer id);
}
