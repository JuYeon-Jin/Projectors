package com.projectors.mvc;

public class RecruitDTO
{
	private int regionNo, subRegionNo, posNo, toolNo;
	private String regionName, subRegionName, posName, toolName;
	private int countAll, countPos;
	private String recruitNo, pinNo, deadlineDate, dDay, prjStart, prjEnd, title, content;
	
	
	// getter / setter
	public int getRegionNo()
	{
		return regionNo;
	}
	public void setRegionNo(int regionNo)
	{
		this.regionNo = regionNo;
	}
	public int getSubRegionNo()
	{
		return subRegionNo;
	}
	public void setSubRegionNo(int subRegionNo)
	{
		this.subRegionNo = subRegionNo;
	}
	public int getPosNo()
	{
		return posNo;
	}
	public void setPosNo(int posNo)
	{
		this.posNo = posNo;
	}
	public int getToolNo()
	{
		return toolNo;
	}
	public void setToolNo(int toolNo)
	{
		this.toolNo = toolNo;
	}
	public String getRegionName()
	{
		return regionName;
	}
	public void setRegionName(String regionName)
	{
		this.regionName = regionName;
	}
	public String getSubRegionName()
	{
		return subRegionName;
	}
	public void setSubRegionName(String subRegionName)
	{
		this.subRegionName = subRegionName;
	}
	public String getPosName()
	{
		return posName;
	}
	public void setPosName(String posName)
	{
		this.posName = posName;
	}
	public String getToolName()
	{
		return toolName;
	}
	public void setToolName(String toolName)
	{
		this.toolName = toolName;
	}
	public int getCountAll()
	{
		return countAll;
	}
	public void setCountAll(int countAll)
	{
		this.countAll = countAll;
	}
	public int getCountPos()
	{
		return countPos;
	}
	public void setCountPos(int countPos)
	{
		this.countPos = countPos;
	}
	public String getRecruitNo()
	{
		return recruitNo;
	}
	public void setRecruitNo(String recruitNo)
	{
		this.recruitNo = recruitNo;
	}
	public String getPinNo()
	{
		return pinNo;
	}
	public void setPinNo(String pinNo)
	{
		this.pinNo = pinNo;
	}
	public String getDeadlineDate()
	{
		return deadlineDate;
	}
	public void setDeadlineDate(String deadlineDate)
	{
		this.deadlineDate = deadlineDate;
	}
	public String getdDay()
	{
		return dDay;
	}
	public void setdDay(String dDay)
	{
		this.dDay = dDay;
	}
	public String getPrjStart()
	{
		return prjStart;
	}
	public void setPrjStart(String prjStart)
	{
		this.prjStart = prjStart;
	}
	public String getPrjEnd()
	{
		return prjEnd;
	}
	public void setPrjEnd(String prjEnd)
	{
		this.prjEnd = prjEnd;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
}