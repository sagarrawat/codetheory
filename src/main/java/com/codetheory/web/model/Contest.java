package com.codetheory.web.model;

import com.codetheory.web.constant.OrganizationType;
import java.util.Date;
import com.codetheory.web.constant.ContestStatus;

public class Contest {

	private String contestname;
	private Date startDate;
	private Date endDate;
	private Date creationDate;
	private String orgName;
	private String info;
	private String landingPage;
	private OrganizationType orgType;
	private ContestStatus status;
	private boolean hasTimeLimit;
	private boolean isOpen;
	
	
	public Contest(){
		orgName = "codeTheory";
		startDate = new Date();
		endDate = new Date();
		creationDate = new Date();
		isOpen = false;
		hasTimeLimit = true;
	}

	public Contest(Contest con){
		contestname = con.contestname;
		orgName = con.contestname;
		startDate = con.startDate;
		endDate = con.endDate;
		creationDate =con.creationDate;
		orgType = con.orgType;
		hasTimeLimit = con.hasTimeLimit;
		status = con.status;
		isOpen = con.isOpen;
	}
	/**
	 * @return the contestname
	 */
	public String getContestname() {
		return contestname;
	}

	/**
	 * @param contestname the contestname to set
	 */
	public void setContestname(String contestname) {
		this.contestname = contestname;
	}

	/**
	 * @return the startDate
	 */
	public Date getStartDate() {
		return startDate;
	}

	/**
	 * @param startDate the startDate to set
	 */
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	/**
	 * @return the endDate
	 */
	public Date getEndDate() {
		return endDate;
	}

	/**
	 * @param endDate the endDate to set
	 */
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	/**
	 * @return the orgType
	 */
	public OrganizationType getOrgType() {
		return orgType;
	}

	/**
	 * @param orgType the orgType to set
	 */
	public void setOrgType(OrganizationType orgType) {
		this.orgType = orgType;
	}

	/**
	 * @return the orgName
	 */
	public String getOrgName() {
		return orgName;
	}

	/**
	 * @param orgName the orgName to set
	 */
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	/**
	 * @return the creationDate
	 */
	public Date getCreationDate() {
		return creationDate;
	}

	/**
	 * @param creationDate the creationDate to set
	 */
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public void setLandingPage (String landingPage){
		this.landingPage = landingPage;
	}

	public String getLandingPage (){
		return landingPage;
	}

	public void setinfo(String info){
		this.info = info;
	}
	public String getinfo(){
		return info;
	}


	public void sethasTimeLimit (boolean hasTimeLimit){
		this.hasTimeLimit = hasTimeLimit;
	}

	public boolean gethasTimeLimit () {
		return hasTimeLimit;
	}

	public void setIsOpen (boolean isopen){
		this.isOpen = isopen;
	}

	public boolean getIsOpen () {
		return isOpen;
	}

	public void setStatus (ContestStatus status){
		this.status = status;
	}
	public ContestStatus getStatus (){
		return status;
	}
}