package com.ruoyi.project.module.userLabel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.module.userLabel.domain.UserLabel;
import com.ruoyi.project.module.userLabel.service.IUserLabelService;

/**
 * 问题标签 信息操作处理
 * 
 * @author hqsun
 * @date 2019-04-02
 */
@Controller
@RequestMapping("/module/userLabel")
public class UserLabelController extends BaseController
{
    private String prefix = "module/userLabel";
	
	@Autowired
	private IUserLabelService userLabelService;
	
	@GetMapping()
	public String userLabel()
	{
	    return prefix + "/userLabel";
	}
	
	/**
	 * 查询问题标签列表
	 */
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(UserLabel userLabel)
	{
		startPage();
        List<UserLabel> list = userLabelService.selectUserLabelList(userLabel);
		return getDataTable(list);
	}
	
	/**
	 * 新增问题标签
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存问题标签
	 */
	@Log(title = "问题标签", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(UserLabel userLabel)
	{		
		return toAjax(userLabelService.insertUserLabel(userLabel));
	}

	/**
	 * 修改问题标签
	 */
	@GetMapping("/edit/{userId}")
	public String edit(@PathVariable("userId") Integer userId, ModelMap mmap)
	{
		UserLabel userLabel = userLabelService.selectUserLabelById(userId);
		mmap.put("userLabel", userLabel);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存问题标签
	 */
	@Log(title = "问题标签", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(UserLabel userLabel)
	{		
		return toAjax(userLabelService.updateUserLabel(userLabel));
	}
	
	/**
	 * 删除问题标签
	 */
	@Log(title = "问题标签", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(userLabelService.deleteUserLabelByIds(ids));
	}
	
}
