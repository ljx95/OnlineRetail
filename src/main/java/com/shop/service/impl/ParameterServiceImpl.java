package com.shop.service.impl;

import com.github.pagehelper.PageHelper;
import com.shop.mapper.ParameterMapper;
import com.shop.pojo.Parameter;
import com.shop.service.ParameterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class ParameterServiceImpl implements ParameterService {
    @Autowired
    private ParameterMapper parameterMapper;

    public ArrayList<Parameter> listAll(Parameter parameter, Integer page, Integer pageSize) {
        PageHelper.startPage(page, pageSize);
        return parameterMapper.listAll(parameter);
    }

    public void add(Parameter parameter) {
        parameterMapper.insert(parameter);
    }

    public void update(Parameter parameter) {
        parameterMapper.updateByPrimaryKey(parameter);
    }

    public void delete(Integer id) {
        parameterMapper.deleteByPrimaryKey(id);
    }
}
