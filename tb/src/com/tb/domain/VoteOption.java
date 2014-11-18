package com.tb.domain;

public class VoteOption extends BaseEntity {

	private Integer id;
	
	private Integer index;

	private Integer voteThemeId;

	private Integer voteQuizId;

	private Integer vote;

	private String content;

	private String created;

	private String updated;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
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

	public Integer getVoteQuizId() {
		return voteQuizId;
	}

	public void setVoteQuizId(Integer voteQuizId) {		
		this.voteQuizId = voteQuizId;
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

	public Integer getVote() {
		return vote;
	}

	public void setVote(Integer vote) {
		this.vote = vote;
	}
}
