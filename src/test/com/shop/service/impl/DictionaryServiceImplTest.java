package com.shop.service.impl;

import com.shop.mapper.DictionaryMapper;
import com.shop.pojo.Dictionary;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class DictionaryServiceImplTest {
    @Autowired
    private DictionaryMapper dictionaryMapper;

    @Test
    public void listAll() {
        List<Dictionary> dictionaryList = dictionaryMapper.listAll(new Dictionary());
        System.out.println(dictionaryList.get(0));
    }
}