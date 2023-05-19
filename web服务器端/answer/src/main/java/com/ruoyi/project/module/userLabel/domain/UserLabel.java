package com.ruoyi.project.module.userLabel.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.web.domain.BaseEntity;
import java.util.Date;

/**
 * 问题标签表 t_user_label
 * 
 * @author hqsun
 * @date 2019-04-02
 */
public class UserLabel extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 用户编号 */
	private Integer userId;
	/** 标签编号 */
	private Integer dictCode;
	/** 标签 */
	private String dictLabel;
	/** 创建时间 */
	private Date createTime;

	public void setUserId(Integer userId) 
	{
		this.userId = userId;
	}

	public Integer getUserId() 
	{
		return userId;
	}
	public void setDictCode(Integer dictCode) 
	{
		this.dictCode = dictCode;
	}

	public Integer getDictCode() 
	{
		return dictCode;
	}
	public void setDictLabel(String dictLabel) 
	{
		this.dictLabel = dictLabel;
	}

	public String getDictLabel() 
	{
		return dictLabel;
	}
	public void setCreateTime(Date createTime) 
	{
		this.createTime = createTime;
	}

	public Date getCreateTime() 
	{
		return createTime;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userId", getUserId())
            .append("dictCode", getDictCode())
            .append("dictLabel", getDictLabel())
            .append("createTime", getCreateTime())
            .toString();
    }
}
