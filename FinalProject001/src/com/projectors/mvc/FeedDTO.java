package com.projectors.mvc;

public class FeedDTO
{
	private int feedNo;							   // 담벼락 번호
	private String finalNo, content, createdDate;  // 최종합류번호, 내용, 등록일
	
	// getter setter
	public int getFeedNo()
	{
		return feedNo;
	}
	public void setFeedNo(int feedNo)
	{
		this.feedNo = feedNo;
	}
	public String getFinalNo()
	{
		return finalNo;
	}
	public void setFinalNo(String finalNo)
	{
		this.finalNo = finalNo;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getCreatedDate()
	{
		return createdDate;
	}
	public void setCreatedDate(String createdDate)
	{
		this.createdDate = createdDate;
	}
	
	
}
