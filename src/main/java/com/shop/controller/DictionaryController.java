package com.shop.controller;

import com.github.pagehelper.PageInfo;
import com.shop.pojo.Dictionary;
import com.shop.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("Dictionary")
public class DictionaryController {
    @Autowired
    private DictionaryService dictionaryService;

    @RequestMapping("toList")
    public String toList() {
        return "redirect:/Dictionary/list";
    }

    @RequestMapping("list")
    public String list(Model model, Dictionary dictionary, @RequestParam(required = false, defaultValue = "1") Integer page) {
        List<Dictionary> dictionaryList = dictionaryService.listAll(dictionary, page, 5);
        //用PageInfo包装
        PageInfo pageInfo = new PageInfo(dictionaryList);
        model.addAttribute("pageInfo", pageInfo);
        return "code";
    }

    @RequestMapping("addOrUpdate")
    public String addOrUpdate(Dictionary dictionary) {
        System.out.println(dictionary);
        //id为null则添加
        if (dictionary.getId() == null) {
            dictionaryService.add(dictionary);
        } else {
            //有ID则更新
            dictionaryService.update(dictionary);
        }
        return "redirect:/Dictionary/list";
    }

    @RequestMapping("delete")
    public String delete(Integer id) {
        dictionaryService.delete(id);
        return "redirect:/Dictionary/list";
    }
}
