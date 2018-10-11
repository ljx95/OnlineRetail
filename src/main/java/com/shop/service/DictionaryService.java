package com.shop.service;

import com.shop.pojo.Dictionary;

import java.util.ArrayList;

public interface DictionaryService {
    ArrayList<Dictionary> listAll(Dictionary dictionary, Integer page, Integer pageSize);

    //增加
    void add(Dictionary dictionary);

    //修改
    void update(Dictionary dictionary);

    //删除
    void delete(Integer id);
}
