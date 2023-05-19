package com.ruoyi.project.system.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.ruoyi.framework.config.RuoYiConfig;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.project.system.menu.domain.Menu;
import com.ruoyi.project.system.menu.service.IMenuService;
import com.ruoyi.project.system.role.domain.Role;
import com.ruoyi.project.system.user.domain.User;

/**
 * 首页 业务处理
 * 
 * @author sunhuaquan
 */
@Controller
public class IndexController extends BaseController
{
    @Autowired
    private IMenuService menuService;

    @Autowired
    private RuoYiConfig ruoYiConfig;

    // 系统首页
    @GetMapping("/index")
    public String index(ModelMap mmap)
    {
        // 取身份信息
        User user = getUser();
        // 根据用户id取出菜单
        List<Menu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        mmap.put("copyrightYear", ruoYiConfig.getCopyrightYear());
        return "index";
    }

    // 系统介绍
    @GetMapping("/system/main")
    public String main(ModelMap mmap)
    {
        mmap.put("version", ruoYiConfig.getVersion());
        // 取身份信息
        User user = getUser();
        List<Role> roles = user.getRoles();
        if (roles != null && roles.size() > 0)
        {
            Role role = roles.get(0);
            String roleKey = role.getRoleKey();
            if ("doctor".equals(roleKey))
            {
                mmap.put("patientId", null);
                mmap.put("physicianId", user.getUserId());
                return "module/medicalRecords/medicalRecords";
            }
            else if ("reception".equals(roleKey))
            {
            	mmap.put("status", 1);
                return "module/medicineBill/medicineBill";
            }
            else if ("accountant".equals(roleKey))
            {
                return "main";
            }
            else if ("admin".equals(roleKey))
            {
                return "main";
            }
        }

        return "main";
    }
}
