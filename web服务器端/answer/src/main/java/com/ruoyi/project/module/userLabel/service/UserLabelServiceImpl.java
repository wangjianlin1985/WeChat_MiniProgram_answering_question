package com.ruoyi.project.module.userLabel.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.module.userLabel.mapper.UserLabelMapper;
import com.ruoyi.project.module.userLabel.domain.UserLabel;
import com.ruoyi.project.module.userLabel.service.IUserLabelService;
import com.ruoyi.common.support.Convert;

/**
 * 问题标签 服务层实现
 * 
 * @author hqsun
 * @date 2019-04-02
 */
@Service
public class UserLabelServiceImpl implements IUserLabelService 
{
	@Autowired
	private UserLabelMapper userLabelMapper;

	/**
     * 查询问题标签信息
     * 
     * @param userId 问题标签ID
     * @return 问题标签信息
     */
    @Override
	public UserLabel selectUserLabelById(Integer userId)
	{
	    return userLabelMapper.selectUserLabelById(userId);
	}
	
	/**
     * 查询问题标签列表
     * 
     * @param userLabel 问题标签信息
     * @return 问题标签集合
     */
	@Override
	public List<UserLabel> selectUserLabelList(UserLabel userLabel)
	{
	    return userLabelMapper.selectUserLabelList(userLabel);
	}
	
    /**
     * 新增问题标签
     * 
     * @param userLabel 问题标签信息
     * @return 结果
     */
	@Override
	public int insertUserLabel(UserLabel userLabel)
	{
	    return userLabelMapper.insertUserLabel(userLabel);
	}
	
	/**
     * 修改问题标签
     * 
     * @param userLabel 问题标签信息
     * @return 结果
     */
	@Override
	public int updateUserLabel(UserLabel userLabel)
	{
	    return userLabelMapper.updateUserLabel(userLabel);
	}

	/**
     * 删除问题标签对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteUserLabelByIds(String ids)
	{
		return userLabelMapper.deleteUserLabelByIds(Convert.toStrArray(ids));
	}
	
}
