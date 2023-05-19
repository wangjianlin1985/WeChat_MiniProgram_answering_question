package com.ruoyi.project.system.dept.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.ruoyi.project.system.dept.domain.Dept;

/**
 * 组织管理 数据层
 * 
 * @author sunhuaquan
 */
public interface DeptMapper
{
    /**
     * 查询组织人数
     * 
     * @param dept 组织信息
     * @return 结果
     */
    public int selectDeptCount(Dept dept);

    /**
     * 查询组织是否存在用户
     * 
     * @param deptId 组织ID
     * @return 结果
     */
    public int checkDeptExistUser(Long deptId);

    /**
     * 查询组织管理数据
     * 
     * @param dept 组织信息
     * @return 组织信息集合
     */
    public List<Dept> selectDeptList(Dept dept);

    /**
     * 删除组织管理信息
     * 
     * @param deptId 组织ID
     * @return 结果
     */
    public int deleteDeptById(Long deptId);

    /**
     * 新增组织信息
     * 
     * @param dept 组织信息
     * @return 结果
     */
    public int insertDept(Dept dept);

    /**
     * 修改组织信息
     * 
     * @param dept 组织信息
     * @return 结果
     */
    public int updateDept(Dept dept);

    /**
     * 修改子元素关系
     * 
     * @param depts 子元素
     * @return 结果
     */
    public int updateDeptChildren(@Param("depts") List<Dept> depts);

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
     * @param deptName 组织名称
     * @param parentId 父组织ID
     * @return 结果
     */
    public Dept checkDeptNameUnique(@Param("deptName") String deptName, @Param("parentId") Long parentId);

    /**
     * 根据角色ID查询组织
     *
     * @param roleId 角色ID
     * @return 组织列表
     */
    public List<String> selectRoleDeptTree(Long roleId);
}
