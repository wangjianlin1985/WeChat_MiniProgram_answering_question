package com.ruoyi.project.system.dept.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 组织表 sys_dept
 * 
 * @author sunhuaquan
 */
public class Dept extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** 组织ID */
	private Long deptId;

	/** 父组织ID */
	private Long parentId;

	/** 祖级列表 */
	private String ancestors;

	/** 组织名称 */
	private String deptName;

	/** 显示顺序 */
	private String orderNum;

	/** 负责人 */
	private String leader;

	/** 联系电话 */
	private String phone;
	/** 邮箱 */
	private String email;

	/** 组织状态:0正常,1停用 */
	private String status;

	/** 删除标志（0代表存在 2代表删除） */
	private String delFlag;

	/** 父组织名称 */
	private String parentName;

	/** 组织类型 */
	private Integer type;

	/** 组织描述 */
	private String remark;

	public Long getDeptId() {
		return deptId;
	}

	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getAncestors() {
		return ancestors;
	}

	public void setAncestors(String ancestors) {
		this.ancestors = ancestors;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * @param remark
	 *            the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Dept [deptId=");
		builder.append(deptId);
		builder.append(", parentId=");
		builder.append(parentId);
		builder.append(", ancestors=");
		builder.append(ancestors);
		builder.append(", deptName=");
		builder.append(deptName);
		builder.append(", orderNum=");
		builder.append(orderNum);
		builder.append(", leader=");
		builder.append(leader);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", email=");
		builder.append(email);
		builder.append(", status=");
		builder.append(status);
		builder.append(", delFlag=");
		builder.append(delFlag);
		builder.append(", parentName=");
		builder.append(parentName);
		builder.append(", type=");
		builder.append(type);
		builder.append(", remark=");
		builder.append(remark);
		builder.append("]");
		return builder.toString();
	}
}
