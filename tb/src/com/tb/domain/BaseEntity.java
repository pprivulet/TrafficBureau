package com.tb.domain;

import java.io.Serializable; 
//import java.util.Date;

import javax.persistence.MappedSuperclass;

import org.apache.commons.lang.builder.CompareToBuilder;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

@MappedSuperclass
public abstract class BaseEntity implements Comparable<Object>, Serializable {

	public abstract Integer getId();

	/*
	 * protected Integer createBy;
	 * 
	 * protected Date createDate;
	 * 
	 * protected Integer updateBy;
	 * 
	 * protected Date updateDate;
	 * 
	 * public Integer getCreateBy() { return createBy; }
	 * 
	 * public void setCreateBy(Integer createBy) { this.createBy = createBy; }
	 * 
	 * public Date getCreateDate() { return this.createDate; }
	 * 
	 * public void setCreateDate(Date createDate) { this.createDate =
	 * createDate; }
	 * 
	 * public Integer getUpdateBy() { return updateBy; }
	 * 
	 * public void setUpdateBy(Integer updateBy) { this.updateBy = updateBy; }
	 * 
	 * public Date getUpdateDate() { return this.updateDate; }
	 * 
	 * public void setUpdateDate(Date updateDate) { this.updateDate =
	 * updateDate; }
	 */

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.MULTI_LINE_STYLE);
	}

	public int hashCode() {
		return super.hashCode();
	}

	public int compareTo(Object obj) {
		int compare = -1;

		if (obj == null)
			compare = -1;
		else if (this == obj)
			compare = 0;
		else if (!(obj instanceof BaseEntity))
			compare = -1;
		else if (!this.getClass().equals(obj.getClass()))
			compare = -1;
		else {
			BaseEntity castObj = (BaseEntity) obj;

			CompareToBuilder builder = new CompareToBuilder();

			builder.append(this.getId(), castObj.getId());

			compare = builder.toComparison();
		}

		return compare;
	}

	public boolean equals(Object obj) {
		boolean isEqual = false;

		if (obj == null) {
			isEqual = false;
		} else if (this == obj) {
			isEqual = true;
		} else if (!(obj instanceof BaseEntity)) {
			isEqual = false;
		} else if (!this.getClass().equals(obj.getClass())) {
			isEqual = false;
		} else {
			BaseEntity castObj = (BaseEntity) obj;

			EqualsBuilder builder = new EqualsBuilder();

			builder.append(this.getId(), castObj.getId());

			isEqual = builder.isEquals();
		}

		return isEqual;
	}
}
