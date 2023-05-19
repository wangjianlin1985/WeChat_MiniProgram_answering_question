package com.ruoyi.project.system.dept.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.project.system.dept.domain.Dept;
import com.ruoyi.project.system.role.domain.Role;

/**
 * 组织管理 服务层
 * 
 * @author sunhuaquan
 */
public interface IDeptService
{
    /**
     * 查询组织管理数据
     * 
     * @param dept 组织信息
     * @return 组织信息集合
     */
    public List<Dept> selectDeptList(Dept dept);

    /**
     * 查询组织管理树
     * 
     * @return 所有组织信息
     */
    public List<Map<String, Object>> selectDeptTree();

    /**
     * 根据角色ID查询菜单
     *
     * @param role 角色对象
     * @return 菜单列表
     */
    public List<Map<String, Object>> roleDeptTreeData(Role role);

    /**
     * 查询组织人数
     * 
     * @param parentId 父组织ID
     * @return 结果
     */
    public int selectDeptCount(Long parentId);

    /**
     * 查询组织是否存在用户
     * 
     * @param deptId 组织ID
     * @return 结果 true 存在 false 不存在
     */
    public boolean checkDeptExistUser(Long deptId);

    /**
     * 删除组织管理信息
     * 
     * @param deptId 组织ID
     * @return 结果
     */
    public int deleteDeptById(Long deptId);

    /**
     * 新增保存组织信息
     * 
     * @param dept 组织信息
     * @return 结果
     */
    public int insertDept(Dept dept);

    /**
     * 修改保存组织信息
     * 
     * @param dept 组织信息
     * @return 结果
     */
    public int updateDept(Dept dept);

    /**
     * 根据组织ID查询信息
     * 
     * @param deptId 组织ID
     * @return 组织信息
     */
    public Dept selectDeptById(Long deptId);

    /**
     * 校验组织名称是否唯一
     * 
     * @param dept 组织信息
     * @return 结果
     */
    public String checkDeptNameUnique(Dept dept);
}
