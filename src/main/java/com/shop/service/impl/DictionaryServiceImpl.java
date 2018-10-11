package com.shop.service.impl;

import com.github.pagehelper.PageHelper;
import com.shop.mapper.DictionaryMapper;
import com.shop.pojo.Dictionary;
import com.shop.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class DictionaryServiceImpl implements DictionaryService {
    @Autowired
    private DictionaryMapper dictionaryMapper;

    public ArrayList<Dictionary> listAll(Dictionary dictionary, Integer page, Integer pageSize) {
        PageHelper.startPage(page, pageSize);
        return dictionaryMapper.listAll(dictionary);
    }

    public void add(Dictionary dictionary) {
        dictionaryMapper.insert(dictionary);
    }

    public void update(Dictionary dictionary) {
        dictionaryMapper.updateByPrimaryKey(dictionary);
    }

    public void delete(Integer id) {
        dictionaryMapper.deleteByPrimaryKey(id);
    }
}
