package com.shop.controller;

import com.shop.pojo.BrandOrders;
import com.shop.service.BrandOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("BrandOrders")
public class BrandOrdersController {
    @Autowired
    private BrandOrdersService brandOrdersService;

    @RequestMapping("list")
    public String toBrandorderlist(Model model, BrandOrders brandOrders) {
        List<BrandOrders> awaitingPaymentList = new ArrayList<BrandOrders>();
        List<BrandOrders> awaitingShipmentList = new ArrayList<BrandOrders>();
        List<BrandOrders> shippedList = new ArrayList<BrandOrders>();
        List<BrandOrders> completeList = new ArrayList<BrandOrders>();
        List<BrandOrders> canceledList = new ArrayList<BrandOrders>();

        List<BrandOrders> brandOrdersList = brandOrdersService.listAll(brandOrders);
        for (BrandOrders bo : brandOrdersList) {
            switch (bo.getStatus()) {
                case 1:
                    awaitingPaymentList.add(bo);
                    break;
                case 2:
                    awaitingShipmentList.add(bo);
                    break;
                case 3:
                    shippedList.add(bo);
                    break;
                case 4:
                    completeList.add(bo);
                    break;
                case 5:
                    canceledList.add(bo);
                    break;
                default:
                    System.out.println("错误的status:" + bo.getStatus());
            }
        }

        model.addAttribute("brandOrdersList", brandOrdersList);
        model.addAttribute("awaitingPaymentList", awaitingPaymentList);
        model.addAttribute("awaitingShipmentList", awaitingShipmentList);
        model.addAttribute("shippedList", shippedList);
        model.addAttribute("completeList", completeList);
        model.addAttribute("canceledList", canceledList);

        return "brand-orderlist";
    }

    @RequestMapping("shipItem")
    public String shipItem(BrandOrders brandOrders) {
        brandOrdersService.shipItem(brandOrders);
        return "redirect:/BrandOrders/list";
    }

    @RequestMapping("cancel")
    public String cancel(BrandOrders brandOrders) {
        brandOrdersService.cancel(brandOrders);
        return "redirect:/BrandOrders/list";
    }
}
