package com.shop.mapper;

import com.shop.pojo.Parameter;

import java.util.ArrayList;

public interface ParameterMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Parameter record);

    int insertSelective(Parameter record);

    Parameter selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Parameter record);

    int updateByPrimaryKey(Parameter record);

    /*neo*/
    ArrayList<Parameter> listAll(Parameter parameter);
}