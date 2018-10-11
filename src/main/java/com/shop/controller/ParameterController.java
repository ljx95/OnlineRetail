package com.shop.controller;

import com.github.pagehelper.PageInfo;
import com.shop.pojo.Parameter;
import com.shop.service.ParameterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("Parameter")
public class ParameterController {
    @Autowired
    private ParameterService parameterService;

    @RequestMapping("toList")
    public String toList() {
        return "redirect:/Parameter/list";
    }

    @RequestMapping("list")
    public String list(Model model, Parameter parameter, @RequestParam(required = false, defaultValue = "1") Integer page) {
        List<Parameter> parameterList = parameterService.listAll(parameter, page, 5);
        //用PageInfo包装
        PageInfo pageInfo = new PageInfo(parameterList);
        model.addAttribute("pageInfo", pageInfo);
        return "parameter";
    }

    @RequestMapping("addOrUpdate")
    public String addOrUpdate(Parameter parameter) {
        System.out.println(parameter);
        //id为null则添加
        if (parameter.getId() == null) {
            parameterService.add(parameter);
        } else {
            //有ID则更新
            parameterService.update(parameter);
        }
        return "redirect:/Parameter/list";
    }

    @RequestMapping("delete")
    public String delete(Integer id) {
        parameterService.delete(id);
        return "redirect:/Parameter/list";
    }

}
