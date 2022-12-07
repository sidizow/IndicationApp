package com.boots.controller;

import com.boots.entity.Indication;
import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller

public class IndicationController {
    @Autowired
    private UserService userService;

    @GetMapping("/indications")
    public String addNewIndications(Model model) {
        model.addAttribute("indicationModel", new Indication());
        model.addAttribute("lastIndication",userService.getLastIndication());
        model.addAttribute("lastSendDate",userService.getLastSendDate());
        return "indications";
    }

    @PostMapping("/indications")
    public String saveIndication(@ModelAttribute("indicationModel") @Valid Indication indicationModel,
                                 BindingResult bindingResult, Model model) {

        if((indicationModel.getIndication() instanceof Integer) == false){
            model.addAttribute("errorString","Введите число");
            return "indications";
        }

        if(bindingResult.hasErrors()){
            return "indications";
        }

        userService.saveIndication(indicationModel);
        return "redirect:/indications";
    }

}
