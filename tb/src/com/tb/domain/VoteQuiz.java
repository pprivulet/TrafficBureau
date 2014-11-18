package com.tb.domain;

public class VoteQuiz extends BaseEntity {

	private Integer id;

	private Integer voteThemeId;

	private String content;

	private String created;

	private String updated;
	
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public Integer getVoteThemeId() {
		return voteThemeId;
	}

	public void setVoteThemeId(Integer voteThemeId) {
		this.voteThemeId = voteThemeId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUpdated() {
		return updated;
	}

	public void setUpdated(String updated) {
		this.updated = updated;
	}
	
	

}
