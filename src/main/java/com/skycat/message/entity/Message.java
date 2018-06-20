package com.skycat.message.entity;

import java.util.Date;

public class Message {
    private Integer messageId;

    private String messageTitle;

    private String messageInfo;

    private Date time;

    private Integer messagerId;

    private Integer receiverId;

    private Integer messageType;

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public String getMessageTitle() {
        return messageTitle;
    }

    public void setMessageTitle(String messageTitle) {
        this.messageTitle = messageTitle == null ? null : messageTitle.trim();
    }

    public String getMessageInfo() {
        return messageInfo;
    }

    public void setMessageInfo(String messageInfo) {
        this.messageInfo = messageInfo == null ? null : messageInfo.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getMessagerId() {
        return messagerId;
    }

    public void setMessagerId(Integer messagerId) {
        this.messagerId = messagerId;
    }

    public Integer getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(Integer receiverId) {
        this.receiverId = receiverId;
    }

    public Integer getMessageType() {
        return messageType;
    }

    public void setMessageType(Integer messageType) {
        this.messageType = messageType;
    }

	@Override
	public String toString() {
		return "Message [messageId=" + messageId + ", messageTitle=" + messageTitle + ", messageInfo=" + messageInfo
				+ ", time=" + time + ", messagerId=" + messagerId + ", receiverId=" + receiverId + ", messageType="
				+ messageType + "]";
	}
    
    
}