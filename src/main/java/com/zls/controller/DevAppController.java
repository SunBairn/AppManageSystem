package com.zls.controller;

import com.github.pagehelper.PageInfo;

import com.zls.constant.CommonCodeConstant;
import com.zls.dto.AppInfoDTO;
import com.zls.pojo.AppCategory;
import com.zls.pojo.AppInfo;
import com.zls.pojo.DataDictionary;
import com.zls.pojo.DevUser;
import com.zls.service.AppInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/app")
public class DevAppController {
    @Autowired
    private AppInfoService appInfoServiceImpl;

   /*查询某个用户的所有APP信息*/
    @RequestMapping("/index/devId/{id}")
    /*@PathVariable("id")用于接收并绑定"/index/devId/{id}"上的id*/
    public String index(@PathVariable("id") Long id, Model model, HttpSession session){
        session.setAttribute("USER_ID",id);
        //传一个分页过去
        PageInfo<AppInfo> pageInfo = new PageInfo<>();
        pageInfo.setPageSize(CommonCodeConstant.PAGE_SIZE);
        pageInfo.setPageNum(1);
      /*  查询具体的APP信息，表格里面的信息*/
        pageInfo=appInfoServiceImpl.queryByDevUserId(id,pageInfo);
        //查询所有APP状态信息
        List<DataDictionary> appSatus=appInfoServiceImpl.queryAllAppStatus();
        model.addAttribute("appStatus", appSatus);
        //查询所有APP平台信息
        List<DataDictionary> appFlatform=appInfoServiceImpl.queryAllFlatform();
        model.addAttribute("appFlatform", appFlatform);
        //查询所有一级分类信息
        List<AppCategory> level1= appInfoServiceImpl.queryAllCategoryLevel1();
        model.addAttribute("level1", level1);
        model.addAttribute("page", pageInfo);
        return "app/index";
    }

    //跳转到添加APP信息的页面
    @RequestMapping("/toAdd")
    public String toAdd(HttpSession session,Model model){
        DevUser devUser = (DevUser) session.getAttribute("devUser");
        if (devUser != null) {
            List<DataDictionary> appSatus = appInfoServiceImpl.queryAllAppStatus();
            List<DataDictionary> appFlatform = appInfoServiceImpl.queryAllFlatform();
            List<AppCategory> level1 = appInfoServiceImpl.queryAllCategoryLevel1();
            model.addAttribute("appStatus", appSatus);
            model.addAttribute("appFlatform", appFlatform);
            model.addAttribute("level1", level1);
            return "app/add";
        }
        return "dev/index";
    }

    //处理添加APP信息
    @RequestMapping("/addOne")
    public String addOne(AppInfo appInfo, HttpSession session, Model model) {
        DevUser devUser= (DevUser) session.getAttribute("devUser");
        Long userId =devUser.getId();
        if (userId != null) {
            Boolean flag=appInfoServiceImpl.addOne(appInfo,session);
            model.addAttribute("flag", flag);
            return "forward:/app/toAdd";
        }
        return "dev/index";
    }



    //按照指定要求查询APP的信息
    @RequestMapping("/query")
    public String query(AppInfoDTO appInfoDTO, Model model, HttpSession session){

        Object obj=session.getAttribute("USER_ID");
        if (obj!=null){
            appInfoDTO.setDevUserId((Long) obj);
            PageInfo<AppInfo> pageInfo = appInfoServiceImpl.query(appInfoDTO);
            List<DataDictionary> appSatus=appInfoServiceImpl.queryAllAppStatus();
            List<DataDictionary> appFlatform=appInfoServiceImpl.queryAllFlatform();
            List<AppCategory> level1= appInfoServiceImpl.queryAllCategoryLevel1();
            model.addAttribute("page", pageInfo);
            model.addAttribute("appStatus", appSatus);
            model.addAttribute("appFlatform", appFlatform);
            model.addAttribute("level1", level1);
            return "app/index";
        }else{
            return "redirect:/";
        }
    }
    //查看一个APP的具体信息
    @RequestMapping(value = "/detail/appId/{appId}",method = RequestMethod.GET)
    public String queryOne(@PathVariable("appId") Long id,Model model){
        AppInfo appInfoOne= (AppInfo) appInfoServiceImpl.queryOne(id);
        model.addAttribute("appInfoOne", appInfoOne);
        return "app/detail";
    }

    //去编辑信息
    @RequestMapping("/toEditor/appId/{appId}")
    public String editorOne(@PathVariable("appId") Long id,Model model){
        List<DataDictionary> appSatus=appInfoServiceImpl.queryAllAppStatus();
        List<DataDictionary> appFlatform=appInfoServiceImpl.queryAllFlatform();
        List<AppCategory> level1= appInfoServiceImpl.queryAllCategoryLevel1();
        AppInfo appInfo=appInfoServiceImpl.queryById(id);
        model.addAttribute("appStatus", appSatus);
        model.addAttribute("appFlatform", appFlatform);
        model.addAttribute("level1", level1);
        model.addAttribute("app", appInfo);
        return "app/editor";
    }

    //处理修改的信息并保持
    @RequestMapping("/editor/{appId}")
    public String updateById(@PathVariable("appId") Long appId,AppInfoDTO appInfoDTO,HttpSession session,Model model){
        Long userId = (Long) session.getAttribute("USER_ID");
        Boolean flag = appInfoServiceImpl.updateById(appId,appInfoDTO);
        model.addAttribute("flag", flag);
        return "redirect:/app/index/devId/"+userId;
    }

    //删除信息
    @RequestMapping("/delete/appId/{id}")
    public String deleteOne(@PathVariable("id") Long id, Model model, HttpSession session){
        Long userId= (Long) session.getAttribute("USER_ID");
        Boolean flag=appInfoServiceImpl.deleteOne(id);
        model.addAttribute("flag", flag);
        //跳到其他控制器
        return "redirect:/app/index/devId/"+userId;

    }


    //添加APP



}
