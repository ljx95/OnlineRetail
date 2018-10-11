package com.shop.mapper;

import com.shop.pojo.Dictionary;

import java.util.ArrayList;

public interface DictionaryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dictionary record);

    int insertSelective(Dictionary record);

    Dictionary selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dictionary record);

    int updateByPrimaryKey(Dictionary record);

    /*neo*/
    ArrayList<Dictionary> listAll(Dictionary dictionary);
}