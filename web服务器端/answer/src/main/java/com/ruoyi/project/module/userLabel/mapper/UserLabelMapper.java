package com.ruoyi.project.module.userLabel.mapper;

import com.ruoyi.project.module.userLabel.domain.UserLabel;
import java.util.List;	

/**
 * 问题标签 数据层
 * 
 * @author hqsun
 * @date 2019-04-02
 */
public interface UserLabelMapper 
{
	/**
     * 查询问题标签信息
     * 
     * @param userId 问题标签ID
     * @return 问题标签信息
     */
	public UserLabel selectUserLabelById(Integer userId);
	
	/**
     * 查询问题标签列表
     * 
     * @param userLabel 问题标签信息
     * @return 问题标签集合
     */
	public List<UserLabel> selectUserLabelList(UserLabel userLabel);
	
	/**
     * 新增问题标签
     * 
     * @param userLabel 问题标签信息
     * @return 结果
     */
	public int insertUserLabel(UserLabel userLabel);
	
	/**
     * 修改问题标签
     * 
     * @param userLabel 问题标签信息
     * @return 结果
     */
	public int updateUserLabel(UserLabel userLabel);
	
	/**
     * 删除问题标签
     * 
     * @param userId 问题标签ID
     * @return 结果
     */
	public int deleteUserLabelById(Integer userId);
	
	/**
     * 批量删除问题标签
     * 
     * @param userIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteUserLabelByIds(String[] userIds);
	
}